using System;
using System.Data;

namespace ScientificResearch.Models
{
    /// <summary>
    /// sp_分类统计数量[类]
    /// </summary>
    [Serializable]
	public class sp_分类统计数量 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
		public string structureName { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string tableName { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string whereStr { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string groupStr { get; set; }
        
          
        #endregion
	}
}