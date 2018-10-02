using System;
using System.Data;

namespace ScientificResearch.Models
{
    /// <summary>
    /// sp_按指定字段统计成果[类]
    /// </summary>
    [Serializable]
	public class sp_按指定字段统计成果 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
		public string 字段名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 字段显示名 { get; set; }
        
          
        #endregion
	}
}