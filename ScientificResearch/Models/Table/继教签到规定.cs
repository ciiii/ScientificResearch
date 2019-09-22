using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教签到规定[类]
    /// </summary>
    [Serializable]
	public partial class 继教签到规定 
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
        [Obsolete]
        [Required(ErrorMessage ="请提供[签到编号]")]
		public int 签到编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[名称]")]
        [MaxLength(50,ErrorMessage ="名称不能超过[25]字")]
		public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[签到开始时间]")]
		public DateTime? 签到开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[签到结束时间]")]
		public DateTime? 签到结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[二维码变化秒数]")]
		public int 二维码变化秒数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="备注不能超过[500]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}