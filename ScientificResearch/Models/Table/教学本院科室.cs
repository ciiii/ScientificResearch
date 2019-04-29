using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学本院科室[类]
    /// </summary>
    [Serializable]
	public partial class 教学本院科室 
	{       
        #region 属性
        /// <summary>
		/// 以周为单位
		/// </summary>
        [DisplayName("以周为单位")]
        [Required(ErrorMessage ="请提供[编号]")]
		public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Obsolete]
        [Required(ErrorMessage ="请提供[教学本院策略编号]")]
		public int 教学本院策略编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[排序值]")]
		public int 排序值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[教学专业科室编号]")]
		public int 教学专业科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[本院科室编号]")]
		public int 本院科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[是否必选]")]
		public bool 是否必选 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[培训时长]")]
		public int 培训时长 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[最低管床数量]")]
		public int 最低管床数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 最低全程管理数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}