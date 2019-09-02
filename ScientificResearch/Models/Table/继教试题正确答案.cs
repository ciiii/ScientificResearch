using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教试题正确答案[类]
    /// </summary>
    [Serializable]
	public partial class 继教试题正确答案 
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
        [Required(ErrorMessage ="请提供[正确答案编码]")]
        [MaxLength(1,ErrorMessage ="正确答案编码不能超过[0]字")]
		public string 正确答案编码 { get; set; }
        
        
        #endregion
	}
}