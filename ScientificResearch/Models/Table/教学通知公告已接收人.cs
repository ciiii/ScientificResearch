using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学通知公告已接收人[类]
    /// </summary>
    [Serializable]
	public partial class 教学通知公告已接收人 
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
        [Required(ErrorMessage ="请提供[教学通知公告编号]")]
		public int 教学通知公告编号 { get; set; }
        /// <summary>
		/// 目前只可能是人员或学员
		/// </summary>
        [DisplayName("目前只可能是人员或学员")]
        [Required(ErrorMessage ="请提供[接收人类型]")]
        [MaxLength(50,ErrorMessage ="接收人类型不能超过[25]字")]
		public string 接收人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[接收人编号]")]
		public int 接收人编号 { get; set; }
        
        
        #endregion
	}
}