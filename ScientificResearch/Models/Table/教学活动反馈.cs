using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学活动反馈[类]
    /// </summary>
    [Serializable]
	public partial class 教学活动反馈 
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
        [Required(ErrorMessage ="请提供[教学活动编号]")]
		public int 教学活动编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[学员编号]")]
		public int 学员编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[反馈内容]")]
        [MaxLength(2000,ErrorMessage ="反馈内容不能超过[1000]字")]
		public string 反馈内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(200,ErrorMessage ="附件不能超过[100]字")]
		public string 附件 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[建立时间]")]
		public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}