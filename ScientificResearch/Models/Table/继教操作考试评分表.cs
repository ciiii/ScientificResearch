using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 继教操作考试评分表[类]
    /// </summary>
    [Serializable]
	public partial class 继教操作考试评分表 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[操作考试编号]")]
		public int 操作考试编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[评分表编号]")]
		public int 评分表编号 { get; set; }
        
        
        #endregion
	}
}