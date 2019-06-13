using ScientificResearch.Infrastucture;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class StepFilter
    {
        public int? Id { get; set; }
    }

    public class FlowInit<T>
    {
        public bool IsHold { get; set; } = false;
        public T Data { get; set; }
    }

    /// <summary>
    /// 完成步骤时,提交的数据
    /// 2019-5-30作废,因为增加了Predefinded2Models类型
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class StepDone<T>
    {
        /// <summary>
        /// 完成哪个步骤
        /// </summary>
        public int StepId { get; set; }
        /// <summary>
        /// 完整的状态值,步骤类型状态,
        /// 2018-10-3 传入的不需要这个了,后台把不同state的接口分开来表现,这个state后台来填写;
        /// 具体是放到ToSimple里面去填写;
        /// </summary>
        //public int State { get; set; }

        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// 注意这个和ModelWithIsHold中的IsHold是完全一样的
        /// </summary>
        public bool IsHold { get; set; } = false;

        /// <summary>
        /// 
        /// </summary>
        public string Remark { get; set; }
        /// <summary>
        /// 附加动作的传入数据,比如任职打回去修改时,修改后的数据
        /// </summary>
        public T Data { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public StepDone ToSimple()
        {
            return new StepDone()
            {
                StepId = this.StepId,
                //State = state,
                IsHold = this.IsHold,
                Remark = this.Remark
            };
        }
    }

    /// <summary>
    /// 完成步骤时,提交的数据,只是这个没有附加数据,没有IsHold
    /// </summary>
    /// <typeparam name="T"></typeparam>
    //public class StepDoneSimple
    //{
    //    /// <summary>
    //    /// 完成哪个步骤
    //    /// </summary>
    //    public int StepId { get; set; }

    //    /// <summary>
    //    /// 
    //    /// </summary>
    //    public string Remark { get; set; }

    //    /// <summary>
    //    /// 
    //    /// </summary>
    //    /// <returns></returns>
    //    public StepDone ToSimple(int state)
    //    {
    //        return new StepDone()
    //        {
    //            StepId = this.StepId,
    //            State = state,
    //            Remark = this.Remark
    //        };
    //    }
    //}

    /// <summary>
    /// 
    /// </summary>
    public class StepDone
    {
        /// <summary>
        /// 完成哪个步骤
        /// </summary>
        public int StepId { get; set; }

        /// <summary>
        /// 完整的状态值,步骤类型状态
        /// 设为Obsolete仅仅是为了swagger上不可见;
        /// </summary>
        //[Obsolete]
        //public int State { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// 注意这个和ModelWithIsHold中的IsHold是完全一样的
        /// </summary>
        public bool IsHold { get; set; } = false;

        /// <summary>
        /// 
        /// </summary>
        public string Remark { get; set; }

    }

    public class StepTemplateFilter
    {
        public int FlowTemplateId { get; set; }
    }

    /// <summary>
    /// 流程状态的enum
    /// 步骤状态应该是每个具体的stepTemplate有各自的状态
    /// 如果在前端写死不需要从后端获取的话,没啥用....
    /// </summary>
    //public enum 流程状态
    //{
    //    未完成 =0,
    //    已完成 =1,
    //    作废 = -2,
    //    已过期 = -3
    //}

    /// <summary>
    /// 操作流程中步骤的代号,这个代表的是"动作"
    /// </summary>
    public enum StepState
    {
        Stay = 0, Forward = 1, Back = -1, Quit = -2
    }

    /// <summary>
    /// 工作流的动作
    /// </summary>
    public static class WorkFlow
    {
        private const string _nextStepIdPropName = "NextStepId";

        #region flow
        /// <summary>
        /// 注意这个方法一定要放到一个ExecuteTransaction事务里面
        /// 额外的事情都在自定义的事务里面自己写;
        /// 接收指定的FlowTemplateId和SourceId,同时生成一个流程,再根据这个流程返回的步骤编号完成第一个步骤;
        /// 如果不完成第一个步骤,其实就相当于暂存;
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="dbForTransaction"></param>
        /// <param name="transaction"></param>
        /// <param name="FlowTemplateId"></param>
        /// <param name="SourceId"></param>
        /// <param name="CreatorType">流程发起人类型</param>
        /// <param name="CreatorId">流程发起人id</param>
        /// <param name="OperatorType">流程第一步操作人类型</param>
        /// <param name="OperatorId">流程第一步操作人id</param>
        /// <param name="isHold"></param>
        /// <returns></returns>
        async static public Task InitFlow(
            SqlConnection dbForTransaction,
            SqlTransaction transaction,
            int FlowTemplateId,
            int SourceId,
            string CreatorType,
            int CreatorId,
            string OperatorType = null,
            int? OperatorId = null,
            bool isHold = false)
        {
            //发起流程 
            var StepId = await dbForTransaction.QueryFirstSpAsync<SPFlowInit, int>(new SPFlowInit
            {
                FlowTemplateId = FlowTemplateId,
                SourceId = SourceId,
                CreatorId = CreatorId,
                CreatorType = CreatorType
            }, transaction);
            if (StepId == 0)
            {
                throw new Exception("发起流程出错:流程生成失败");
            }

            if (!isHold)
            {
                //完成这个步骤
                await dbForTransaction.ExecuteSpAsync(new SPStepDone
                {
                    StepId = StepId,
                    State = (int)StepState.Forward,
                    OperatorType = OperatorType ?? CreatorType,
                    OperatorId = OperatorId ?? CreatorId,
                    Remark = string.Empty
                }, transaction);
            }
        }

        #endregion

        #region step
        /// <summary>
        /// 完成一个步骤,返回下一个步骤的id,返回0则表示没有下一步了;
        /// 可以多个附加动作;
        /// </summary>
        /// <param name="dbForTransaction"></param>
        /// <param name="transaction"></param>
        /// <param name="step"></param>
        /// <param name="OperatorType"></param>
        /// <param name="OperatorId"></param>
        /// <returns></returns>
        async static public Task<int> DoneStep(
            SqlConnection dbForTransaction,
            SqlTransaction transaction,
            StepDone step,
            int state,
            string OperatorType,
            int OperatorId)
        {
            var NextStepId = 0;
            if (!step.IsHold)
            {
                NextStepId = await dbForTransaction.QueryFirstSpAsync<SPStepDone, int>(new SPStepDone
                {
                    StepId = step.StepId,
                    State = state,
                    Remark = step.Remark,
                    OperatorType = OperatorType,
                    OperatorId = OperatorId
                }, transaction);
            }
            // 0 表示没有下一步
            return NextStepId;
        }

        #endregion
    }


    public class v_tfn_教学请假申请Filter
    {
        public string Like学员姓名 { get; set; }
        /// <summary>
        /// 流程状态有:未完成,已完成,作废,
        /// </summary>
        public string StateName { get; set; }
    }

    public class v_tfn_教学轮转手册申请Filter
    {
        public string Like学员姓名 { get; set; }
        /// <summary>
        /// 流程状态有:未完成,已完成,作废,
        /// </summary>
        public string StateName { get; set; }
    }

    public class 教学轮转手册申请
    {
        public 教学轮转手册 轮转手册 { get; set; }
        public IEnumerable<int> 完成任务编号列表{ get; set; }
        //public 教学病人 病人 { get; set; }
    }

    public class v_tfn_教学出科申请Filter
    {
        public string Like学员姓名 { get; set; }
        /// <summary>
        /// 流程状态有:未完成,已完成,作废,
        /// </summary>
        public string StateName { get; set; }
    }
}
