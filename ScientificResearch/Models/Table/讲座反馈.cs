using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 讲座反馈[类]
    /// </summary>
    [Serializable]
	public partial class 讲座反馈 
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
        [Required(ErrorMessage ="请提供[讲座编号]")]
		public int 讲座编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="专家姓名不能超过[25]字")]
		public string 专家姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="专家身份证号码不能超过[25]字")]
		public string 专家身份证号码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="专家护照号不能超过[25]字")]
		public string 专家护照号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="专家联系方式不能超过[25]字")]
		public string 专家联系方式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 专家讲课费金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="结算方式不能超过[25]字")]
		public string 结算方式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[活动持续分钟]")]
		public int 活动持续分钟 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[参会人数]")]
		public int 参会人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 讲座附件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="讲座效果不能超过[250]字")]
		public string 讲座效果 { get; set; }
        
        
        #endregion
	}
}