using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学专业[类]
    /// </summary>
    [Serializable]
	public partial class 教学专业 
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
        [Required(ErrorMessage ="请提供[名称]")]
        [MaxLength(50,ErrorMessage ="名称不能超过[25]字")]
		public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[年份]")]
		public int 年份 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[是否国家标准]")]
		public bool 是否国家标准 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="标准代码不能超过[25]字")]
		public string 标准代码 { get; set; }
        /// <summary>
		/// 单位是周,前台显示可以做别的格式.
		/// </summary>
        [DisplayName("单位是周,前台显示可以做别的格式.")]
		public int? 最低培训时长 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 学习要求及目标 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}