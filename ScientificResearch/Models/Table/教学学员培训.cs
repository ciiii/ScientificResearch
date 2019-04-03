using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学学员培训[类]
    /// </summary>
    [Serializable]
	public partial class 教学学员培训 
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
		public DateTime? 报到时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 教学本院策略编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 计划开始培训日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 计划结束培训日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 实际开始培训日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 实际结束培训日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 退培日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 结业日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(200,ErrorMessage ="证书不能超过[100]字")]
		public string 证书 { get; set; }
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