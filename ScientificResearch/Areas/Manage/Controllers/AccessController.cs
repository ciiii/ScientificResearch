using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using MyLib;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;
using Microsoft.AspNetCore.Authorization;

namespace ScientificResearch.Areas.Manage.Controllers
{
    [AllowAnonymous]
    public class AccessController : ManageBaseController
    {
        /// <summary>
        /// 根据code取openid,接着取该openid绑定的用户信息;
        /// OAuthScope.snsapi_base方式回调
        /// </summary>
        /// <param name="code"></param>
        /// <param name="state"></param>
        /// <param name="returnUrl">用户最初尝试进入的页面</param>
        /// <returns>openid</returns>
        async private Task<string> getOpenId(string code)
        {
            if (string.IsNullOrEmpty(code))
            {
                //HttpContext.Response.StatusCode = 401;
                //return Content("您拒绝了授权！");
                throw new Exception("没有code,用户拒绝了授权");
            }

            //TODO:这几个可以写到配置里面去;
            var ApiMpHost = "https://api.weixin.qq.com";
            var appId = "wx5e45aca8fcb270f1";
            var appSecret = "581523b77f235c216243008e5742b1fc";
            var grantType = "authorization_code";

            //通过，用code换取access_token

            var url = string.Format($"{ApiMpHost}/sns/oauth2/access_token?appid={appId}&secret={appSecret}&code={code}&grant_type={grantType}");

            try
            {
                var result = await MyLib.MyHttpLib.MyGetAsync<OAuthAccessTokenResult>(url);

                if (result.errcode != 0)
                {
                    //return Content("错误：" + result.errmsg);
                    throw new Exception("错误：" + result.errmsg);
                }

                return result.openid;
            }
            catch (Exception ex)
            {
                HttpContext.Response.StatusCode = 401;
                //throw new Exception("获取OpenId错误");
                throw new Exception("发生错误：" + ex.ToString());
            }
        }

        /// <summary>
        /// 绑定openid和用户信息
        /// </summary>
        /// <param name="model">其中dbKey请先填"ScientificResearch_Test"</param>
        /// <returns></returns>
        [HttpPost]
        async public Task<LoginReturn<CurrentUser>> BindOpenId([FromBody]LoginInfoWithCode model)
        {
            //验证用户,并记录为一次登录
            var result = await login(model);

            //获取openid
            var openId = await getOpenId(model.Code);

            //绑定openid到用户
            var 绑定关系 = new 人员OpenId() { OpenId = openId, DbKey = model.DbKey, 人员编号 = result.人员.编号 };

            //var dbWhenLogin = new SqlConnection(DbConnectionStringLack.Replace("{0}", model.DbKey));
            //注意是管理库;
            await Db_Manage.Merge(绑定关系);

            return result;
        }

        /// <summary>
        /// 使用OpenId登录
        /// </summary>
        /// <param name="model">其中dbKey请先填"ScientificResearch_Test"</param>
        /// <returns></returns>
        //jwt 6/4
        [HttpPost]
        async public Task<object> LoginWithOpenId([FromBody]Code code)
        {
            //获取openid
            var openId = await getOpenId(code.Value);

            //从主库获取该openid对应的dbkey和人员编号;
            var 绑定信息 = (await Db_Manage.GetListSpAsync<人员OpenId, 人员OpenIdFilter>(new 人员OpenIdFilter() { OpenId = openId })).FirstOrDefault();

            if (绑定信息 == null)
            {
                //return Redirect("http://192.168.0.157:8080/#/login");
                HttpContext.Response.StatusCode = 401;
                return Content("没有绑定用户！");
            }

            //到相对应的从库取用户信息并转为CurrentUser
            var dbWhenLogin = new SqlConnection(DbConnectionStringLack.Replace("{0}", 绑定信息.DbKey));
            var user = await dbWhenLogin.GetModelByIdSpAsync<v1_人员_带部门名>(绑定信息.人员编号);
            var currentUser = Tool.ModelToModel<CurrentUser, v1_人员_带部门名>(user);
            //
            currentUser.DbKey = 绑定信息.DbKey;

            await 记录登录日志(dbWhenLogin, currentUser);

            return getJwt(currentUser, Config.GetValue<string>("Roles:ScientificResearchUser"));
        }

        /// <summary>
        /// 使用用户名密码登录分库,此时不需要提供code
        /// </summary>
        /// <param name="model">其中dbKey请先填"ScientificResearch_Test"</param>
        /// <returns></returns>
        //jwt 6/4
        [HttpPost]
        async public Task<LoginReturn<CurrentUser>> Login([FromBody]LoginInfo model)
        {
            return await login(model);
        }

        /// <summary>
        /// 我们自己人登录管理总库的接口,DbKey为ScientificResearch_Manage 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<LoginReturn<CurrentUserOfManage>> LoginManage([FromBody]LoginInfo model)
        {
            var loginSetting = Config.GetSection("总库登录").Get<LoginInfo>();
            //这里登录用户名叫"工号"只是为了复用LoginInfo类而已;
            if (!MyObject.Compare(model, loginSetting)) throw new Exception("登录信息错误");

            var user = Tool.ModelToModel<CurrentUserOfManage, LoginInfo>(loginSetting);
            return await Task.FromResult(getJwt(user, Config.GetValue<string>("Roles:ManageUser")));
        }

