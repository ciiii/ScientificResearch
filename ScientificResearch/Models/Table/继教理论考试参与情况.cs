using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教理论考试参与情况[类]
    /// </summary>
    [Serializable]
	public partial class 继教理论考试参与情况 
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
        [Required(ErrorMessage ="请提供[考试批次编号]")]
		public int 考试批次编号 { get; set; }
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
        [Required(ErrorMessage ="请提供[答题开始时间]")]
		public DateTime? 答题开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 答题结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 得分 { get; set; }
        
        
        #endregion
	}
}