﻿using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v2_纵向项目申报_详情[类]
    /// </summary>
    [Serializable]
	public partial class v2_纵向项目申报_详情 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 分类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 申报人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 工号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 部门编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 部门名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 学科门类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 学科类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 申报年度 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目来源单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目类别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 申报时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal 申请经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 计划开始日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 计划完成日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目等级 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否委托外单位进行实验或实验分析 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 实验委托检测内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目摘要 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否需要伦理评审 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否需要伦理批文 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 伦理批文编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 伦理批文路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目申报书路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否立项 { get; set; }
        
          
        #endregion
	}
}