using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 成果著作[类]
    /// </summary>
    [Serializable]
	public partial class 成果著作 
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
        [Required(ErrorMessage ="请提供[著作名称]")]
        [MaxLength(100,ErrorMessage ="著作名称不能超过[50]字")]
		public string 著作名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[出版社名称]")]
        [MaxLength(100,ErrorMessage ="出版社名称不能超过[50]字")]
		public string 出版社名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="著作形式不能超过[25]字")]
		public string 著作形式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[年度]")]
		public int 年度 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[著作出版日期]")]
		public DateTime? 著作出版日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[ISBN号]")]
        [MaxLength(50,ErrorMessage ="ISBN号不能超过[25]字")]
		public string ISBN号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[著作字数]")]
		public int 著作字数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="奖励情况不能超过[25]字")]
		public string 奖励情况 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="出版地不能超过[25]字")]
		public string 出版地 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="出版社级别不能超过[25]字")]
		public string 出版社级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[著作类型]")]
        [MaxLength(50,ErrorMessage ="著作类型不能超过[25]字")]
		public string 著作类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否译为外文 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[语种]")]
        [MaxLength(50,ErrorMessage ="语种不能超过[25]字")]
		public string 语种 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="学科门类不能超过[25]字")]
		public string 学科门类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="一级学科不能超过[25]字")]
		public string 一级学科 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="二级学科不能超过[25]字")]
		public string 二级学科 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="三级学科不能超过[25]字")]
		public string 三级学科 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 作者人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 发行价 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 封面相关文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 版权页相关文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 前言页相关文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 完整目录页相关文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 其他相关文件路径 { get; set; }
        
        
        #endregion
	}
}