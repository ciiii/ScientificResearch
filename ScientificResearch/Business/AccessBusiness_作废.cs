using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Http;

using Dapper;

using ScientificResearch.Infrastucture;
using ScientificResearch.Models;
using MyLib;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace ScientificResearch.Business
{
    /// <summary>
    /// 登录|注销|获取个人权限|个人信息等
    /// </summary>
    public class AccessBusiness : BaseBusiness
    {
        #region 构造
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="httpContext"></param>
        public AccessBusiness(HttpContext httpContext) : base(httpContext) { }
        #endregion

        /// <summary>
        /// login
        /// </summary>
        /// <param name="model"></param>
        /// <param name="IP"></param>
        /// <returns></returns>
        async public Task<object> Login(LoginInfo model, string IP)
        {
            //var where = SqlWhereMapper.toWhere(new LoginInfoFilter() { 工号 = model.工号 });
            //model.DbKey = "ScientificResearch_Model";

            //var dbWhenLogin = new SqlConnection(config.GetValue<string>("connectionString:ScientificResearch").Replace("{0}", model.DbKey));
            var dbWhenLogin = new SqlConnection(DbConnectionString.Replace("{0}", model.DbKey));
            var result = await dbWhenLogin.QueryMultipleSpAsync(
               new sp_登录()
               {
                   工号 = model.工号,
                   密码 = model.密码
               });

            var user = result.Read<CurrentUser>().FirstOrDefault();
            user.DbKey = model.DbKey;
            var permission = result.Read<权限>();

            foreach (var item in permission)
            {
                item.路径 = string.Join("?", (item.路径 ?? "").Split("?").Select(j => Uri.EscapeUriString(j)));
            }


            var rPermission = RecursivePermission(permission, 0);

            Session.Set<CurrentUser>("user", user);

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
        /// logout
        /// </summary>
        /// <returns></returns>
        public void Logout()
        {
            Session.Clear();
        }

    }
}
