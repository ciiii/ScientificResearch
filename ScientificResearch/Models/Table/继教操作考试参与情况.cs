using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教操作考试参与情况[类]
    /// </summary>
    [Serializable]
	public partial class 继教操作考试参与情况 
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
		public int? 助教老师编号 { get; set; }
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
        [Required(ErrorMessage ="请提供[开始操作时间]")]
		public DateTime? 开始操作时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[结束操作时间]")]
		public DateTime? 结束操作时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[得分]")]
		public decimal 得分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="备注不能超过[500]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}