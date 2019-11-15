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
        public int 文件夹编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 评分表名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 项目数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 总分值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否被引用 { get; set; }
        
          
        #endregion
	}
}