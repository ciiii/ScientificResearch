using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教活动[类]
    /// </summary>
    [Serializable]
	public partial class 继教活动 
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
        [Required(ErrorMessage ="请提供[文件夹编号]")]
		public int 文件夹编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 培训计划编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 项目分类编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[名称]")]
        [MaxLength(100,ErrorMessage ="名称不能超过[50]字")]
		public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 学分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="封面不能超过[500]字")]
		public string 封面 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="简介不能超过[500]字")]
		public string 简介 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[必须按顺序学习]")]
		public bool 必须按顺序学习 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[建立时间]")]
		public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[建立人]")]
		public int 建立人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="备注不能超过[500]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}