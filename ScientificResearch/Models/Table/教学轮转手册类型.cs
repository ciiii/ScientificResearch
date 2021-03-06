﻿using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学轮转手册类型[类]
    /// </summary>
    [Serializable]
	public partial class 教学轮转手册类型 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[编号]")]
		public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[分类]")]
        [MaxLength(50,ErrorMessage ="分类不能超过[25]字")]
		public string 分类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[名称]")]
        [MaxLength(50,ErrorMessage ="名称不能超过[25]字")]
		public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否门诊 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否病床 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否医技 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 内容模板 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}