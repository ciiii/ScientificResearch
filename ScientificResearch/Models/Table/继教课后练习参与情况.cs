using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教课后练习参与情况[类]
    /// </summary>
    [Serializable]
	public partial class 继教课后练习参与情况 
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
        [Required(ErrorMessage ="请提供[课后练习编号]")]
		public int 课后练习编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[参与人类型]")]
        [MaxLength(50,ErrorMessage ="参与人类型不能超过[25]字")]
		public string 参与人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[参与人编号]")]
		public int 参与人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[参与时间]")]
		public DateTime? 参与时间 { get; set; }
        
        
        #endregion
	}
}