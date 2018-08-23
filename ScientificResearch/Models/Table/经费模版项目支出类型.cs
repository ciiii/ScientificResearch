using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 经费模版项目支出类型[类]
    /// </summary>
    [Serializable]
	public partial class 经费模版项目支出类型 
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
        [Required(ErrorMessage ="请提供[所属经费模版编号]")]
		public int 所属经费模版编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[项目支出类型]")]
        [MaxLength(100,ErrorMessage ="项目支出类型不能超过[50]字")]
		public string 项目支出类型 { get; set; }
        /// <summary>
		/// 0-100 %
		/// </summary>
        [DisplayName("0-100 %")]
        [Required(ErrorMessage ="请提供[经费占比]")]
		public int 经费占比 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}