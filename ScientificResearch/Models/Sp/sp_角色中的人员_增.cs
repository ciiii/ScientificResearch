﻿using System;
using System.Data;

namespace ScientificResearch.Models
{
    /// <summary>
    /// sp_角色中的人员_增[类]
    /// </summary>
    [Serializable]
	public class sp_角色中的人员_增 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
		public int 角色编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DataTable 人员编号 { get; set; }
        
          
        #endregion
	}
}