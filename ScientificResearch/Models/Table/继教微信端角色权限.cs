using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教微信端角色权限[类]
    /// </summary>
    [Serializable]
	public partial class 继教微信端角色权限 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[继培角色编号]")]
		public int 继培角色编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[继培微信端权限编号]")]
		public int 继培微信端权限编号 { get; set; }
        
        
        #endregion
	}
}