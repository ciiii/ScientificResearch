using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 字典[类]
    /// </summary>
    [Serializable]
	public partial class 字典 
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
        [MaxLength(50,ErrorMessage ="分类不能超过[25]字")]
		public string 分类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[值]")]
        [MaxLength(50,ErrorMessage ="值不能超过[25]字")]
		public string 值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[上级编号]")]
		public int 上级编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[级别]")]
		public int 级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[排序]")]
		public int 排序 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}