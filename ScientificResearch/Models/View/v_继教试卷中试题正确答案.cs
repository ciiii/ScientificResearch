using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教试卷中试题正确答案[类]
    /// </summary>
    [Serializable]
	public partial class v_继教试卷中试题正确答案 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 试题编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 正确答案编码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 试卷编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 试卷结构编号 { get; set; }
        
          
        #endregion
	}
}