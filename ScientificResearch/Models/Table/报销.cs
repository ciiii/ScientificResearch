using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 报销[600类]
    /// </summary>
    [Serializable]
	public partial class 报销 
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
        [Required(ErrorMessage ="请提供[报销编号]")]
        [MaxLength(50,ErrorMessage ="报销编号不能超过[25]字")]
		public string 报销编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[报销金额]")]
		public decimal 报销金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="报销方式不能超过[25]字")]
		public string 报销方式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="公务卡号不能超过[25]字")]
		public string 公务卡号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="公务卡所属人姓名不能超过[25]字")]
		public string 公务卡所属人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[报销人编号]")]
		public int 报销人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[报销时间]")]
		public DateTime? 报销时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 相关文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 申请时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="报销经费用途不能超过[500]字")]
		public string 报销经费用途 { get; set; }
        
        
        #endregion
	}
}