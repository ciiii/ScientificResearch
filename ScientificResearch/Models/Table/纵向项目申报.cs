using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 纵向项目申报[分类: 1-科研项目 2-重点学科 3-人才培养   经办人没啥用吧?   项目子类也不知道什么用   300类]
    /// </summary>
    [Serializable]
	public partial class 纵向项目申报 
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
        [Required(ErrorMessage ="请提供[分类]")]
		public int 分类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[项目名称]")]
        [MaxLength(100,ErrorMessage ="项目名称不能超过[50]字")]
		public string 项目名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[申报人编号]")]
		public int 申报人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="学科门类不能超过[25]字")]
		public string 学科门类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="学科类型不能超过[25]字")]
		public string 学科类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[申报年度]")]
		public int 申报年度 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目类型不能超过[25]字")]
		public string 项目类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目级别不能超过[25]字")]
		public string 项目级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目来源单位不能超过[25]字")]
		public string 项目来源单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目类别不能超过[25]字")]
		public string 项目类别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 申报时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[申请经费]")]
		public decimal 申请经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[计划开始日期]")]
		public DateTime? 计划开始日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[计划完成日期]")]
		public DateTime? 计划完成日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目等级不能超过[25]字")]
		public string 项目等级 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否委托外单位进行实验或实验分析 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="实验委托检测内容不能超过[500]字")]
		public string 实验委托检测内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="项目摘要不能超过[500]字")]
		public string 项目摘要 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否需要伦理评审 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否需要伦理批文 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="伦理批文编号不能超过[25]字")]
		public string 伦理批文编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 伦理批文路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 项目申报书路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否立项 { get; set; }
        
        
        #endregion
	}
}