using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学活动[类]
    /// </summary>
    [Serializable]
	public partial class 教学活动 
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
        [Required(ErrorMessage ="请提供[活动主题]")]
        [MaxLength(200,ErrorMessage ="活动主题不能超过[100]字")]
		public string 活动主题 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[活动开始时间]")]
		public DateTime? 活动开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[活动结束时间]")]
		public DateTime? 活动结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[活动地点]")]
        [MaxLength(200,ErrorMessage ="活动地点不能超过[100]字")]
		public string 活动地点 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[教学活动类型编号]")]
		public int 教学活动类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 主讲人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="主讲人姓名不能超过[25]字")]
		public string 主讲人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="主讲人职称不能超过[25]字")]
		public string 主讲人职称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(2000,ErrorMessage ="活动内容不能超过[1000]字")]
		public string 活动内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(200,ErrorMessage ="教学病例不能超过[100]字")]
		public string 教学病例 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 病人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[建立人]")]
		public int 建立人 { get; set; }
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