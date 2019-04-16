using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 完成步骤时,提交的数据
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
        public StepDone ToSimple(int state)
        {
            return new StepDone()
            {
                StepId = this.StepId,
                State = state,
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
        [Obsolete]
        public int State { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Remark { get; set; }

    }

    public class StepTemplateFilter
    {
        public int FlowTemplateId { get; set; }
    }
}
