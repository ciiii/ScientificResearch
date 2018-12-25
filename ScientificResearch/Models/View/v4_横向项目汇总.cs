﻿using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v4_横向项目汇总[类]
    /// </summary>
    [Serializable]
	public partial class v4_横向项目汇总 
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
        public string 合同编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 合同名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal 合同金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 签订时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 项目负责人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目负责人工号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目负责人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 项目负责人部门编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目负责人部门名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目归属部门 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal 经费 { get; set; }
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