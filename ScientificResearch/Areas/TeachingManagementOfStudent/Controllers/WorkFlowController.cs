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
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagementOfStudent.Controllers
{
    /// <summary>
    /// 工作流相关的接口
    /// </summary>
    public class WorkFlowController : TeachingManagementOfStudentBaseController
    {
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
            return await Db.GetListSpAsync<VStep, VStepFilter>(filter, orderType: true);
        }
        #endregion

        #region 退培
        /// <summary>
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 学员分页查看退培申请(Paging paging, v_tfn_教学退培申请Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_tfn_教学退培申请, v_tfn_教学退培申请Filter>
                (paging, filter, $"tfn_教学退培申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        [HttpGet]
        async public Task<object> 获取退培详情(int 退培编号)
        {
            return await Db.GetModelByIdSpAsync<v_tfn_教学退培申请>(退培编号, tableName: $"tfn_教学退培申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        /// <summary>
        /// data是教学退培申请
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 学员发起退培申请([FromBody]FlowInit<教学退培申请> data)
        {
            //data.IsHold = false;
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;

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
           // data.IsHold = false;
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;

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
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;
            return await Db.GetPagingListSpAsync<v_tfn_教学请假申请, v_tfn_教学请假申请Filter>
                (paging, filter, $"tfn_教学请假申请('{人员类型}',{学员编号})");
        }

        [HttpGet]
        async public Task<object> 获取请假详情(int 请假编号)
        {
            return await Db.GetModelByIdSpAsync<v_tfn_教学请假申请>(请假编号, tableName: $"tfn_教学请假申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
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
            //data.IsHold = false;
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;

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
            //data.IsHold = false;
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;

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

        #endregion

        #region 教学病例,或者叫轮转手册审核
        /// <summary>
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 学员分页查看轮转手册申请(Paging paging, v_tfn_教学轮转手册申请Filter filter)
        {
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;
            return await Db.GetPagingListSpAsync<v_tfn_教学轮转手册申请, v_tfn_教学轮转手册申请Filter>
                (paging, filter, $"tfn_教学轮转手册申请('{人员类型}',{学员编号})");
        }

        [HttpPost]
        async public Task<object> 上传教学轮转手册附件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/教学/培训/教学轮转手册附件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 获取轮转手册详情(int 轮转手册编号)
        {
            return await Db.GetModelByIdSpAsync<v_tfn_教学轮转手册申请>(
                轮转手册编号,
                tableName: $"tfn_教学轮转手册申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        [HttpGet]
        async public Task<object> 获取教学轮转手册类型()
        {
            return await Db.GetListSpAsync<教学轮转手册类型>(orderType:true);
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
            //data.IsHold = false;
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;

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
            //data.IsHold = false;
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;

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

        #endregion

        #region 教学出科申请
        /// <summary>
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 学员分页查看出科申请(Paging paging, v_tfn_教学出科申请Filter filter)
        {
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;
            return await Db.GetPagingListSpAsync<v_tfn_教学出科申请, v_tfn_教学出科申请Filter>
                (paging, filter, $"tfn_教学出科申请('{人员类型}',{学员编号})");
        }

        [HttpGet]
        async public Task<object> 获取出科详情(int 出科编号)
        {
            return await Db.GetModelByIdSpAsync<v_tfn_教学出科申请>(
                出科编号,
                tableName: $"tfn_教学出科申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
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
            //data.IsHold = false;
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;

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
            //data.IsHold = false;
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;

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

        #endregion

        #region 结业
        /// <summary>
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 学员分页查看结业申请(Paging paging, v_tfn_教学结业申请Filter filter)
        {
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;
            return await Db.GetPagingListSpAsync<v_tfn_教学结业申请, v_tfn_教学结业申请Filter>
                (paging, filter, $"tfn_教学结业申请('{人员类型}',{学员编号})");
        }

        [HttpGet]
        async public Task<object> 获取结业详情(int 结业编号)
        {
            return await Db.GetModelByIdSpAsync<v_tfn_教学结业申请>(
                结业编号,
                tableName: $"tfn_教学结业申请('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        /// <summary>
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 学员发起结业申请([FromBody]FlowInit<教学结业申请> data)
        {
            //data.IsHold = false;
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;

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
            //data.IsHold = false;
            var 人员类型 = CurrentUser.人员类型;
            var 学员编号 = CurrentUser.编号;

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

        #endregion
    }
}