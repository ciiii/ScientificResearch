using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教慕课课时课件学习情况[类]
    /// </summary>
    [Serializable]
	public partial class 继教慕课课时课件学习情况 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[学习人类型]")]
        [MaxLength(50,ErrorMessage ="学习人类型不能超过[25]字")]
		public string 学习人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[学习人编号]")]
		public int 学习人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[课时课件编号]")]
		public int 课时课件编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[学习时长]")]
		public int 学习时长 { get; set; }
        
        
        #endregion
	}
}