using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 经费模版项目支出内容[类]
    /// </summary>
    [Serializable]
	public partial class 经费模版项目支出内容 
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
        [Required(ErrorMessage ="请提供[所属经费模版项目支出类型编号]")]
		public int 所属经费模版项目支出类型编号 { get; set; }
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
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}