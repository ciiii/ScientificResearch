using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学医疗差错及事故记录[类]
    /// </summary>
    [Serializable]
	public partial class 教学医疗差错及事故记录 
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
        [Required(ErrorMessage ="请提供[教学轮转编号]")]
		public int 教学轮转编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[处理日期]")]
		public DateTime? 处理日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[处理类别]")]
        [MaxLength(50,ErrorMessage ="处理类别不能超过[25]字")]
		public string 处理类别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[处理原因]")]
        [MaxLength(500,ErrorMessage ="处理原因不能超过[250]字")]
		public string 处理原因 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[处理意见]")]
        [MaxLength(500,ErrorMessage ="处理意见不能超过[250]字")]
		public string 处理意见 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(200,ErrorMessage ="附件不能超过[100]字")]
		public string 附件 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}