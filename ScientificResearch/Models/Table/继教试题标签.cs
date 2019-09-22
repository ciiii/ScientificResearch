using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教试题标签[类]
    /// </summary>
    [Serializable]
	public partial class 继教试题标签 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[标签编号]")]
		public int 标签编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Obsolete]
        [Required(ErrorMessage ="请提供[试题编号]")]
		public int 试题编号 { get; set; }
        
        
        #endregion
	}
}