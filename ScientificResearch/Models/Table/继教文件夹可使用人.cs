using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教文件夹可使用人[类]
    /// </summary>
    [Serializable]
	public partial class 继教文件夹可使用人 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Obsolete]
        [Required(ErrorMessage ="请提供[文件夹编号]")]
		public int 文件夹编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[可使用人类型]")]
        [MaxLength(100,ErrorMessage ="可使用人类型不能超过[50]字")]
		public string 可使用人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[可使用人编号]")]
		public int 可使用人编号 { get; set; }
        
        
        #endregion
	}
}