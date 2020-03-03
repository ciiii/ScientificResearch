using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_继教某活动的通过情况统计[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_继教某活动的通过情况统计 
	{       
              
        #region 属性
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
        public int 参与活动内容次数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 通过活动内容次数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 活动内容数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否完成 { get; set; }
        
          
        #endregion
	}
}