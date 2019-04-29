using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
    /// 基本上,和系统管理-权限管理功能对应;
    /// </summary>
    public class PermissionController : TeachingManagementBaseController
    {
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

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学角色列表() =>
            await Db.GetListSpAsync<v_教学角色>(orderType: true);

        /// <summary>
        /// 暂时不对外提供
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改教学角色([FromBody]教学角色 data) => await Task.FromResult(Content("暂不提供"));
        //await Db.Merge(data);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="教学角色编号"></param>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取教学角色中的人员([Required]int 教学角色编号, Paging paging, 教学人员Filter filter) =>
            await Db.GetPagingListSpAsync<v_教学人员, 教学人员Filter>(paging, filter, $"tfn_教学角色中的人员({教学角色编号})");

        [HttpGet]
        async public Task<object> 获取教学角色中的人员([Required]int 教学角色编号, 教学人员Filter filter) =>
            await Db.GetListSpAsync<v_教学人员, 教学人员Filter>(filter, $"tfn_教学角色中的人员({教学角色编号})");

        /// <summary>
        /// 
        /// </summary>
        /// <param name="教学角色编号"></param>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取教学角色中没有的人员([Required]int 教学角色编号, Paging paging, 教学人员Filter filter) =>
            await Db.GetPagingListSpAsync<v_教学人员, 教学人员Filter>(paging, filter, $"tfn_教学角色中没有的人员({教学角色编号})");

        /// <summary>
        /// 注意不是同时修改一个教学角色+该角色下有哪些人员哈;
        /// </summary>
        /// <param name="data">id表示教学角色编号</param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改某教学角色中的人员([FromBody]PredefindedIdList<教学人员角色> data)
        {
            //foreach (var item in data.List)
            //{
            //    item.教学角色编号 = data.Id;
            //}
            return await Db.Merge(data.Id, data.List);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="教学角色编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学角色的权限(int 教学角色编号) =>
            await Db.GetListSpAsync<object>($"tfn_教学角色的权限({教学角色编号})", orderType: true);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改某教学角色的权限([FromBody]PredefindedIdList<教学角色权限> data)
        {
            return await Db.Merge(data.Id, data.List);
        }
    }
}