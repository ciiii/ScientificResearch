using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// V_医院服务_带账号[类]
    /// </summary>
    [Serializable]
	public partial class V_医院服务_带账号 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int? 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 医院名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 服务名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 登录账号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 登录密码 { get; set; }
        
          
        #endregion
	}
}