﻿using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v1_合同买方性质[类]
    /// </summary>
    [Serializable]
	public partial class v1_合同买方性质 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 上级编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 排序 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 是否存在下级 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}