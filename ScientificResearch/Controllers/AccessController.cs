using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MyLib;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

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
        /// </summary>
        /// <param name="model">其中dbKey请先填"ScientificResearch_Model"</param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> Login([FromBody]LoginInfo model)
        {
            //var IP = Request.Host.Host;
            var IP = HttpContext.Connection.RemoteIpAddress.ToString();
            //return await MyAccessBusiness.Login(model,IP);

            //var where = SqlWhereMapper.toWhere(new LoginInfoFilter() { 工号 = model.工号 });
            //model.DbKey = "ScientificResearch_Model";

            //var dbWhenLogin = new SqlConnection(config.GetValue<string>("connectionString:ScientificResearch").Replace("{0}", model.DbKey));
            var dbWhenLogin = new SqlConnection(DbConnectionStringLack.Replace("{0}", model.DbKey));
            var result = await dbWhenLogin.QueryMultipleSpAsync(
               new sp_登录()
               {
                   工号 = model.工号,
                   密码 = model.密码
               });

            var user = result.Read<CurrentUser>().FirstOrDefault();
            user.DbKey = model.DbKey;
            var permission = result.Read<权限>();

            //处理一下中文
            foreach (var item in permission)
            {
                item.路径 = string.Join("?", (item.路径 ?? "").Split("?").Select(j => Uri.EscapeUriString(j)));
            }

            var rPermission = RecursivePermission(permission, 0);

            HttpContext.Session.Set<CurrentUser>("user", user);

            await Db.ExecuteSpAsync(
                new sp_登录日志_增()
                {
                    tt_登录日志 = new 登录日志()
                    {
                        工号 = user.工号,
                        姓名 = user.姓名,
                        IP = IP
                    }.ToDataTable()
                });

            return new { 人员 = user, 权限 = rPermission };
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
        /// </summary>
        [HttpPost]
        public void Logout() =>HttpContext.Session.Clear();

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
        async public Task<PagingResult<登录日志>> 获取登录日志(Paging paging, 登录日志Filter filter) =>
            await Db.GetPagingListSpAsync<登录日志,登录日志Filter>(paging, filter,orderType:false);

    }
}