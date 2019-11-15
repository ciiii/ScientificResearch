using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_继教某人可参与的操作考试[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_继教某人可参与的操作考试 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 文件夹编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 活动类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 培训计划编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 培训计划名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 培训计划年份 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 项目分类编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目分类名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 活动开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 活动结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 学分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 封面 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 简介 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 必须按顺序学习 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 建立人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 建立人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 活动备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 状态 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 考试编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 考试名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 考试开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 考试结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 地点 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 及格分数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 描述 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否允许考生查看成绩 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否允许考生查看评分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 参与人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 通过人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 考试备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 考试批次编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 考试批次开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 考试批次结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 考试地点 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 人数上限 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 二维码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 口令 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 考试批次备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否通过 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 得分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 开始操作时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 结束操作时间 { get; set; }
        
          
        #endregion
	}
}