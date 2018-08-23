using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 主办讲座[类]
    /// </summary>
    [Serializable]
	public partial class 主办讲座 
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
        [Required(ErrorMessage ="请提供[活动名称]")]
        [MaxLength(500,ErrorMessage ="活动名称不能超过[250]字")]
		public string 活动名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 所属部门编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 活动经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="会议类型不能超过[25]字")]
		public string 会议类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="活动对象不能超过[250]字")]
		public string 活动对象 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[开始时间]")]
		public DateTime? 开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[结束时间]")]
		public DateTime? 结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[主办人编号]")]
		public int 主办人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="主讲人姓名不能超过[25]字")]
		public string 主讲人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="主讲人国别不能超过[25]字")]
		public string 主讲人国别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="主讲人单位不能超过[25]字")]
		public string 主讲人单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="主讲人学位不能超过[25]字")]
		public string 主讲人学位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="主讲人职称不能超过[25]字")]
		public string 主讲人职称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 主讲人简历路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="讲座地点不能超过[250]字")]
		public string 讲座地点 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="内容概述不能超过[250]字")]
		public string 内容概述 { get; set; }
        
        
        #endregion
	}
}