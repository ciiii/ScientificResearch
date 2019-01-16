using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// V_医院_启用[类]
    /// </summary>
    [Serializable]
	public partial class V_医院_启用 
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
        public string 代码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 联系人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 联系电话 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 地址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否启用 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}