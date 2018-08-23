using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 项目经费预算[类]
    /// </summary>
    [Serializable]
	public partial class 项目经费预算 
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
        [Required(ErrorMessage ="请提供[项目支出类型]")]
        [MaxLength(100,ErrorMessage ="项目支出类型不能超过[50]字")]
		public string 项目支出类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[项目支出内容]")]
        [MaxLength(100,ErrorMessage ="项目支出内容不能超过[50]字")]
		public string 项目支出内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[财务科目]")]
        [MaxLength(100,ErrorMessage ="财务科目不能超过[50]字")]
		public string 财务科目 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 批准经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 配套经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="编制依据不能超过[50]字")]
		public string 编制依据 { get; set; }
        
        
        #endregion
	}
}