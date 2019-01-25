using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// VTFN某医院购买的服务[类]
    /// </summary>
    [Serializable]
	public partial class VTFN某医院购买的服务 
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
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 电脑链接地址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 手机链接地址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否启用 { get; set; }
        
          
        #endregion
	}
}