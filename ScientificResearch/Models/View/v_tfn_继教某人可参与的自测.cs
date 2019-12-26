﻿using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_继教某人可参与的自测[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_继教某人可参与的自测 
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
        public bool 是否允许任何人参与 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 试卷编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 试卷名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 时长 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 及格分数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否试题乱序 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否允许考生查看成绩 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否允许考生查看答案 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 自测人次 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 考试备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 参与次数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 通过次数 { get; set; }
        
          
        #endregion
	}
}