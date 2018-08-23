using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 成果作者[类]
    /// </summary>
    [Serializable]
	public partial class 成果作者 
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
        [Required(ErrorMessage ="请提供[成果类型]")]
		public int 成果类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[成果编号]")]
		public int 成果编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[作者级别]")]
        [MaxLength(50,ErrorMessage ="作者级别不能超过[25]字")]
		public string 作者级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[作者编号]")]
		public int 作者编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 工作量占比 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 完成字数 { get; set; }
        
        
        #endregion
	}
}