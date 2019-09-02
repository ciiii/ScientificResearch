using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教设置[类]
    /// </summary>
    [Serializable]
	public partial class 继教设置 
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
        [Required(ErrorMessage ="请提供[课时课件通过时长百分比]")]
		public int 课时课件通过时长百分比 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[理论考试及格分百分比]")]
		public int 理论考试及格分百分比 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[最大允许离开界面次数]")]
		public int 最大允许离开界面次数 { get; set; }
        
        
        #endregion
	}
}