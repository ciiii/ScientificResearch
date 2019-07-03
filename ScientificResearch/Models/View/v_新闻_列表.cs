using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_新闻_列表[类]
    /// </summary>
    [Serializable]
	public partial class v_新闻_列表 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 新闻分类编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 新闻分类名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 标题 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 标签 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 建立时间 { get; set; }
        
          
        #endregion
	}
}