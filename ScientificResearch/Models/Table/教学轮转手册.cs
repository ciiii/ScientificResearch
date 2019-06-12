using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学轮转手册[类]
    /// </summary>
    [Serializable]
	public partial class 教学轮转手册 
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
        [Required(ErrorMessage ="请提供[教学轮转编号]")]
		public int 教学轮转编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[教学轮转手册类型编号]")]
		public int 教学轮转手册类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 教学专业科室任务类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 操作时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 病人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(200,ErrorMessage ="概要不能超过[100]字")]
		public string 概要 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(200,ErrorMessage ="附件不能超过[100]字")]
		public string 附件 { get; set; }
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