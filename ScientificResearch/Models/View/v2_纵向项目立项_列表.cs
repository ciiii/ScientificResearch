﻿using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v2_纵向项目立项_列表[类]
    /// </summary>
    [Serializable]
	public partial class v2_纵向项目立项_列表 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
		//public int 编号 { get; set; }
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public int 分类 { get; set; }
        public int 分类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 分类名称 { get; set; }
        public string 分类名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 项目中文名称 { get; set; }
        public string 项目中文名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 项目英文名称 { get; set; }
        public string 项目英文名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 项目类型 { get; set; }
        public string 项目类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 项目级别 { get; set; }
        public string 项目级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 项目来源单位 { get; set; }
        public string 项目来源单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 项目类别 { get; set; }
        public string 项目类别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public decimal 批准经费 { get; set; }
        public decimal? 批准经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public decimal 配套经费 { get; set; }
        public decimal? 配套经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public DateTime 计划开始日期 { get; set; }
        public DateTime 计划开始日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public DateTime 计划完成日期 { get; set; }
        public DateTime 计划完成日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public int 负责人编号 { get; set; }
        public int? 负责人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 负责人工号 { get; set; }
        public string 负责人工号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 负责人姓名 { get; set; }
        public string 负责人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public int 负责人部门编号 { get; set; }
        public int? 负责人部门编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 负责人部门名称 { get; set; }
        public string 负责人部门名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public int 登记人编号 { get; set; }
        public int 登记人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		//public string 登记人姓名 { get; set; }
        public string 登记人姓名 { get; set; }
        
          
        #endregion
	}
}