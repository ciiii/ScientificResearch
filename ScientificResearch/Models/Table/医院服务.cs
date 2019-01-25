using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 医院服务[类]
    /// </summary>
    [Serializable]
	public partial class 医院服务 
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
        [Required(ErrorMessage ="请提供[医院编号]")]
		public int 医院编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[服务编号]")]
		public int 服务编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[电脑链接地址]")]
        [MaxLength(500,ErrorMessage ="电脑链接地址不能超过[250]字")]
		public string 电脑链接地址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[手机链接地址]")]
        [MaxLength(500,ErrorMessage ="手机链接地址不能超过[250]字")]
		public string 手机链接地址 { get; set; }
        
        
        #endregion
	}
}