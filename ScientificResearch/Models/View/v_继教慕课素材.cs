﻿using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教慕课素材[类]
    /// </summary>
    [Serializable]
	public partial class v_继教慕课素材 
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
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 大小 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 时长 { get; set; }
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
        public bool? 是否被引用 { get; set; }
        
          
        #endregion
	}
}