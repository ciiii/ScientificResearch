using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学宿舍楼[类]
    /// </summary>
    [Serializable]
	public partial class 教学宿舍楼 
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
        [Required(ErrorMessage ="请提供[名称]")]
        [MaxLength(50,ErrorMessage ="名称不能超过[25]字")]
		public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 层数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 单元数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 每单元每层户数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 每户床数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}