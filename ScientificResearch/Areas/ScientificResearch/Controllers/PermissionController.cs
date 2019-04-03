using System;
using System.Collections.Generic;
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
    /// 权限管理接口
    /// </summary>
    public class PermissionController : ScientificResearchBaseController
    {
        /// <summary>
        /// 获取角色列表
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<IEnumerable<v1_角色>> 获取角色列表() =>
            await Db.GetListSpAsync<v1_角色>(orderType:true);

        /// <summary>
        /// 新增角色
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增角色([FromBody]角色 model) =>
            await Db.ExecuteSpAsync(new sp_角色_增改() { tt_角色 = model.ToDataTable() });

        /// <summary>
        /// 修改角色
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 修改角色([FromBody]角色 model) =>
            await Db.ExecuteSpAsync(new sp_角色_增改() { tt_角色 = model.ToDataTable() });

        /// <summary>
        /// 分页获取某个角色中的人员
        /// </summary>
        /// <param name="id"></param>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<PagingResult<v1_人员_带部门名>> 分页获取角色中的人员(int 角色编号, Paging paging, 人员Filter filter) =>
            await Db.GetPagingListSpAsync<v1_人员_带部门名, 人员Filter>(paging, filter, $"tfn_角色中的人员({角色编号})");

        /// <summary>
        /// 分页获取角色中没有的人员
        /// </summary>
        /// <param name="id"></param>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<PagingResult<v1_人员_带部门名>> 分页获取角色中没有的人员(int 角色编号, Paging paging, 人员Filter filter) =>
            await Db.GetPagingListSpAsync<v1_人员_带部门名, 人员Filter>(paging, filter, $"tfn_角色中没有的人员({角色编号})");

        /// <summary>
        /// 保存角色中的人员,传入角色编号+属于该角色的人员编号列表;不存在于该列表的原有人员将被删除;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async private Task 保存角色中的人员([FromBody]某角色中的人员 model) =>
            await Db.ExecuteSpAsync(new sp_角色中的人员_增改删()
            {
                角色编号 = model.角色编号,
                人员编号 = model.人员编号列表.ToPredefindedKeyFieldsList().ToDataTable()
            });

        /// <summary>
        /// 向某角色添加人员
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 添加角色人员([FromBody]某角色中的人员 model) =>
            await Db.ExecuteSpAsync(new sp_角色中的人员_增
            {
                角色编号 = model.角色编号,
                人员编号 = model.人员编号列表.ToPredefindedKeyFieldsList().ToDataTable()
            });

        /// <summary>
        /// 从某角色里面删除人员
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 删除角色人员([FromBody]某角色中的人员 model) =>
            await Db.ExecuteSpAsync(new sp_角色中的人员_删
            {
                角色编号 = model.角色编号,
                人员编号 = model.人员编号列表.ToPredefindedKeyFieldsList().ToDataTable()
            });

        /// <summary>
        /// 同时增删角色人员
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增删角色人员([FromBody]增删角色中的人员 model)
        {
            await Db.ExecuteSpAsync(new sp_角色中的人员_增()
            {
                角色编号 = model.角色编号,
                人员编号 = model.将增加的人员编号列表.ToPredefindedKeyFieldsList().ToDataTable()
            });

            await Db.ExecuteSpAsync(new sp_角色中的人员_删()
            {
                角色编号 = model.角色编号,
                人员编号 = model.将删除的人员编号列表.ToPredefindedKeyFieldsList().ToDataTable()
            });
        }


        /// <summary>
        /// 获取所有权限,指定角色拥有的权限为true
        /// </summary>
        /// <param name="角色编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<IEnumerable<v1_角色的权限>> 获取角色的权限(int 角色编号) =>
            await Db.GetListSpAsync<v1_角色的权限>($"tfn_角色的权限({角色编号})");

        /// <summary>
        /// 保存角色的权限,传入角色编号+该角色拥有的权限编号列表,不存在于该列表的原有权限将被删除;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 保存角色的权限([FromBody]某角色的权限 model) =>
            await Db.ExecuteSpAsync(new sp_角色的权限_增改删()
            {
                角色编号 = model.角色编号,
                权限编号 = model.权限编号列表.ToPredefindedKeyFieldsList().ToDataTable()
            });
    }
}