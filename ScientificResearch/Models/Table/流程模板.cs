using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 流程模板[类]
    /// </summary>
    [Serializable]
	public partial class 流程模板 
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
        [Required(ErrorMessage ="请提供[名称]")]
        [MaxLength(100,ErrorMessage ="名称不能超过[50]字")]
		public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[路径]")]
        [MaxLength(100,ErrorMessage ="路径不能超过[50]字")]
		public string 路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 期限天数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="备注不能超过[500]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}