using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教试卷中试题[类]
    /// </summary>
    [Serializable]
	public partial class v_继教试卷中试题 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 文件夹编号 { get; set; }
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
        public string 题目解析 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 难易度 { get; set; }
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
        public int 试卷编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 试卷结构编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 分值 { get; set; }
        
          
        #endregion
	}
}