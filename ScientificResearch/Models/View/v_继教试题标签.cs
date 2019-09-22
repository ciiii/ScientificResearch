using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教试题标签[类]
    /// </summary>
    [Serializable]
	public partial class v_继教试题标签 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 试题编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 标签编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 标签名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 标签首字母 { get; set; }
        
          
        #endregion
	}
}