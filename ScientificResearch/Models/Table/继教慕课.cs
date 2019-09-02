using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教慕课[类]
    /// </summary>
    [Serializable]
	public partial class 继教慕课 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[编号啊]")]
		public int 编号啊 { get; set; }
        
        
        #endregion
	}
}