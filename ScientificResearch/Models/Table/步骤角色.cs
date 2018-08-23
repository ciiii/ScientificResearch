using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 步骤角色[类]
    /// </summary>
    [Serializable]
	public partial class 步骤角色 
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
        [Required(ErrorMessage ="请提供[步骤模板编号]")]
		public int 步骤模板编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 角色编号 { get; set; }
        
        
        #endregion
	}
}