using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教微信角色权限[类]
    /// </summary>
    [Serializable]
	public partial class 继教微信角色权限 
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
        [Required(ErrorMessage ="请提供[继教微信权限编号]")]
		public int 继教微信权限编号 { get; set; }
        
        
        #endregion
	}
}