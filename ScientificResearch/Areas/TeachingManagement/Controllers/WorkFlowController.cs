using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
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
        #region 这几个暂时不需要
        //private async Task 完成步骤(StepDone step,int state)
        //{
        //    //await MyWorkFlowBusiness.DoneStep(data, CurrentUser.人员类型, CurrentUser.编号);

        //    Task<int> myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
        //    {
        //        return WorkFlow.DoneStep(dbForTransaction, transaction, step, state, CurrentUser.人员类型, CurrentUser.编号);
        //    }

        //    await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        //}

        ///// <summary>
        ///// 审核等不需要附加动作的操作,可以直接调用这个接口;
        ///// </summary>
        ///// <param name="data"></param>
        ///// <returns></returns>
        //[HttpPost]
        //async public Task 步骤通过审核([FromBody]StepDone data)
        //{
        //    await 完成步骤(data, (int)StepState.Forward);
        //}

        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="data"></param>
        ///// <returns></returns>
        //[HttpPost]
        //async public Task 步骤不通过审核([FromBody]StepDone data)
        //{
        //    await 完成步骤(data, (int)StepState.Back);
        //}

        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="data"></param>
        ///// <returns></returns>
        //[HttpPost]
        //async public Task 终止流程([FromBody]StepDone data)
        //{
        //    await 完成步骤(data, (int)StepState.Quit);
        //}
        #endregion

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
        async public Task<object> 获取某办事流程步骤列表([Required]int 办事流程编号)
        {
            var filter = new StepTemplateFilter() { FlowTemplateId = 办事流程编号 };
            return await Db.GetListSpAsync<VStepTemplate, StepTemplateFilter>(filter, orderType: true);
        }

        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 学员分页查看退培申请(Paging paging, v_tfn_教学退培申请Filter filter)
        {
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子
            return await Db.GetPagingListSpAsync<v_tfn_教学退培申请, v_tfn_教学退培申请Filter>
                (paging, filter, $"tfn_教学退培申请('{人员类型}',{学员编号})");
        }

        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// data是教学退培申请
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 学员发起退培申请([FromBody]FlowInit<教学退培申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子

            //只有已报到且未退培且未结业的学员可以退培;
            var 学员培训情况 = await Db.GetModelByIdSpAsync<v_教学学员培训情况>(学员编号);
            if (学员培训情况.状态 == 教学学员培训状态.未报到.ToString() ||
                学员培训情况.状态 == 教学学员培训状态.退培.ToString() ||
                学员培训情况.状态 == 教学学员培训状态.结业.ToString())
            {
                throw new Exception("未报到,已退培,已结业的学员不能再发起退培");
            }

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 发起的退培申请 = await dbForTransaction.Merge(data.Data, transaction);

                await WorkFlow.InitFlow(
                    dbForTransaction,
                    transaction,
                    Config.GetValue<int>("教学流程模板编号:教学退培申请"),
                    发起的退培申请.编号,
                    人员类型,
                    学员编号,
                    isHold: data.IsHold);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 学员提交退培申请([FromBody]StepDone<教学退培申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子

            //只有已报到且未退培且未结业的学员可以退培;
            var 学员培训情况 = await Db.GetModelByIdSpAsync<v_教学学员培训情况>(学员编号);
            if (学员培训情况.状态 == 教学学员培训状态.未报到.ToString() ||
                学员培训情况.状态 == 教学学员培训状态.退培.ToString() ||
                学员培训情况.状态 == 教学学员培训状态.结业.ToString())
            {
                throw new Exception("未报到,已退培,已结业的学员不能再发起退培");
            }

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 发起的退培申请 = await dbForTransaction.Merge(data.Data, transaction);

                await WorkFlow.DoneStep(
                    dbForTransaction,
                    transaction,
                    data.ToSimple(),
                    (int)StepState.Forward, 人员类型,
                    学员编号);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpGet]
        async public Task<object> 分页查看退培申请(Paging paging, v_tfn_教学退培申请Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_tfn_教学退培申请, v_tfn_教学退培申请Filter>
                (paging, filter, $"tfn_教学退培申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        /// <summary>
        /// Data填申请退培的学员编号
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 通过退培申请([FromBody]StepDone<int> data)
        {
            var 学员编号 = data.Data;
            //var 步骤详情 = await Db.GetModelByIdSpAsync<VStep>(data.StepId,);
            //var 退培申请详情 = await Db.GetModelByIdSpAsync<教学退培申请>(步骤详情.SourceId);
            var 学员培训情况详情 = await Db.GetModelByIdSpAsync<v_教学学员培训情况>(学员编号);

            if (学员培训情况详情.状态 == 教学学员培训状态.未报到.ToString() ||
                学员培训情况详情.状态 == 教学学员培训状态.退培.ToString() ||
                学员培训情况详情.状态 == 教学学员培训状态.结业.ToString())
            {
                throw new Exception("该学员已已退培或已结业");
            }

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //流程上通过申请
                await WorkFlow.DoneStep(dbForTransaction, transaction, data.ToSimple(), (int)StepState.Forward, CurrentUser.人员类型, CurrentUser.编号);

                //教学学员培训状态要改为退培
                var 学员培训情况 = await Db.GetModelByIdSpAsync<教学学员培训>(学员编号);
                学员培训情况.退培日期 = DateTime.Now;
                await dbForTransaction.Merge(学员培训情况, transaction);

                //该学员轮转中,未入科的和在科的都删掉;
                var 该学员未入科和在科的轮转 = await dbForTransaction.GetListSpAsync<v_教学轮转, 教学轮转Filter>(new 教学轮转Filter()
                {
                    学员编号 = 学员编号,
                    NotEqual状态 = 教学轮转状态.已出科.ToString()
                }, transaction: transaction);

                await dbForTransaction.Delete<教学轮转>(该学员未入科和在科的轮转.Select(i => i.编号), transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 不通过退培申请([FromBody]StepDone data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await WorkFlow.DoneStep(dbForTransaction, transaction, data, (int)StepState.Back, CurrentUser.人员类型, CurrentUser.编号);
            }
            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 终止退培申请([FromBody]StepDone data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await WorkFlow.DoneStep(dbForTransaction, transaction, data, (int)StepState.Quit, CurrentUser.人员类型, CurrentUser.编号);
            }
            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }
    }
}