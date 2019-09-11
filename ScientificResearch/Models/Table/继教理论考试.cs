using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教理论考试[类]
    /// </summary>
    [Serializable]
	public partial class 继教理论考试 
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
        [Required(ErrorMessage ="请提供[是否允许任何人参与]")]
		public bool 是否允许任何人参与 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[试卷编号]")]
		public int 试卷编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[时长]")]
		public int 时长 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[及格分数]")]
		public int 及格分数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[是否试题乱序]")]
		public bool 是否试题乱序 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[是否允许考生查看成绩]")]
		public bool 是否允许考生查看成绩 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[是否允许考生查看答案]")]
		public bool 是否允许考生查看答案 { get; set; }
        
        
        #endregion
	}
}