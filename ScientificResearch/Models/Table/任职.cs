using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 任职[类]
    /// </summary>
    [Serializable]
	public partial class 任职 
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
        [Required(ErrorMessage ="请提供[任职开始时间]")]
		public DateTime? 任职开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 任职截止时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[任职人员编号]")]
		public int 任职人员编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[任职团体名称]")]
        [MaxLength(200,ErrorMessage ="任职团体名称不能超过[100]字")]
		public string 任职团体名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[所任职务]")]
        [MaxLength(200,ErrorMessage ="所任职务不能超过[100]字")]
		public string 所任职务 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 相关文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[建立时间]")]
		public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}