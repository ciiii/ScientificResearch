using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class AccessController : TeachingManagementBaseController
    {
        /// <summary>
        /// login 用manage里面的,这个作废了
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpPost]
        async public Task<object> Login([FromBody]LoginInfo model)
        {
            return await Task.FromResult(Content("请使用总库的login接口"));
        }

        /// <summary>
        /// 获取教学管理pc端的功能菜单;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学权限菜单()
        {
            var permission = await Db.GetListSpAsync<教学权限>($"tfn_教学人员的权限('{CurrentUser.工号}')", orderStr: "排序值", orderType:true);
            //处理一下中文
            //foreach (var item in permission)
            //{
            //    item.路径 = string.Join("?", (item.路径 ?? "").Split("?").Select(j => Uri.EscapeUriString(j)));
            //}

            var rPermission = RecursivePermission(permission, 0);

            return rPermission;
        }

        /// <summary>
        /// 权限分层次
        /// </summary>
        /// <param name="permission"></param>
        /// <param name="topId"></param>
        /// <returns></returns>
        private object RecursivePermission(IEnumerable<教学权限> permission, int topId)
        {
            return from item in permission
                   where item.上级编号 == topId
                   select new
                   {
                       菜单 = item.名称,
                       子级菜单 = RecursivePermission(permission, item.编号)
                   };
        }

        /// <summary>
        /// 修改密码,这个也应该放到manage去 ;
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

        /// <summary>
        /// 分页获取登录日志,这个也应该放到manage去;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<PagingResult<登录日志>> 获取登录日志(Paging paging, 登录日志Filter filter)
        {
            return await Db.GetPagingListSpAsync<登录日志, 登录日志Filter>(paging, filter, orderType: false);
        }
    }
}