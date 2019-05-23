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
        async public Task<object> 获取教学专业(教学专业Filter filter)
        {
            return await Db.GetListSpAsync<教学专业, 教学专业Filter>(filter, orderType: true);
        }

        [HttpPost]
        async public Task<object> 增改教学专业([FromBody] 教学专业 data) =>
            await Db.Merge(data);

        /// <summary>
        /// 获取某个专业下的专业科室时,可以用这个
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某教学专业下的科室(
            //[Required(ErrorMessage = "请输入教学专业编号")] int 教学专业编号,
            教学专业科室Filter filter)
        {
            //filter.教学专业编号 = 教学专业编号;
            return await Db.GetListSpAsync<v_教学专业科室, 教学专业科室Filter>(filter);
        }

        [HttpGet]
        async public Task<object> 分页获取某教学专业下的科室(
            Paging paging,
            //[Required(ErrorMessage = "请输入教学专业编号")] int 教学专业编号,
            教学专业科室Filter filter)
        {
            //filter.教学专业编号 = 教学专业编号;
            return await Db.GetPagingListSpAsync<v_教学专业科室, 教学专业科室Filter>(paging, filter);
        }

        /// <summary>
        /// 这个data中的教学专业编号要自己填好传上来,
        /// 这个应该带个"是否启用"的属性,并提供启禁接口,不过暂时没提供;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改某教学专业下的科室([FromBody] PredefindedIdList<教学专业科室> data) =>
            await Db.Merge(data.Id, data.List);

        [HttpGet]
        async public Task<object> 分页获取某个教学专业科室的教学要求(
            Paging paging,
            //[Required(ErrorMessage = "请输入教学专业科室编号")] int 教学专业科室编号,
            教学专业科室要求Filter filter)
        {
            //filter.教学专业科室编号 = 教学专业科室编号;
            return await Db.GetPagingListSpAsync<v_教学专业科室要求, 教学专业科室要求Filter>(paging, filter);
        }

        [HttpGet]
        async public Task<object> 获取某个教学专业科室的教学要求(教学专业科室要求Filter filter)
        {
            return await Db.GetListSpAsync<v_教学专业科室要求, 教学专业科室要求Filter>(filter);
        }

        /// <summary>
        /// 这个不会删除fid相同,但编号不符合的数据;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 批量增改教学专业科室要求([FromBody] PredefindedIdList<教学专业科室要求> data)
        {
            return await Db.Merge(data.Id, data.List);
        }

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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <param name="教学专业科室编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取某个教学专业科室的教学任务(
            Paging paging,
            //[Required(ErrorMessage = "请输入教学专业科室编号")] int 教学专业科室编号,
            教学专业科室任务Filter filter
            )
        {
            //filter.教学专业科室编号 = 教学专业科室编号;
            return await Db.GetPagingListSpAsync<v_教学专业科室任务, 教学专业科室任务Filter>(paging, filter);
        }

        /// <summary>
        /// 不分页的
        /// </summary>
        /// <param name="filter"></param>
        /// <param name="教学专业科室编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某个教学专业科室的教学任务(
            //[Required(ErrorMessage = "请输入教学专业科室编号")] int 教学专业科室编号,
            教学专业科室任务Filter filter)
        {
            //filter.教学专业科室编号 = 教学专业科室编号;
            return await Db.GetListSpAsync<v_教学专业科室任务, 教学专业科室任务Filter>(filter);
        }

        [HttpPost]
        async public Task<object> 增改某个教学专业科室的教学任务([FromBody] PredefindedIdList<教学专业科室任务> data) =>
            await Db.Merge(data.Id, data.List);

        [HttpPost]
        async public Task 批量删除教学专业科室任务([FromBody]IEnumerable<int> data) =>
            await Db.Delete<教学专业科室任务>(data);

        /// <summary>
        /// 注意其中有"是否启用"筛选条件,管理时不用带,全部都选出来管理;
        /// 使用时,一般要带该条件为真的条件;有效的才能使用;
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学本院策略(教学本院策略Filter filter) =>
            await Db.GetListSpAsync<v_教学本院策略, 教学本院策略Filter>(filter);

        [HttpPost]
        async public Task<object> 增改教学本院策略([FromBody]教学本院策略 data) =>
            await Db.Merge(data);

        //[HttpPost]
        //async public Task 启用教学本院策略([FromBody]int 教学本院策略编号) => await Db.Enable<教学本院策略>(教学本院策略编号);

        //[HttpPost]
        //async public Task 禁用教学本院策略([FromBody]int 教学本院策略编号) => await Db.Disable<教学本院策略>(教学本院策略编号);

        [HttpPost]
        async public Task 启用某些教学本院策略([FromBody]IEnumerable<int> data)
        {
            await Db.Enable<教学本院策略>(data);
        }

        [HttpPost]
        async public Task 禁用某些教学本院策略([FromBody]IEnumerable<int> data)
        {
            await Db.Disable<教学本院策略>(data);
        }

        [HttpGet]
        async public Task<object> 获取某教学本院策略下的科室(教学本院科室Filter filter)
        {
            return await Db.GetListSpAsync<v_教学本院科室, 教学本院科室Filter>(filter);
        }

        /// <summary>
        /// 这个就自带删除了,
        /// 教学本院科室任务需要另外设置;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改某教学本院策略下的科室([FromBody]PredefindedIdList<教学本院科室> data)
        {
            ////这个是否可以放到sp里面去;
            //foreach (var item in data.List)
            //{
            //    item.教学本院策略编号 = data.Id;
            //}
            return await Db.Merge(data.Id, data.List);
        }

        [HttpGet]
        async public Task<object> 获取某教学本院科室下的任务(
            教学本院科室任务Filter filter)
        {
            return await Db.GetListSpAsync<教学本院科室任务, 教学本院科室任务Filter>(filter);
        }

        [HttpPost]
        async public Task<object> 增改某教学本院科室下的任务([FromBody]PredefindedIdList<教学本院科室任务> data)
        {
            return await Db.Merge(data.Id, data.List);
        }

        [HttpPost]
        async public Task 批量删除教学本院科室任务([FromBody]IEnumerable<int> data) =>
            await Db.Delete<教学本院科室任务>(data);

        /// <summary>
        /// 目前只有查看,且没有分页;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学活动类型() =>
            await Db.GetListSpAsync<教学活动类型>(orderType: true);

        /// <summary>
        /// 这个只有修改,没有增加的功能,如果来个编号=0的不会发生任何事情;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改教学活动类型([FromBody]教学活动类型 data) =>
            await Db.Merge(data);

        [HttpGet]
        async public Task<object> 获取某教学活动分类下的评价项目(教学活动评价项目Filter filter)
        {
            return await Db.GetListSpAsync<教学活动评价项目, 教学活动评价项目Filter>(filter, orderType: true);
        }

        [HttpPost]
        async public Task<object> 增改某教学活动类型下的评价项目([FromBody]PredefindedIdList<教学活动评价项目> data)
        {
            return await Db.Merge(data.Id, data.List);
        }

        [HttpPost]
        async public Task 启用某些教学活动评价项目([FromBody]IEnumerable<int> data)
        {
            await Db.Enable<教学活动评价项目>(data);
        }

        [HttpPost]
        async public Task 禁用某些教学活动评价项目([FromBody]IEnumerable<int> data)
        {
            await Db.Disable<教学活动评价项目>(data);
        }

        [HttpGet]
        async public Task<object> 获取教学360评价方向() =>
            await Db.GetListSpAsync<v_教学360评价方向>(orderType: true);

        [HttpGet]
        async public Task<object> 获取某目标类型的教学360评价分类(教学360评价分类Filter filter)
        {
            return await Db.GetListSpAsync<v_教学360评价分类, 教学360评价分类Filter>(filter, orderType: true);
        }

        [HttpGet]
        async public Task<object> 获取某教学360评价分类下的评价项目(教学360评价项目Filter filter)
        {
            //filter.教学360评价分类编号 = 教学360评价分类编号;
            return await Db.GetListSpAsync<教学360评价项目, 教学360评价项目Filter>(filter, orderType: true);
        }

        [HttpPost]
        async public Task<object> 增改某教学360评价分类下的评价项目([FromBody]PredefindedIdList<教学360评价项目> data)
        {
            return await Db.Merge(data.Id, data.List);
        }

        [HttpPost]
        async public Task 启用某些教学360评价项目([FromBody]IEnumerable<int> data)
        {
            await Db.Enable<教学360评价项目>(data);
        }

        [HttpPost]
        async public Task 禁用某些教学360评价项目([FromBody]IEnumerable<int> data)
        {
            await Db.Disable<教学360评价项目>(data);
        }
    }
}