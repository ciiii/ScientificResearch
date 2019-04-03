 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 完成步骤时,提交的数据
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class 完成步骤<T>
    {
        /// <summary>
        /// 完成哪个步骤
        /// </summary>
        public int 步骤编号 { get; set; }
        /// <summary>
        /// 完整的状态值,步骤类型状态
        /// </summary>
        public int 状态值 { get; set; }

        public string 备注 { get; set; }
        /// <summary>
        /// 附加动作的传入数据,比如任职打回去修改时,修改后的数据
        /// </summary>
        public T 附加数据 { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public 完成步骤 ToSimple()
        {
            return new 完成步骤()
            {
                步骤编号 = this.步骤编号,
                状态值 = this.状态值,
                备注 = this.备注
            };
        }
    }

    public class 完成步骤
    {
        /// <summary>
        /// 完成哪个步骤
        /// </summary>
        public int 步骤编号 { get; set; }
        /// <summary>
        /// 完整的状态值,步骤类型状态
        /// </summary>
        public int 状态值 { get; set; }

        public string 备注 { get; set; }

    }

    public class 流程Filter
    {
        public string Like项目名称 { get; set; }
        public string Like流程名称{ get; set; }
        public string Like发起人姓名 { get; set; }
        public DateTime? Begin流程创建时间 { get; set; }
        public DateTime? End流程创建时间 { get; set; }
        /// <summary>
        /// 前台应该用不到
        /// </summary>
        public int? 流程模板编号 { get; set; }
        /// <summary>
        /// 前台应该用不到
        /// </summary>
        public int? 项目编号 { get; set; }
        /// <summary>
        /// 前台应该用不到
        /// </summary>
        public bool? 是否可处理 { get; set; }
    }

    public class 步骤模板Filter
    {
        public int 流程模板编号 { get; set; }
    }
}
