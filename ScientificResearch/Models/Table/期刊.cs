using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 期刊[类]
    /// </summary>
    [Serializable]
	public partial class 期刊 
	{       
        #region 属性
        /// <summary>
		/// 编号
		/// </summary>
        [DisplayName("编号")]
        [Required(ErrorMessage ="请提供[编号]")]
		public int 编号 { get; set; }
        /// <summary>
		/// 代码
		/// </summary>
        [DisplayName("代码")]
        [MaxLength(50,ErrorMessage ="代码不能超过[25]字")]
		public string 代码 { get; set; }
        /// <summary>
		/// 名称(不加书名号;名称或英文刊名至少提供一个)
		/// </summary>
        [DisplayName("名称(不加书名号;名称或英文刊名至少提供一个)")]
        [MaxLength(500,ErrorMessage ="名称不能超过[250]字")]
		public string 名称 { get; set; }
        /// <summary>
		/// 英文刊名
		/// </summary>
        [DisplayName("英文刊名")]
        [MaxLength(500,ErrorMessage ="英文刊名不能超过[250]字")]
		public string 英文刊名 { get; set; }
        /// <summary>
		/// 主办单位
		/// </summary>
        [DisplayName("主办单位")]
        [MaxLength(500,ErrorMessage ="主办单位不能超过[250]字")]
		public string 主办单位 { get; set; }
        /// <summary>
		/// 期刊系列
		/// </summary>
        [DisplayName("期刊系列")]
        [MaxLength(500,ErrorMessage ="期刊系列不能超过[250]字")]
		public string 期刊系列 { get; set; }
        /// <summary>
		/// 收录情况
		/// </summary>
        [DisplayName("收录情况")]
        [MaxLength(1000,ErrorMessage ="收录情况不能超过[500]字")]
		public string 收录情况 { get; set; }
        /// <summary>
		/// 语种
		/// </summary>
        [DisplayName("语种")]
        [MaxLength(50,ErrorMessage ="语种不能超过[25]字")]
		public string 语种 { get; set; }
        /// <summary>
		/// JCR分区
		/// </summary>
        [DisplayName("JCR分区")]
        [MaxLength(50,ErrorMessage ="JCR分区不能超过[25]字")]
		public string JCR分区 { get; set; }
        /// <summary>
		/// 编目名称
		/// </summary>
        [DisplayName("编目名称")]
        [MaxLength(100,ErrorMessage ="编目名称不能超过[50]字")]
		public string 编目名称 { get; set; }
        /// <summary>
		/// 编目类别
		/// </summary>
        [DisplayName("编目类别")]
        [MaxLength(100,ErrorMessage ="编目类别不能超过[50]字")]
		public string 编目类别 { get; set; }
        /// <summary>
		/// 年度
		/// </summary>
        [DisplayName("年度")]
		public int? 年度 { get; set; }
        /// <summary>
		/// 创刊日期
		/// </summary>
        [DisplayName("创刊日期")]
		public DateTime? 创刊日期 { get; set; }
        /// <summary>
		/// 被引用次数
		/// </summary>
        [DisplayName("被引用次数")]
		public int? 被引用次数 { get; set; }
        /// <summary>
		/// 影响因子
		/// </summary>
        [DisplayName("影响因子")]
		public decimal? 影响因子 { get; set; }
        /// <summary>
		/// 特征因子分值
		/// </summary>
        [DisplayName("特征因子分值")]
		public decimal? 特征因子分值 { get; set; }
        /// <summary>
		/// ISSN号
		/// </summary>
        [DisplayName("ISSN号")]
        [MaxLength(50,ErrorMessage ="ISSN号不能超过[25]字")]
		public string ISSN号 { get; set; }
        /// <summary>
		/// CN号
		/// </summary>
        [DisplayName("CN号")]
        [MaxLength(50,ErrorMessage ="CN号不能超过[25]字")]
		public string CN号 { get; set; }
        /// <summary>
		/// 出版周期
		/// </summary>
        [DisplayName("出版周期")]
        [MaxLength(50,ErrorMessage ="出版周期不能超过[25]字")]
		public string 出版周期 { get; set; }
        /// <summary>
		/// 出版地
		/// </summary>
        [DisplayName("出版地")]
        [MaxLength(50,ErrorMessage ="出版地不能超过[25]字")]
		public string 出版地 { get; set; }
        /// <summary>
		/// 开本
		/// </summary>
        [DisplayName("开本")]
        [MaxLength(50,ErrorMessage ="开本不能超过[25]字")]
		public string 开本 { get; set; }
        /// <summary>
		/// 备注
		/// </summary>
        [DisplayName("备注")]
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}