using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

using MyLib;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace ScientificResearch.Controllers
{
    public class WorkFlowController : ScientificResearchBaseController
    {
        /// <summary>
        /// 审核等不需要附加动作的操作,可以直接调用这个接口;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 审核步骤([FromBody]完成步骤 model) =>
           await MyWorkFlowBusiness.完成步骤(model, CurrentUser.编号);

        /// <summary>
        /// 其中状态值=-2而已
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 终止步骤([FromBody]完成步骤 model) =>
           await MyWorkFlowBusiness.完成步骤(model, CurrentUser.编号);

        /// <summary>
        /// 附加数据为指定人的编号数组
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 分配步骤指定人([FromBody]完成步骤<IEnumerable<int>> model) =>
            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_步骤指定人_增
                {
                    下一步骤编号 = 0,
                    tt = model.附加数据.ToPredefindedKeyFieldsList().ToDataTable()
                });



        /// <summary>
        /// 获取某步骤的可用操作
        /// </summary>
        /// <param name="步骤编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某步骤的可用操作(int 步骤编号)
        {
            return await Db.GetListSpAsync<object>($"tfn_步骤_可用操作({步骤编号})");
            //return await MyPubicBusiness.GetListSpAsync<object, object>(null, $"tfn_步骤_可用操作({步骤编号})");
        }

        /// <summary>
        /// 首页上查看"更多办事流程"时,列举出所有的办事流程
        /// </summary>
        /// <param name="paging"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取办事流程列表(Paging paging)
        {
            return await Db.GetPagingListSpAsync<流程模板>(paging);
        }

        /// <summary>
        /// 根据某个办事流程编号,获取该流程规定的步骤
        /// </summary>
        /// <param name="办事流程编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某办事流程步骤列表(int 办事流程编号)
        {
            var filter = new 步骤模板Filter() { 流程模板编号 = 办事流程编号 };
            return await Db.GetListSpAsync<v1_步骤模板, 步骤模板Filter>(filter,orderType:true);
        }
    }
}