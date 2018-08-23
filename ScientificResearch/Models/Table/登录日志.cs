using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 登录日志[类]
    /// </summary>
    [Serializable]
	public partial class 登录日志 
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
        [Required(ErrorMessage ="请提供[工号]")]
        [MaxLength(50,ErrorMessage ="工号不能超过[25]字")]
		public string 工号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[姓名]")]
        [MaxLength(50,ErrorMessage ="姓名不能超过[25]字")]
		public string 姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 登录时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="IP不能超过[25]字")]
		public string IP { get; set; }
        
        
        #endregion
	}
}