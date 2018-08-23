using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 步骤类型状态[类]
    /// </summary>
    [Serializable]
	public partial class 步骤类型状态 
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
        [Required(ErrorMessage ="请提供[步骤类型编号]")]
		public int 步骤类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[状态值]")]
		public int 状态值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="操作说明不能超过[50]字")]
		public string 操作说明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="操作提示不能超过[500]字")]
		public string 操作提示 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[状态说明]")]
        [MaxLength(100,ErrorMessage ="状态说明不能超过[50]字")]
		public string 状态说明 { get; set; }
        
        
        #endregion
	}
}