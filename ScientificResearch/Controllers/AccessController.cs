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


namespace ScientificResearch.Controllers
{
    /// <summary>
    /// 登录|注销|获取权限等相关接口
    /// </summary>
    public class AccessController : BaseController
    {
        /// <summary>
        /// 要用到的业务
        /// </summary>
        //private AccessBusiness MyAccessBusiness
        //{
        //    get
        //    {
        //        return new AccessBusiness(HttpContext);
        //    }
        //}

        /// <summary>
        /// 登录,返回登录人所具有的权限
        /// TODO:废除,改用Manage里面的login+这里的获取权限接口;
        /// </summary>
        /// <param name="model">其中dbKey请先填"ScientificResearch_Model"</param>
        /// <returns></returns>
        //jwt 6/4
        [AllowAnonymous]
        [HttpPost]
        async public Task<object> Login([FromBody]LoginInfo model)
        {
            //var IP = Request.Host.Host;
            var IP = HttpContext.Connection.RemoteIpAddress.ToString();

            var dbWhenLogin = new SqlConnection(DbConnectionStringLack.Replace("{0}", model.DbKey));
            var result = await dbWhenLogin.QueryMultipleSpAsync(
               new sp_登录()
               {
                   工号 = model.工号,
                   密码 = model.密码
               });

            var user = result.Read<CurrentUser>().FirstOrDefault();
            user.DbKey = model.DbKey;

            //jwt 3/4 这个可以做个toClaims方法;反射某对象每个属性,放到一个claim
            var claims = new[] {
                        //加入用户的名称
                        new Claim(nameof( user.姓名),user.姓名),
                        new Claim(nameof( user.工号),user.工号),
                        new Claim(nameof( user.编号),user.编号.ToString()),
                        new Claim(nameof( user.部门编号),user.部门编号.ToString()),
                        new Claim(nameof( user.部门名称),user.部门名称),
                        new Claim(nameof( user.DbKey),user.DbKey),

                        #region 默认的一些设置
		                //下边为Claim的默认配置
                        //new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                        //new Claim(JwtRegisteredClaimNames.Iat, $"{new DateTimeOffset(DateTime.Now).ToUnixTimeSeconds()}"),
                        //new Claim(JwtRegisteredClaimNames.Nbf,$"{new DateTimeOffset(DateTime.Now).ToUnixTimeSeconds()}") ,
                        ////这个就是过期时间，目前是过期100秒，可自定义，注意JWT有自己的缓冲过期时间
                        //new Claim (JwtRegisteredClaimNames.Exp,$"{new DateTimeOffset(DateTime.Now.AddSeconds(100)).ToUnixTimeSeconds()}"),
                        //new Claim(JwtRegisteredClaimNames.Iss,"Blog.Core"),
                        //new Claim(JwtRegisteredClaimNames.Aud,"wr"),
                        ////这个Role是官方UseAuthentication要要验证的Role，我们就不用手动设置Role这个属性了
                        //new Claim(ClaimTypes.Role,tokenModel.Role),

                        //iss ： jwt签发者
                        //sub：jwt所面向的用户
                        //aud：接收jwt的一方
                        //exp：jwt的过期时间，这个过期时间必须要大于签发时间
                        //nbf：定义在什么时间之前，该jwt都是不可用的.
                        //iat ：jwt的签发时间
                        //jti  ：jwt的唯一身份标识，主要用来作为一次性token,从而回避重放攻击 
	                    #endregion
                    };

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

            var permission = result.Read<权限>();

            //处理一下中文
            foreach (var item in permission)
            {
                item.路径 = string.Join("?", (item.路径 ?? "").Split("?").Select(j => Uri.EscapeUriString(j)));
            }

            var rPermission = RecursivePermission(permission, 0);

            //去掉session  -1
            //HttpContext.Session.Set<CurrentUser>("user", user);

            await dbWhenLogin.ExecuteSpAsync(
                new sp_登录日志_增()
                {
                    tt_登录日志 = new 登录日志()
                    {
                        工号 = user.工号,
                        姓名 = user.姓名,
                        IP = IP
                    }.ToDataTable()
                });

            return new
            {
                人员 = user,
                权限 = rPermission,
                access_token = new JwtSecurityTokenHandler().WriteToken(token),
                token_type = "Bearer"
            };
        }

        /// <summary>
        /// 获取科研系统pc端的功能菜单;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取权限菜单()
        {
            var permission = await Db.GetListSpAsync<权限>($"tfn_人员的权限('{CurrentUser.工号}')", orderStr: "排序");
            //处理一下中文
            foreach (var item in permission)
            {
                item.路径 = string.Join("?", (item.路径 ?? "").Split("?").Select(j => Uri.EscapeUriString(j)));
            }

            var rPermission = RecursivePermission(permission, 0);

            return rPermission;
        }

        /// <summary>
        /// 权限分层次
        /// </summary>
        /// <param name="permission"></param>
        /// <param name="topId"></param>
        /// <returns></returns>
        private object RecursivePermission(IEnumerable<权限> permission, int topId)
        {
            return from item in permission
                   where item.上级编号 == topId
                   select new
                   {
                       菜单 = item,
                       子级菜单 = RecursivePermission(permission, item.编号)
                   };
        }

        /// <summary>
        /// 注销当前登录
        /// TODO:用了jwt,这个好像没啥用了
        /// </summary>
        [HttpPost]
        public void Logout() => HttpContext.Session.Clear();

        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="oldPassword"></param>
        /// <param name="newPassword"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task ChangePassword([FromBody]ChangePassword model) =>
            await Db.ExecuteSpAsync(new sp_人员_修改密码()
            {
                工号 = CurrentUser.工号,
                旧密码 = model.旧密码,
                新密码 = model.新密码
            });
        //await MyAccessBusiness.ChangePassword(model);

        /// <summary>
        /// 分页获取登录日志
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<PagingResult<登录日志>> 获取登录日志(Paging paging, 登录日志Filter filter)
        {
            return await Db.GetPagingListSpAsync<登录日志, 登录日志Filter>(paging, filter, orderType: false);
        }

        //2018-10-24 在服务器环境出错
        //[HttpGet]
        //async public Task<PagingResult<VM登录日志>> 获取登录日志(Paging paging, 登录日志Filter filter)
        //{

        //    var result = await Db.GetPagingListSpAsync<登录日志, 登录日志Filter>(paging, filter, orderType: false);
        //    return new PagingResult<VM登录日志>
        //    {
        //        total = result.total,
        //        list = from item in result.list
        //               select new VM登录日志
        //               {
        //                   编号 = item.编号,
        //                   工号 = item.工号,
        //                   姓名 = item.姓名,
        //                   登录时间 = item.登录时间,
        //                   IP = item.IP,
        //                   地域 = IPTools.Core.IpTool.Search(item.IP)
        //               }
        //    };
        //}

    }
}