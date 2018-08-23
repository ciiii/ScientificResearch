using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 下载中心[类]
    /// </summary>
    [Serializable]
	public partial class 下载中心 
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
        [Required(ErrorMessage ="请提供[文件名称]")]
        [MaxLength(200,ErrorMessage ="文件名称不能超过[100]字")]
		public string 文件名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[文件类型]")]
        [MaxLength(50,ErrorMessage ="文件类型不能超过[25]字")]
		public string 文件类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[文件路径]")]
        [MaxLength(500,ErrorMessage ="文件路径不能超过[250]字")]
		public string 文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[是否启用]")]
		public bool 是否启用 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[上传人编号]")]
		public int 上传人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}