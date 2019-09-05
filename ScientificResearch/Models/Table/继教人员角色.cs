using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教人员角色[类]
    /// </summary>
    [Serializable]
	public partial class 继教人员角色 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Obsolete]
        [Required(ErrorMessage ="请提供[继教角色编号]")]
		public int 继教角色编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[人员编号]")]
		public int 人员编号 { get; set; }
        
        
        #endregion
	}
}