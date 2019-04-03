using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学轮转[类]
    /// </summary>
    [Serializable]
	public partial class 教学轮转 
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
        [Required(ErrorMessage ="请提供[学员编号]")]
		public int 学员编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[计划入科日期]")]
		public DateTime? 计划入科日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[计划出科日期]")]
		public DateTime? 计划出科日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 实际入科日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 实际出科日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[本院科室编号]")]
		public int 本院科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[带教老师编号]")]
		public int 带教老师编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[最低管床数量]")]
		public int 最低管床数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[最低全程管理数量]")]
		public int 最低全程管理数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}