using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 纵向项目结题[440类]
    /// </summary>
    [Serializable]
	public partial class 纵向项目结题 
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
        [Required(ErrorMessage ="请提供[纵向项目编号]")]
		public int 纵向项目编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="结题验收编号不能超过[50]字")]
		public string 结题验收编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 结题验收时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 结题验收是否合格 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 结题验收参与人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="结题资料路径不能超过[500]字")]
		public string 结题资料路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="备注不能超过[500]字")]
		public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 建立时间 { get; set; }
        
        
        #endregion
	}
}