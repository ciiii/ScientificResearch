using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教活动可参与人OpenId[类]
    /// </summary>
    [Serializable]
	public partial class v_继教活动可参与人OpenId 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 活动编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 可参与人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 可参与人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string OpenId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string DbKey { get; set; }
        
          
        #endregion
	}
}