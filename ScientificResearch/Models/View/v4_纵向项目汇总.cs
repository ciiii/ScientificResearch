﻿using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v4_纵向项目汇总[类]
    /// </summary>
    [Serializable]
	public partial class v4_纵向项目汇总 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public string 状态名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 步骤名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 步骤状态说明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 纵向项目项目编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 分类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 分类名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目中文名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目英文名称 { get; set; }
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
        public decimal? 批准经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 配套经费 { get; set; }
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
        public int? 负责人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 负责人工号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 负责人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 负责人部门编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 负责人部门名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 登记人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 登记人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 未到经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 待审核到账 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 已审核到账 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 剩余经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 待审核报销 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 已审核报销 { get; set; }
        
          
        #endregion
	}
}