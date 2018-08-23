using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 项目参与人[类]
    /// </summary>
    [Serializable]
	public partial class 项目参与人 
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
        [Required(ErrorMessage ="请提供[流程模板编号]")]
		public int 流程模板编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[项目编号]")]
		public int 项目编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[参与人编号]")]
		public int 参与人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 工作量占比 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="备注不能超过[500]字")]
		public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 建立时间 { get; set; }
        
        
        #endregion
	}
}