using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    /// <summary>
    /// 系统设置中的培训设置 教学活动设置 360评价设置
    /// </summary>
    public class SettingController : TeachingManagementBaseController
    {
        [HttpGet]
        async public Task<object> 获取教学专业()
        {
            return await Db.GetListSpAsync<教学专业>(orderType: true);
        }

        [HttpPost]
        async public Task<object> 增改教学专业([FromBody] 教学专业 data) =>
            await Db.Merge(data);

        [HttpGet]
        async public Task<object> 分页获取教学专业科室(Paging paging, 教学专业Filter filter) =>
            await Db.GetPagingListSpAsync<v_教学专业科室, 教学专业Filter>(paging, filter);

        [HttpPost]
        async public Task<object> 增改教学专业科室([FromBody] 教学专业科室 data) =>
            await Db.Merge(data);

        [HttpGet]
        async public Task<object> 分页获取某个教学专业科室的教学要求(
            Paging paging,
            教学专业科室要求Filter filter,
            [Required(ErrorMessage = "请输入教学专业科室编号")] int 教学专业科室编号)
        {
            filter.教学专业科室编号 = 教学专业科室编号;
            return await Db.GetPagingListSpAsync<教学专业科室要求, 教学专业科室要求Filter>(paging, filter);
        }

        /// <summary>
        /// 这个不会删除fid相同,但编号不符合的数据;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 批量增改教学专业科室要求([FromBody] IEnumerable<教学专业科室要求> data) =>
            await Db.Merge(data);

        /// <summary>
        /// 这个可以删除;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 批量删除教学专业科室要求([FromBody]IEnumerable<int> data) =>
            await Db.Delete<教学专业科室要求>(data);

        /// <summary>
        /// 查看,这个目前是定死的"技能"/"疾病",
        /// 后期很可能有额外的属性加入;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学专业科室任务类型() =>
            await Db.GetListSpAsync<教学专业科室任务类型>();


        [HttpGet]
        async public Task<object> 分页获取某个教学专业科室的教学任务(
            Paging paging,
            教学专业科室任务Filter filter,
            [Required(ErrorMessage = "请输入教学专业科室编号")] int 教学专业科室编号)
        {
            filter.教学专业科室编号 = 教学专业科室编号;
            return await Db.GetPagingListSpAsync<v_教学专业科室任务, 教学专业科室任务Filter>(paging, filter);
        }

        [HttpPost]
        async public Task<object> 批量增改教学专业科室任务([FromBody] IEnumerable<教学专业科室任务> data) =>
            await Db.Merge(data);

        [HttpPost]
        async public Task 批量删除教学专业科室任务([FromBody]IEnumerable<int> data) =>
            await Db.Delete<教学专业科室任务>(data);

        [HttpGet]
        async public Task<object> 获取教学本院策略(教学本院策略Filter filter) =>
            await Db.GetListSpAsync<v_教学本院策略, 教学本院策略Filter>(filter);

        [HttpPost]
        async public Task<object> 增改教学本院策略([FromBody]教学本院策略 data) =>
            await Db.Merge(data);

        [HttpPost]
        async public Task 启用教学本院策略([FromBody]int 教学本院策略编号)=> await Db.Enable<教学本院策略>(教学本院策略编号);

        [HttpPost]
        async public Task 禁用教学本院策略([FromBody]int 教学本院策略编号) => await Db.Disable<教学本院策略>(教学本院策略编号);
    }
}