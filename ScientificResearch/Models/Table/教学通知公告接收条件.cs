using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学通知公告接收条件[类]
    /// </summary>
    [Serializable]
	public partial class 教学通知公告接收条件 
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
        [Obsolete]
        [Required(ErrorMessage ="请提供[教学通知公告编号]")]
		public int 教学通知公告编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="接收者类型不能超过[25]字")]
		public string 接收者类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[接收者编号]")]
		public int 接收者编号 { get; set; }
        
        
        #endregion
	}
}