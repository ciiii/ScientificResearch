using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教试题备选答案[类]
    /// </summary>
    [Serializable]
	public partial class 继教试题备选答案 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[试题编号]")]
		public int 试题编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[备选答案编码]")]
        [MaxLength(1,ErrorMessage ="备选答案编码不能超过[0]字")]
		public string 备选答案编码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[备选答案内容]")]
        [MaxLength(1000,ErrorMessage ="备选答案内容不能超过[500]字")]
		public string 备选答案内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="备注不能超过[500]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}