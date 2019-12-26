using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教签到参与情况[类]
    /// </summary>
    [Serializable]
	public partial class v_继教签到参与情况 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 签到编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 签到规定编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 签到规定名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 签到规定开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 签到规定结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 二维码变化秒数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 签到规定备注 { get; set; }
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
        public DateTime? 签到时间 { get; set; }
        
          
        #endregion
	}
}