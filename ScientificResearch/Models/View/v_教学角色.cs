using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学角色[类]
    /// </summary>
    [Serializable]
	public partial class v_教学角色 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 能否直接配置人员 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 功能数 { get; set; }
        
          
        #endregion
	}
}