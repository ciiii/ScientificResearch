using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学轮转手册完成任务[类]
    /// </summary>
    [Serializable]
	public partial class 教学轮转手册完成任务 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[教学轮转手册编号]")]
		public int 教学轮转手册编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[教学轮转任务编号]")]
		public int 教学轮转任务编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}