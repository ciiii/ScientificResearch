using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教试卷结构[类]
    /// </summary>
    [Serializable]
	public partial class v_继教试卷结构 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 试卷编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 排序值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 总分值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 试题数量 { get; set; }
        
          
        #endregion
	}
}