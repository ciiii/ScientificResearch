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
        #region 无附加动作的操作步骤
        //private async task 完成步骤(stepdone step,int state)
        //{
        //    //await myworkflowbusiness.donestep(data, currentuser.人员类型, currentuser.编号);

        //    task<int> mytran(sqlconnection dbfortransaction, sqltransaction transaction)
        //    {
        //        return workflow.donestep(dbfortransaction, transaction, step, state, currentuser.人员类型, currentuser.编号);
        //    }

        //    await predefinedspextention.executetransaction(dbconnectionstring, mytran);
        //}

        ///// <summary>
        ///// 审核等不需要附加动作的操作,可以直接调用这个接口;
        ///// </summary>
        ///// <param name="data"></param>
        ///// <returns></returns>
        //[httppost]
        //async public task 步骤通过审核([frombody]stepdone data)
        //{
        //    await 完成步骤(data, (int)stepstate.forward);
        //}

        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="data"></param>
        ///// <returns></returns>
        //[httppost]
        //async public task 步骤不通过审核([frombody]stepdone data)
        //{
        //    await 完成步骤(data, (int)stepstate.back);
        //}

        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="data"></param>
        ///// <returns></returns>
        //[httppost]
        //async public task 终止流程([frombody]stepdone data)
        //{
        //    await 完成步骤(data, (int)stepstate.quit);
        //}
        private async Task 无附加动作通过步骤(StepDone data)
        {
            await 基本操作步骤(data, (int)StepState.Forward);
        }

        private async Task 无附加动作不通过步骤(StepDone data)
        {
            await 基本操作步骤(data, (int)StepState.Back);
        }

        private async Task 无附加动作终止步骤(StepDone data)
        {
            await 基本操作步骤(data, (int)StepState.Quit);
        }

        private async Task 基本操作步骤(StepDone data, int state)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await WorkFlow.DoneStep(dbForTransaction, transaction, data, state, CurrentUser.人员类型, CurrentUser.编号);
            }
            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }
        #endregion

        #region 查看流程和步骤设定
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
        /// 根据某个办事流程模板编号,获取该流程规定的步骤
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
        /// 流程编号就是flowid
        /// </summary>
        /// <param name="流程编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某流程审核记录([Required]int 流程编号)
        {
            var filter = new VStepFilter() { FlowId = 流程编号 };
            return await Db.GetListSpAsync<VStep, VStepFilter>(filter,orderType:true);
        }
        #endregion

        #region 退培
        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// 虽然它和老师端的这个接口其实是一样的;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 学员分页查看退培申请(Paging paging, v_tfn_教学退培申请Filter filter)
        {
            var 人员类型 = "教学学员";
            var 学员编号 = 10; //菲菲
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
            var 学员编号 = 10; //菲菲

            //只有已报到且未退培且未结业的学员可以退培;
            await 验证学员为已报到且未退培未结业(学员编号);

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

        private async Task 验证学员为已报到且未退培未结业(int 学员编号)
        {
            v_教学学员培训情况 学员培训情况 = await Db.GetModelByIdSpAsync<v_教学学员培训情况>(学员编号);
            if (学员培训情况.状态 == 教学学员培训状态.未报到.ToString() ||
                学员培训情况.状态 == 教学学员培训状态.退培.ToString() ||
                学员培训情况.状态 == 教学学员培训状态.结业.ToString())
            {
                throw new Exception("未报到,已退培,已结业的学员不能再发起退培");
            }
        }

        [HttpPost]
        async public Task 学员提交退培申请([FromBody]StepDone<教学退培申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = 10; //菲菲

            //只有已报到且未退培且未结业的学员可以退培;
            await 验证学员为已报到且未退培未结业(学员编号);

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

        /// <summary>
        /// 这里就是"老师端"的接口;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
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
            await 验证学员为已报到且未退培未结业(学员编号);

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //流程上通过申请
                await WorkFlow.DoneStep(dbForTransaction, transaction, data.ToSimple(), (int)StepState.Forward, CurrentUser.人员类型, CurrentUser.编号);

                //教学学员培训状态要改为退培
                var 学员培训情况 = await Db.GetModelByIdSpAsync<教学学员培训>(学员编号);
                学员培训情况.退培日期 = DateTime.Now;
                await dbForTransaction.Merge(学员培训情况, transaction);

                //该学员轮转中,未入科的和在科的都删掉;
                var 该学员未入科和在科的轮转 = await dbForTransaction.GetListSpAsync<v_教学轮转, v_教学轮转Filter>(new v_教学轮转Filter()
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
            await 无附加动作不通过步骤(data);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 终止退培申请([FromBody]StepDone data)
        {
            await 无附加动作终止步骤(data);
        }
        #endregion

        #region 请假
        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// 虽然它和老师端的这个接口其实是一样的;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 学员分页查看请假申请(Paging paging, v_tfn_教学请假申请Filter filter)
        {
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子
            return await Db.GetPagingListSpAsync<v_tfn_教学请假申请, v_tfn_教学请假申请Filter>
                (paging, filter, $"tfn_教学请假申请('{人员类型}',{学员编号})");
        }

        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// data是教学请假申请
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 学员发起请假申请([FromBody]FlowInit<教学请假申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子

            await 检查请假数据(data.Data);

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 发起的请假申请 = await dbForTransaction.Merge(data.Data, transaction);

                await WorkFlow.InitFlow(
                    dbForTransaction,
                    transaction,
                    Config.GetValue<int>("教学流程模板编号:教学请假申请"),
                    发起的请假申请.编号,
                    人员类型,
                    学员编号,
                    isHold: data.IsHold);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 学员提交请假申请([FromBody]StepDone<教学请假申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子

            await 检查请假数据(data.Data);

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 发起的请假申请 = await dbForTransaction.Merge(data.Data, transaction);

                await WorkFlow.DoneStep(
                    dbForTransaction,
                    transaction,
                    data.ToSimple(),
                    (int)StepState.Forward, 人员类型,
                    学员编号);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        private async Task 检查请假数据(教学请假申请 data)
        {
            var v教学轮转 = await Db.GetModelByIdSpAsync<v_教学轮转>(data.教学轮转编号);
            //在科的轮转中,才能发起请假
            if (v教学轮转.状态 != 教学轮转状态.在科.ToString())
            {
                throw new Exception("在科的轮转中,才能发起请假");
            }
            //请假日期在该轮转时间范围内才正确
            if (data.请假开始日期 < v教学轮转.计划入科日期 || data.请假开始日期 > v教学轮转.计划出科日期)
            {
                throw new Exception("请假日期必须在轮转日期范围之类");
            }
        }

        /// <summary>
        /// 这里就是"老师端"的接口;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页查看请假申请(Paging paging, v_tfn_教学请假申请Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_tfn_教学请假申请, v_tfn_教学请假申请Filter>
                (paging, filter, $"tfn_教学请假申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        /// <summary>
        /// Data填申请退培的学员编号
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 通过请假申请([FromBody]StepDone<int> data)
        {
            var vstep = await Db.GetModelByIdSpAsync<VStep>(data.StepId, keyFields: "Id");

            var 教学请假申请 = await Db.GetModelByIdSpAsync<教学请假申请>(vstep.SourceId);
            await 检查请假数据(教学请假申请);

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //流程上通过申请
                var nextStepId = await WorkFlow.DoneStep
                    (dbForTransaction, transaction, data.ToSimple(), (int)StepState.Forward, CurrentUser.人员类型, CurrentUser.编号);

                //没有下一步,或者说下一步id=0
                if (nextStepId == 0)
                {
                    var 学员编号 = data.Data;
                    var 请假的轮转编号 = 教学请假申请.教学轮转编号;
                    var 请假开始日期 = 教学请假申请.请假开始日期;
                    var 请假天数 = 教学请假申请.请假天数;
                    ///造成轮转时间拉长
                    //选择该学员的轮转中,计划结束日期大于请假日期的轮转
                    var 将要延长的轮转 = await dbForTransaction.GetListSpAsync<教学轮转, v_教学轮转Filter>(new v_教学轮转Filter()
                    {
                        学员编号 = 学员编号,
                        Begin计划出科日期 = 请假开始日期
                    }, transaction: transaction);

                    foreach (var item in 将要延长的轮转)
                    {
                        if (item.实际入科日期 > 请假开始日期 && item.实际入科日期 != null)
                        {
                            ((DateTime)item.实际入科日期).AddDays(请假天数);
                        }

                        if (item.实际出科日期 > 请假开始日期 && item.实际出科日期 != null)
                        {
                            ((DateTime)item.实际出科日期).AddDays(请假天数);
                        }
                    }
                    //修改教学轮转;
                    await dbForTransaction.Merge(将要延长的轮转, transaction);

                    ///会让这几天的考勤变成请假
                    var 教学考勤情况列表 = await dbForTransaction.GetListSpAsync<教学考勤情况, 教学考勤情况Filter>(new 教学考勤情况Filter()
                    {
                        教学轮转编号 = 请假的轮转编号,
                    }, transaction: transaction);

                    var 将要改变的考勤 = Enumerable.Range(0, 请假天数).Select(i => new 教学考勤情况()
                    {
                        编号 = 0,
                        教学考勤类型编号 = Config.GetValue<int>("教学考勤类型编号:请假"),
                        建立时间 = DateTime.Now,
                        建立人 = CurrentUser.编号,
                        教学轮转编号 = 请假的轮转编号,
                        考勤日期 = ((DateTime)请假开始日期).AddDays(i),
                        说明 = $"{DateTime.Now.ToShortDateString()}请假:{教学请假申请.请假事由}",
                        备注 = null
                    });

                    var 最终的考勤情况列表 = 教学考勤情况列表
                        .Where(i => i.考勤日期 < 请假开始日期 || i.考勤日期 > ((DateTime)请假开始日期).AddDays(请假天数))
                        .Union(将要改变的考勤);

                    await dbForTransaction.Merge(请假的轮转编号, 最终的考勤情况列表, transaction);
                }
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 不通过xxx,是可以写一个通用的.但目前先不
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 不通过请假申请([FromBody]StepDone data)
        {
            await 无附加动作不通过步骤(data);
        }

        /// <summary>
        /// 终止xxx,是可以写一个通用的.但目前先不
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 终止请假申请([FromBody]StepDone data)
        {
            await 无附加动作终止步骤(data);
        }
        #endregion

        #region 教学病例,或者叫轮转手册审核
        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// 虽然它和老师端的这个接口其实是一样的;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 学员分页查看轮转手册申请(Paging paging, v_tfn_教学轮转手册申请Filter filter)
        {
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子
            return await Db.GetPagingListSpAsync<v_tfn_教学轮转手册申请, v_tfn_教学轮转手册申请Filter>
                (paging, filter, $"tfn_教学轮转手册申请('{人员类型}',{学员编号})");
        }

        /// <summary>
        /// 学员提交轮转手册时需要选择的
        /// </summary>
        /// <param name="教学轮转编号"></param>
        /// <param name="教学轮转手册类型编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某教学轮转手册可选任务(
            [Required]int 教学轮转编号,
            [Required]int 教学轮转手册类型编号,
            int? 教学专业科室任务类型编号)
        {
            var 教学轮转手册类型 = await Db.GetModelByIdSpAsync<教学轮转手册类型>(教学轮转手册类型编号);
            return await Db.GetListSpAsync<教学轮转任务, 教学轮转任务Filter>(new 教学轮转任务Filter()
            {
                教学轮转编号 = 教学轮转编号,
                任务类型编号 = 教学专业科室任务类型编号,
                是否门诊 = 教学轮转手册类型.是否门诊,
                是否病房 = 教学轮转手册类型.是否病床,
                是否医技 = 教学轮转手册类型.是否医技
            });
        }
        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// data是教学轮转手册申请,包括轮转手册数据和所选的完成任务的数据;
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 学员发起轮转手册申请([FromBody]FlowInit<教学轮转手册申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //轮转手册
                var 提交的轮转手册 = await dbForTransaction.Merge(data.Data.轮转手册, transaction);
                //保存教学轮转手册完成的任务
                var 将提交的完成任务 = data.Data.完成任务编号列表.Select(i => new 教学轮转手册完成任务()
                {
                    教学轮转任务编号 = i
                });

                var 提交的轮转手册完成任务 = await dbForTransaction.Merge(提交的轮转手册.编号, 将提交的完成任务, transaction);

                await WorkFlow.InitFlow(
                    dbForTransaction,
                    transaction,
                    Config.GetValue<int>("教学流程模板编号:教学轮转手册"),
                    提交的轮转手册.编号,
                    人员类型,
                    学员编号,
                    isHold: data.IsHold);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 学员提交轮转手册申请([FromBody]StepDone<教学轮转手册申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //轮转手册
                var 提交的轮转手册 = await dbForTransaction.Merge(data.Data.轮转手册, transaction);
                //保存教学轮转手册完成的任务
                var 将提交的完成任务 = data.Data.完成任务编号列表.Select(i => new 教学轮转手册完成任务()
                {
                    教学轮转任务编号 = i
                });

                await WorkFlow.DoneStep(
                    dbForTransaction,
                    transaction,
                    data.ToSimple(),
                    (int)StepState.Forward, 人员类型,
                    学员编号);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 这里就是"老师端"的接口;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页查看轮转手册申请(Paging paging, v_tfn_教学轮转手册申请Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_tfn_教学轮转手册申请, v_tfn_教学轮转手册申请Filter>
                (paging, filter, $"tfn_教学轮转手册申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        [HttpPost]
        async public Task 通过轮转手册申请([FromBody]StepDone data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //流程上通过申请
                await WorkFlow.DoneStep
                    (dbForTransaction, transaction, data, (int)StepState.Forward, CurrentUser.人员类型, CurrentUser.编号);
            }
            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 这几行代码是与其他不通过重复了的.暂时先这样.以免彼此有不同; 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 不通过轮转手册申请([FromBody]StepDone data)
        {
            await 无附加动作不通过步骤(data);
        }

        [HttpPost]
        async public Task 终止轮转手册申请([FromBody]StepDone data)
        {
            await 无附加动作终止步骤(data);
        }

        #endregion

        #region 教学出科申请
        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// 虽然它和老师端的这个接口其实是一样的;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 学员分页查看出科申请(Paging paging, v_tfn_教学出科申请Filter filter)
        {
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子
            return await Db.GetPagingListSpAsync<v_tfn_教学出科申请, v_tfn_教学出科申请Filter>
                (paging, filter, $"tfn_教学出科申请('{人员类型}',{学员编号})");
        }

        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// data是教学出科申请
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 学员发起出科申请([FromBody]FlowInit<教学出科申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子

            await 验证出科申请数据(data.Data);

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //出科申请
                var 提交的出科申请 = await dbForTransaction.Merge(data.Data, transaction);

                await WorkFlow.InitFlow(
                    dbForTransaction,
                    transaction,
                    Config.GetValue<int>("教学流程模板编号:教学出科申请"),
                    提交的出科申请.编号,
                    人员类型,
                    学员编号,
                    isHold: data.IsHold);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 学员提交出科申请([FromBody]StepDone<教学出科申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子

            await 验证出科申请数据(data.Data);

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //出科申请
                var 提交的出科申请 = await dbForTransaction.Merge(data.Data, transaction);

                await WorkFlow.DoneStep(
                    dbForTransaction,
                    transaction,
                    data.ToSimple(),
                    (int)StepState.Forward, 人员类型,
                    学员编号);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        private async Task<v_教学轮转> 验证出科申请数据(教学出科申请 data)
        {
            //申请出科的轮转应该是在科状态,且申请出科日期应该在计划之内
            var 申请出科的轮转 = await Db.GetModelByIdSpAsync<v_教学轮转>(data.教学轮转编号);

            if (申请出科的轮转.状态 != 教学轮转状态.在科.ToString())
            {
                throw new Exception("在科的轮转才能申请出科");
            }

            if (data.申请出科日期 < 申请出科的轮转.计划入科日期 || data.申请出科日期 > 申请出科的轮转.计划出科日期)
            {
                throw new Exception("申请出科日期超过了计划日期范围");
            }

            申请出科的轮转.实际出科日期 = data.申请出科日期;
            return 申请出科的轮转;
        }

        /// <summary>
        /// 这里就是"老师端"的接口;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页查看出科申请(Paging paging, v_tfn_教学出科申请Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_tfn_教学出科申请, v_tfn_教学出科申请Filter>
                (paging, filter, $"tfn_教学出科申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        /// <summary>
        /// data里面附件数据为出科申请编号
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 通过出科申请([FromBody]StepDone<int> data)
        {
            var vstep = await Db.GetModelByIdSpAsync<VStep>(data.StepId, nameof(VStep.Id));

            var 出科申请 = await Db.GetModelByIdSpAsync<教学出科申请>(vstep.SourceId);

            //出科日期已经加上了
            var 新的教学轮转 = MyLib.Tool.ModelToModel< v_教学轮转, 教学轮转>(await 验证出科申请数据(出科申请));
            var 学员编号 = 新的教学轮转.学员编号;

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await dbForTransaction.Merge(新的教学轮转, transaction);

                //检查该学员的轮转是否都已经出科了
                var 该学员还没有出科的轮转 = await dbForTransaction.GetListSpAsync<v_教学轮转, v_教学轮转Filter>(new v_教学轮转Filter()
                {
                    学员编号 = 学员编号,
                    NotEqual状态 = 教学轮转状态.已出科.ToString()
                }, transaction: transaction);
                if (该学员还没有出科的轮转 == null)
                {
                    //如果都出科了,就没有状态不是"已出科"的了
                    //更新该学员的教学培训情况 
                    var 教学学员培训情况 = await dbForTransaction.GetModelByIdSpAsync<教学学员培训>(学员编号, transaction: transaction);
                    教学学员培训情况.实际结束培训日期 = 出科申请.申请出科日期;
                    await dbForTransaction.Merge(教学学员培训情况, transaction: transaction);
                }

                //流程上通过申请
                await WorkFlow.DoneStep
                    (dbForTransaction, transaction, data.ToSimple(), (int)StepState.Forward, CurrentUser.人员类型, CurrentUser.编号);
            }
            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 不通过出科申请([FromBody]StepDone data)
        {
            await 无附加动作不通过步骤(data);
        }

        [HttpPost]
        async public Task 终止出科申请([FromBody]StepDone data)
        {
            await 无附加动作终止步骤(data);
        }
        #endregion

        #region 结业
        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// 虽然它和老师端的这个接口其实是一样的;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 学员分页查看结业申请(Paging paging, v_tfn_教学结业申请Filter filter)
        {
            var 人员类型 = "教学学员";
            var 学员编号 = 1; //王苏麻子
            return await Db.GetPagingListSpAsync<v_tfn_教学结业申请, v_tfn_教学结业申请Filter>
                (paging, filter, $"tfn_教学结业申请('{人员类型}',{学员编号})");
        }

        /// <summary>
        /// 这个应该是在学员端,目前为了测试方便放在这里,人员类型和编号都是写死的;
        /// data是教学结业申请
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 学员发起结业申请([FromBody]FlowInit<教学结业申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = data.Data.学员编号; 

            //只有待结业的学员可以结业;
            await 验证学员为待结业(学员编号);

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 发起的结业申请 = await dbForTransaction.Merge(data.Data, transaction);

                await WorkFlow.InitFlow(
                    dbForTransaction,
                    transaction,
                    Config.GetValue<int>("教学流程模板编号:教学结业申请"),
                    发起的结业申请.编号,
                    人员类型,
                    学员编号,
                    isHold: data.IsHold);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        private async Task 验证学员为待结业(int 学员编号)
        {
            var 学员培训情况 = await Db.GetModelByIdSpAsync<v_教学学员培训情况>(学员编号);
            if (学员培训情况.状态 != 教学学员培训状态.待结业.ToString())
            {
                throw new Exception("只有待结业的学员才能发起结业");
            }
        }

        [HttpPost]
        async public Task 学员提交结业申请([FromBody]StepDone<教学结业申请> data)
        {
            //这里是伪数据
            data.IsHold = false;
            var 人员类型 = "教学学员";
            var 学员编号 = data.Data.学员编号; 

            //只有待结业的学员可以结业;
            await 验证学员为待结业(学员编号);

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 发起的结业申请 = await dbForTransaction.Merge(data.Data, transaction);

                await WorkFlow.DoneStep(
                    dbForTransaction,
                    transaction,
                    data.ToSimple(),
                    (int)StepState.Forward, 人员类型,
                    学员编号);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }


        /// <summary>
        /// 这里就是"老师端"的接口;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页查看结业申请(Paging paging, v_tfn_教学结业申请Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_tfn_教学结业申请, v_tfn_教学结业申请Filter>
                (paging, filter, $"tfn_教学结业申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }


        /// <summary>
        /// Data填申请结业的学员编号
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 通过结业申请([FromBody]StepDone<int> data)
        {
            var 学员编号 = data.Data;
            await 验证学员为待结业(学员编号);

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //流程上通过申请
                await WorkFlow.DoneStep(dbForTransaction, transaction, data.ToSimple(), (int)StepState.Forward, CurrentUser.人员类型, CurrentUser.编号);

                //教学学员培训状态要改为结业
                var 学员培训情况 = await Db.GetModelByIdSpAsync<教学学员培训>(学员编号);
                学员培训情况.结业日期 = DateTime.Now;
                await dbForTransaction.Merge(学员培训情况, transaction);

            }
            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 不通过结业申请([FromBody]StepDone data)
        {
            await 无附加动作不通过步骤(data);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 终止结业申请([FromBody]StepDone data)
        {
            await 无附加动作终止步骤(data);
        }
        #endregion
    }
}