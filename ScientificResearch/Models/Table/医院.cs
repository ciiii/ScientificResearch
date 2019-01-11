using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 医院[类]
    /// </summary>
    [Serializable]
	public partial class 医院 
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
        [Required(ErrorMessage ="请提供[代码]")]
        [MaxLength(200,ErrorMessage ="代码不能超过[100]字")]
		public string 代码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="联系人不能超过[25]字")]
		public string 联系人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="联系电话不能超过[25]字")]
		public string 联系电话 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="地址不能超过[500]字")]
		public string 地址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(2000,ErrorMessage ="备注不能超过[1000]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}