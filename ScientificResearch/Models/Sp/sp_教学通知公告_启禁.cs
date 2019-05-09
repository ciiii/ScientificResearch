using System;
using System.Data;

namespace ScientificResearch.Models
{
    /// <summary>
    /// sp_教学通知公告_启禁[类]
    /// </summary>
    [Serializable]
	public class sp_教学通知公告_启禁 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
		public DataTable tt_编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool 是否启用 { get; set; }
        
          
        #endregion
	}
}