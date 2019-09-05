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

namespace ScientificResearch.Areas.ContinuousTraining.Controllers
{
    /// <summary>
    /// 基本上,和系统管理-权限管理功能对应;
    /// </summary>
    public class PermissionController : ContinuousTrainingBaseController
    {
        /// <summary>
        /// 分页获取登录日志
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<PagingResult<登录日志>> 分页获取登录日志(Paging paging, 登录日志Filter filter)
        {
            return await Db.GetPagingListSpAsync<登录日志, 登录日志Filter>(paging, filter, orderType: false);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取继教角色列表() =>
            await Db.GetListSpAsync<v_继教角色>(orderType: true);

        /// <summary>
        /// 暂时不对外提供
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改继教角色([FromBody]继教角色 data) => await Task.FromResult(Content("暂不提供"));
        //await Db.Merge(data);

        /// <summary>
        /// 如果要获取"某角色中的人员",则搜索条件为:角色编号 = 该角色编号,该人员是否属于该角色=true
        /// 如果要获取"某角色中没有的人员",则搜索条件为:角色编号 = 该角色编号,该人员是否属于该角色=false
        /// 如果要获取"某人员的角色",则搜索条件为:编号 = 该人员编号,该人员是否属于该角色=true
        /// 如果要获取"某人员没有的角色",则搜索条件为:编号 = 该人员编号,该人员是否属于该角色=false
        /// </summary>
        /// <param name="继教角色编号"></param>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取继教人员角色(Paging paging, 继教角色人员Filter filter) =>
            await Db.GetPagingListSpAsync<v_继教人员_带部门名, 继教角色人员Filter>(paging, filter, nameof(v_继教角色人员));



        /// <summary>
        /// 
        /// </summary>
        /// <param name="data">id表示继教角色编号</param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改某继教角色中的人员([FromBody]PredefindedIdList<继教人员角色> data)
        {
            return await Db.Merge(data.Id, data.List);
        }

        /// <summary>
        /// 没有的权限也会获取出来,以"该角色是否拥有该权限" = flase 来标识;
        /// </summary>
        /// <param name="继教角色编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取继教角色的权限(继教角色权限Filter filter) =>
            await Db.GetListSpAsync<v_继教角色权限, 继教角色权限Filter>(filter, orderType: true);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改继教某角色的权限([FromBody]PredefindedIdList<继教角色权限> data)
        {
            return await Db.Merge(data.Id, data.List);
        }

        /// <summary>
        /// 没有的权限也会获取出来,以"该角色是否拥有该权限" = flase 来标识;
        /// </summary>
        /// <param name="继教角色编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取继教微信端角色的权限(继教微信角色权限Filter filter) =>
            await Db.GetListSpAsync<v_继教微信角色权限, 继教微信角色权限Filter>(filter, orderType: true);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改继教微信端某角色的权限([FromBody]PredefindedIdList<继教微信角色权限> data)
        {
            return await Db.Merge(data.Id, data.List);
        }
    }
}