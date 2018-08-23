using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 报销详情[这个应该由选择的经费模版为基础,填写报销金额   财务科目这个一般都没显示,   判断一个项目对应的多个报销的更多个报销详情中某个项目支出内容已经报销了多少,   就按项目支出类型+项目支出内容分组类]
    /// </summary>
    [Serializable]
	public partial class 报销详情 
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
        [Required(ErrorMessage ="请提供[报销编号]")]
		public int 报销编号 { get; set; }
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
        [MaxLength(50,ErrorMessage ="财务科目不能超过[25]字")]
		public string 财务科目 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[报销金额]")]
		public decimal 报销金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}