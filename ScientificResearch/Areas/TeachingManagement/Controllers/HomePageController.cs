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
    /// 主页相关的接口
    /// 获取权限也在这里面
    /// 这个不能抽象为一个独立的area/架构/微服务,因为各自不同;
    /// </summary>
    public class HomePageController : TeachingManagementBaseController
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
            var permission = await Db.GetListSpAsync<教学权限>($"tfn_教学人员的权限('{CurrentUser.工号}')", orderStr: "排序值", orderType: true);
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
                       菜单 = item,
                       子级菜单 = RecursivePermission(permission, item.编号)
                   };
        }
    }
}