using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教试题[类]
    /// </summary>
    [Serializable]
	public partial class v_继教试题 
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
        public string 类型名称 { get; set; }
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
        public int? 答题次数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 正确答题次数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 答题正确率 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 被引次数 { get; set; }
        
          
        #endregion
	}
}