using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 新闻[类]
    /// </summary>
    [Serializable]
	public partial class 新闻 
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
        [MaxLength(200,ErrorMessage ="分类不能超过[100]字")]
		public string 分类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[标题]")]
        [MaxLength(200,ErrorMessage ="标题不能超过[100]字")]
		public string 标题 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Obsolete]
		public DateTime? 建立时间 { get; set; }
        
        
        #endregion
	}
}