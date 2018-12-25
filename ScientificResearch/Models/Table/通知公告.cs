using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 通知公告[类]
    /// </summary>
    [Serializable]
	public partial class 通知公告 
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
        [Required(ErrorMessage ="请提供[通知类型]")]
        [MaxLength(50,ErrorMessage ="通知类型不能超过[25]字")]
		public string 通知类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="通知标识不能超过[25]字")]
		public string 通知标识 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[发送人编号]")]
		public int 发送人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[通知名称]")]
        [MaxLength(100,ErrorMessage ="通知名称不能超过[50]字")]
		public string 通知名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[关闭时间]")]
		public DateTime? 关闭时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="相关文件路径不能超过[250]字")]
		public string 相关文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 通知内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[接收人数]")]
		public int 接收人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[已接收人数]")]
		public int 已接收人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[是否启用]")]
		public bool 是否启用 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="备注不能超过[500]字")]
		public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否必读 { get; set; }
        
        
        #endregion
	}
}