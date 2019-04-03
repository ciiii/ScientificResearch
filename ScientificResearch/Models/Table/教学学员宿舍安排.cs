using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学学员宿舍安排[类]
    /// </summary>
    [Serializable]
	public partial class 教学学员宿舍安排 
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
		public int? 宿舍楼编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="门禁卡卡号不能超过[25]字")]
		public string 门禁卡卡号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="门牌号及床号不能超过[25]字")]
		public string 门牌号及床号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="职位不能超过[25]字")]
		public string 职位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 水起数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 电起数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 气起数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 滞纳金比例 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 入住日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 退出日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="退出原因不能超过[250]字")]
		public string 退出原因 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="宿舍安排说明不能超过[250]字")]
		public string 宿舍安排说明 { get; set; }
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