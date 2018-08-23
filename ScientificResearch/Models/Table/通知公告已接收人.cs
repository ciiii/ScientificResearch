using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 通知公告已接收人[类]
    /// </summary>
    [Serializable]
	public partial class 通知公告已接收人 
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
        [Required(ErrorMessage ="请提供[通知公告编号]")]
		public int 通知公告编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[接收人编号]")]
		public int 接收人编号 { get; set; }
        
        
        #endregion
	}
}