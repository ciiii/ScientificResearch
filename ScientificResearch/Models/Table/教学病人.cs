using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学病人[类]
    /// </summary>
    [Serializable]
	public partial class 教学病人 
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
        [Required(ErrorMessage ="请提供[姓名]")]
        [MaxLength(50,ErrorMessage ="姓名不能超过[25]字")]
		public string 姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(10,ErrorMessage ="性别不能超过[5]字")]
		public string 性别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 出生日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="住院号不能超过[25]字")]
		public string 住院号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="住院床号不能超过[25]字")]
		public string 住院床号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="主要诊断不能超过[250]字")]
		public string 主要诊断 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="次要诊断不能超过[250]字")]
		public string 次要诊断 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 入院日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 出院日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}