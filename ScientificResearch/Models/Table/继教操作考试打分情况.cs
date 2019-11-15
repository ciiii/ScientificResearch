using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教操作考试打分情况[类]
    /// </summary>
    [Serializable]
	public partial class 继教操作考试打分情况 
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
        [Required(ErrorMessage ="请提供[操作考试参与情况编号]")]
		public int 操作考试参与情况编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[操作考试评分项目要求编号]")]
		public int 操作考试评分项目要求编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[打分]")]
		public decimal 打分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="备注不能超过[500]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}