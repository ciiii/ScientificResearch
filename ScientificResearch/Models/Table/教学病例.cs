using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学病例[类]
    /// </summary>
    [Serializable]
	public partial class 教学病例 
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
        [Required(ErrorMessage ="请提供[教学轮转任务编号]")]
		public int 教学轮转任务编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="文献类型不能超过[25]字")]
		public string 文献类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="病例类型不能超过[25]字")]
		public string 病例类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 病人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(2000,ErrorMessage ="病例内容不能超过[1000]字")]
		public string 病例内容 { get; set; }
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
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[是否通过审核]")]
		public bool 是否通过审核 { get; set; }
        
        
        #endregion
	}
}