using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 参加会议[210类]
    /// </summary>
    [Serializable]
	public partial class 参加会议 
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
        [Required(ErrorMessage ="请提供[会议名称]")]
        [MaxLength(100,ErrorMessage ="会议名称不能超过[50]字")]
		public string 会议名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[会议主办单位]")]
        [MaxLength(100,ErrorMessage ="会议主办单位不能超过[50]字")]
		public string 会议主办单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="会议承办单位不能超过[50]字")]
		public string 会议承办单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="研讨领域不能超过[50]字")]
		public string 研讨领域 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="学科类型不能超过[25]字")]
		public string 学科类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="会议地址不能超过[250]字")]
		public string 会议地址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[会议开始时间]")]
		public DateTime? 会议开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[会议结束时间]")]
		public DateTime? 会议结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 往返时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="会议网址不能超过[250]字")]
		public string 会议网址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="会议简介及申请理由不能超过[250]字")]
		public string 会议简介及申请理由 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[申请人编号]")]
		public int 申请人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 参会相关文件路径 { get; set; }
        
        
        #endregion
	}
}