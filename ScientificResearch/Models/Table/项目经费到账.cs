using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 项目经费到账[500   对于纵向项目: 技术交易额,管理费用,技术合同认定服务费,增值税可以都不管不显示类]
    /// </summary>
    [Serializable]
	public partial class 项目经费到账 
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
        [Required(ErrorMessage ="请提供[拨款单位]")]
        [MaxLength(100,ErrorMessage ="拨款单位不能超过[50]字")]
		public string 拨款单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[到账日期]")]
		public DateTime? 到账日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[到账金额]")]
		public decimal 到账金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[技术交易额]")]
		public decimal 技术交易额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[管理费用]")]
		public decimal 管理费用 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[技术合同认定服务费]")]
		public decimal 技术合同认定服务费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[增值税]")]
		public decimal 增值税 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="到账单位不能超过[50]字")]
		public string 到账单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[经办人编号]")]
		public int 经办人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[到账凭证路径]")]
		public string 到账凭证路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="备注不能超过[500]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}