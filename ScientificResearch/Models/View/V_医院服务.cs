using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// V_医院服务[类]
    /// </summary>
    [Serializable]
	public partial class V_医院服务 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int? 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 医院编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 医院名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 服务编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 服务名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 链接地址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否启用 { get; set; }
        
          
        #endregion
	}
}