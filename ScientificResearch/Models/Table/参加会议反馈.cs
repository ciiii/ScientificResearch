using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 参加会议反馈[211类]
    /// </summary>
    [Serializable]
	public partial class 参加会议反馈 
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
        [Required(ErrorMessage ="请提供[参加会议编号]")]
		public int 参加会议编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 活动持续分钟 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 参会人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="参会总结不能超过[250]字")]
		public string 参会总结 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 会议反馈文件路径 { get; set; }
        
        
        #endregion
	}
}