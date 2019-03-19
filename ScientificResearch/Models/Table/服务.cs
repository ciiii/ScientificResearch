using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 服务[类]
    /// </summary>
    [Serializable]
	public partial class 服务 
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
        [MaxLength(200,ErrorMessage ="名称不能超过[100]字")]
		public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(200,ErrorMessage ="Logo不能超过[100]字")]
		public string Logo { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[是否启用]")]
		public bool 是否启用 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(2000,ErrorMessage ="备注不能超过[1000]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}