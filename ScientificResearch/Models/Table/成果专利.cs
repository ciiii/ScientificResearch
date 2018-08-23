using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 成果专利[302类]
    /// </summary>
    [Serializable]
	public partial class 成果专利 
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
        [Required(ErrorMessage ="请提供[专利名称]")]
        [MaxLength(100,ErrorMessage ="专利名称不能超过[50]字")]
		public string 专利名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="专利国别不能超过[25]字")]
		public string 专利国别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[专利类型]")]
        [MaxLength(50,ErrorMessage ="专利类型不能超过[25]字")]
		public string 专利类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="专利范围不能超过[25]字")]
		public string 专利范围 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否授权 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="代理机构不能超过[250]字")]
		public string 代理机构 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 年度 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[专利权人名称]")]
        [MaxLength(50,ErrorMessage ="专利权人名称不能超过[25]字")]
		public string 专利权人名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="申请号不能超过[25]字")]
		public string 申请号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[申请日期]")]
		public DateTime? 申请日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[公开号]")]
        [MaxLength(50,ErrorMessage ="公开号不能超过[25]字")]
		public string 公开号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 公开日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="授权机构不能超过[50]字")]
		public string 授权机构 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="专利号不能超过[50]字")]
		public string 专利号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="国际专利主分类号不能超过[50]字")]
		public string 国际专利主分类号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 授权公告日 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="证书号不能超过[50]字")]
		public string 证书号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否职务发明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否生效 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 发明人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 奖励金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 超额费用 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="超额费用来源不能超过[50]字")]
		public string 超额费用来源 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="专利摘要不能超过[250]字")]
		public string 专利摘要 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 相关文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 代理费金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="代理费发票号不能超过[50]字")]
		public string 代理费发票号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 代理费付款日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 代理资助金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 代理办理资助日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 代理费到账日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 申请费是否减缓 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 申请费金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="申请费收据号不能超过[50]字")]
		public string 申请费收据号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 申请费支付日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 申请费资助金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 申请费办理资助日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 申请费到账日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 申请审查费是否延缓 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 申请审查费用 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="申请审查费收据编号不能超过[50]字")]
		public string 申请审查费收据编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 申请审查费付款日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 申请审查费资助金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 申请审查费资助日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 申请审查费到账日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 授权费是否减缓 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 授权费用金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="授权费收据号不能超过[50]字")]
		public string 授权费收据号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 授权费付款日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 授权费资助金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 授权费办理资助日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 授权费到账日期 { get; set; }
        
        
        #endregion
	}
}