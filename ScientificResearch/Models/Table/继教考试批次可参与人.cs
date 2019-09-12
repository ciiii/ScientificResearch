using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教考试批次可参与人[类]
    /// </summary>
    [Serializable]
	public partial class 继教考试批次可参与人 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Obsolete]
        [Required(ErrorMessage ="请提供[考试批次编号]")]
		public int 考试批次编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[可参与人类型]")]
        [MaxLength(50,ErrorMessage ="可参与人类型不能超过[25]字")]
		public string 可参与人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[可参与人编号]")]
		public int 可参与人编号 { get; set; }
        
        
        #endregion
	}
}