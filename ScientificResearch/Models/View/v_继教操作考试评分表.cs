using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教操作考试评分表[类]
    /// </summary>
    [Serializable]
	public partial class v_继教操作考试评分表 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 操作考试编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 评分表编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 评分表名称 { get; set; }
        
          
        #endregion
	}
}