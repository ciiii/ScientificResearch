using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教试题_考试时[类]
    /// </summary>
    [Serializable]
	public partial class v_继教试题_考试时 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 题干 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 试卷编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 试卷结构编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 试题编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 分值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 排序值 { get; set; }
        
          
        #endregion
	}
}