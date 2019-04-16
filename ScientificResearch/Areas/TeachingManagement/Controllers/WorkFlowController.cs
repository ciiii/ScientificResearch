using System;
using System.Collections.Generic;
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
    /// 工作流相关的接口
    /// </summary>
    public class WorkFlowController : TeachingManagementBaseController
    {

        private async Task 完成步骤(StepDone data)
        {
            await MyWorkFlowBusiness.DoneStep(data, CurrentUser.人员类型, CurrentUser.编号);
        }

        /// <summary>
        /// 审核等不需要附加动作的操作,可以直接调用这个接口;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 步骤通过审核([FromBody]StepDone data)
        {
            data.State = (int)StepState.Forward;
            await 完成步骤(data);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 步骤不通过审核([FromBody]StepDone data)
        {
            data.State = (int)StepState.Back;
            await 完成步骤(data);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 终止流程([FromBody]StepDone data)
        {
            data.State = (int)StepState.Quit;
            await 完成步骤(data);
        }

        /// <summary>
        /// 首页上查看"更多办事流程"时,列举出所有的办事流程
        /// </summary>
        /// <param name="paging"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取办事流程列表(Paging paging)
        {
            return await Db.GetPagingListSpAsync<FlowTemplate>(paging);
        }

        /// <summary>
        /// 根据某个办事流程编号,获取该流程规定的步骤
        /// </summary>
        /// <param name="办事流程编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某办事流程步骤列表(int 办事流程编号)
        {
            var filter = new StepTemplateFilter() { FlowTemplateId = 办事流程编号 };
            return await Db.GetListSpAsync<VStepTemplate, StepTemplateFilter>(filter, orderType: true);
        }
    }
}