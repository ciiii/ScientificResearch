using System;
using System.Data;

namespace ScientificResearch.Models
{
    /// <summary>
    /// sp_教学通知公告_接收[类]
    /// </summary>
    [Serializable]
	public class sp_教学通知公告_接收 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
		public int 通知公告编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 接收人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int 接收人编号 { get; set; }
        
          
        #endregion
	}
}