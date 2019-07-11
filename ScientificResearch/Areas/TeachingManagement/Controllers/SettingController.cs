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
        /// id表示教学本院策略的编号;
        /// 教学本院科室任务需要另外设置;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改某教学本院策略下的科室([FromBody]PredefindedIdList<教学本院科室> data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                foreach (var item in data.List.Where(i => i.编号 == 0))
                {
                    var 将增加的教学本院科室任务列表 = new List<教学本院科室任务>();
                    //如果是新增一个教学本院科室对应关系,则需要同时新增其相应的任务;
                    var 新增的教学本院科室 = await dbForTransaction.Merge(data.Id, item, transaction);
                    var 新增的教学本院科室对应的专业科室任务列表 =
                        await dbForTransaction.GetListSpAsync<教学专业科室任务, 教学专业科室任务Filter>
                        (new 教学专业科室任务Filter()
                        {
                            教学专业科室编号 = item.教学专业科室编号
                        }, transaction: transaction);

                    foreach (var 新增的教学本院科室对应的专业科室任务 in 新增的教学本院科室对应的专业科室任务列表)
                    {
                        var 将增加的教学本院科室任务 = new 教学本院科室任务()
                        {
                            编号 = 0,
                            教学本院科室编号 = 新增的教学本院科室.编号,
                            项目名称 = 新增的教学本院科室对应的专业科室任务.项目名称,
                            任务类型编号 = 新增的教学本院科室对应的专业科室任务.任务类型编号,
                            是否门诊 = 新增的教学本院科室对应的专业科室任务.是否门诊,
                            是否病房 = 新增的教学本院科室对应的专业科室任务.是否病房,
                            是否医技 = 新增的教学本院科室对应的专业科室任务.是否医技,
                            最低评分要求 = 新增的教学本院科室对应的专业科室任务.最低评分要求,
                            数量要求 = 新增的教学本院科室对应的专业科室任务.数量要求,
                            备注 = 新增的教学本院科室对应的专业科室任务.备注,
                        };
                        将增加的教学本院科室任务列表.Add(将增加的教学本院科室任务);
                    }
                    await dbForTransaction.Merge(新增的教学本院科室.编号, 将增加的教学本院科室任务列表.AsEnumerable(), transaction);
                }

                //修改的,能否修改?能否修改科室?是否相应修改任务?
                await dbForTransaction.Merge(data.Id, data.List.Where(i => i.编号 != 0), transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
            //return await Db.Merge(data.Id, data.List);
        }

        [HttpPost]
        async public Task 批量删除教学本院科室([FromBody]IEnumerable<int> data) =>
            await Db.Delete<教学本院科室>(data);

        [HttpGet]
        async public Task<object> 分页获取某教学本院科室下的任务(Paging paging,
            教学本院科室任务Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学本院科室任务, 教学本院科室任务Filter>(paging, filter);
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
        async public Task<object> 获取教学360评价目标类型() =>
            await Db.GetListSpAsync<v_教学360评价目标类型>();

        [HttpGet]
        async public Task<object> 获取教学360评价方向(v_教学360评价方向Filter filter) =>
            await Db.GetListSpAsync<v_教学360评价方向, v_教学360评价方向Filter>(filter, orderType: true);

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

        [HttpGet]
        async public Task<object> 获取某目标类型的教学360评价分类和项目(教学360评价分类Filter filter)
        {
            var 分类 = await Db.GetListSpAsync<v_教学360评价分类, 教学360评价分类Filter>(filter, orderType: true);
            var 项目filter = new 教学360评价项目Filter() { WhereIn教学360评价分类编号 = 分类.Select(i => i.编号).ToStringIdWithSpacer() };
            var 项目 = await Db.GetListSpAsync<教学360评价项目, 教学360评价项目Filter>(项目filter, orderType: true);

            return from item in 分类
                   select new
                   {
                       分类信息 = item,
                       分类下的项目 = from item项目 in 项目 where item项目.教学360评价分类编号 == item.编号 select item项目
                   };
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

        [HttpPost]
        async public Task<object> 增改病人([FromBody]教学病人 data)
        {
            return await Db.Merge(data);
        }

        [HttpGet]
        async public Task<object> 分页获取病人(Paging paging, 教学病人Filter filter) =>
            await Db.GetPagingListSpAsync<教学病人, 教学病人Filter>(paging, filter);
    }
}