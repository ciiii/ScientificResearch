using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教理论考试答题答案[类]
    /// </summary>
    [Serializable]
	public partial class 继教理论考试答题答案 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[理论考试答题情况编号]")]
		public int 理论考试答题情况编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[答题答案编码]")]
        [MaxLength(1,ErrorMessage ="答题答案编码不能超过[0]字")]
		public string 答题答案编码 { get; set; }
        
        
        #endregion
	}
}