        /// <summary>
        /// 除了"使用登录名密码登录"要用,"绑定openid到用户"也要用,因为后者其实也有一个"使用登录名密码登录"的过程;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        private async Task<LoginReturn<CurrentUser>> login(LoginInfo model)
        {
            var dbWhenLogin = new SqlConnection(DbConnectionStringLack.Replace("{0}", model.DbKey));
            var result = await dbWhenLogin.QueryMultipleSpAsync(
               new sp_登录()
               {
                   工号 = model.工号,
                   密码 = model.密码
               });

            var user = result.Read<CurrentUser>().FirstOrDefault();
            user.DbKey = model.DbKey;

            await 记录登录日志(dbWhenLogin, user);

            return getJwt(user, Config.GetValue<string>("Roles:ScientificResearchUser"));
        }

        /// <summary>
        /// 根据用户信息获取jwt字串,并返回"openid登录""用户名密码登录""绑定openid到用户"的一样的返回信息
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        private LoginReturn<T> getJwt<T>(T user, string role = "")
        //private LoginReturn getJwt(CurrentUser user)
        {
            //jwt 3/4 这个可以做个toClaims方法;反射某对象每个属性,放到一个claim
            //var claims = new[] {
            //            //加入用户的名称
            //            //这里的new Claim的第二个构造参数还不能为null
            //            new Claim(nameof( user.姓名),user.姓名??""),
            //            new Claim(nameof( user.工号),user.工号??""),
            //            new Claim(nameof( user.编号),user.编号.ToString()),
            //            new Claim(nameof( user.部门编号),user.部门编号.ToString()),
            //            new Claim(nameof( user.部门名称),user.部门名称??""),
            //            new Claim(nameof( user.DbKey),user.DbKey),

            //            #region 默认的一些设置
            //      //下边为Claim的默认配置
            //            //new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            //            //new Claim(JwtRegisteredClaimNames.Iat, $"{new DateTimeOffset(DateTime.Now).ToUnixTimeSeconds()}"),
            //            //new Claim(JwtRegisteredClaimNames.Nbf,$"{new DateTimeOffset(DateTime.Now).ToUnixTimeSeconds()}") ,
            //            ////这个就是过期时间，目前是过期100秒，可自定义，注意JWT有自己的缓冲过期时间
            //            //new Claim (JwtRegisteredClaimNames.Exp,$"{new DateTimeOffset(DateTime.Now.AddSeconds(100)).ToUnixTimeSeconds()}"),
            //            //new Claim(JwtRegisteredClaimNames.Iss,"Blog.Core"),
            //            //new Claim(JwtRegisteredClaimNames.Aud,"wr"),
            //            ////这个Role是官方UseAuthentication要要验证的Role，我们就不用手动设置Role这个属性了
            //            //new Claim(ClaimTypes.Role,tokenModel.Role),

            //            //iss ： jwt签发者
            //            //sub：jwt所面向的用户
            //            //aud：接收jwt的一方
            //            //exp：jwt的过期时间，这个过期时间必须要大于签发时间
            //            //nbf：定义在什么时间之前，该jwt都是不可用的.
            //            //iat ：jwt的签发时间
            //            //jti  ：jwt的唯一身份标识，主要用来作为一次性token,从而回避重放攻击 
            //         #endregion
            //        };

            var claims = new List<Claim>();
            var propertys = typeof(T).GetProperties();
            for (int i = 0; i < propertys.Count(); i++)
            {
                var p = propertys[i];
                var v = user.GetValueByPropertyName(p.Name) ?? "";
                claims.Add(new Claim(p.Name, v.ToString()));
            }

            claims.Add(new Claim(ClaimTypes.Role, role));

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Config["JWT:SecurityKey"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var authTime = DateTime.Now;
            var expiresAt = authTime.AddMinutes(10);

            var token = new JwtSecurityToken(
                issuer: Config.GetValue<string>("JWT:ValidIssuer"),          //iss:jwt签发者
                audience: Config.GetValue<string>("JWT:ValidAudience"),        //aud:接收jwt的一方
                claims: claims,
                //expires: expiresAt,
                signingCredentials: creds);

            //去掉session  -1
            //HttpContext.Session.Set<CurrentUser>("user", user);


            return new LoginReturn<T>
            {
                人员 = user,
                access_token = new JwtSecurityTokenHandler().WriteToken(token),
                token_type = "Bearer"
            };
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbWhenLogin"></param>
        /// <param name="user"></param>
        /// <returns></returns>
        private async Task 记录登录日志(SqlConnection dbWhenLogin, CurrentUser user)
        {
            //var IP = Request.Host.Host;
            await dbWhenLogin.ExecuteSpAsync(
                new sp_登录日志_增()
                {
                    tt_登录日志 = new 登录日志()
                    {
                        工号 = user.工号,
                        姓名 = user.姓名,
                        IP = HttpContext.Connection.RemoteIpAddress.ToString()
                    }.ToDataTable()
                });
        }
    }
}