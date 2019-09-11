using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_继教签到参与情况[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_继教签到参与情况 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int? 签到编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 参与人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 参与人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 参与人称谓 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 签到次数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否通过 { get; set; }
        
          
        #endregion
	}
}