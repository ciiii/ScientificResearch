﻿using System;
using System.Data;

namespace ScientificResearch.Models
{
    /// <summary>
    /// sp_角色的权限_增改删[类]
    /// </summary>
    [Serializable]
	public class sp_角色的权限_增改删 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
		public int 角色编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DataTable 权限编号 { get; set; }
        
          
        #endregion
	}
}