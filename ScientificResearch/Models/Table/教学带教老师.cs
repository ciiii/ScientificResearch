using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学带教老师[类]
    /// </summary>
    [Serializable]
	public partial class 教学带教老师 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[教学科室编号]")]
		public int 教学科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[带教老师编号]")]
		public int 带教老师编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}