using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教签到规定[类]
    /// </summary>
    [Serializable]
	public partial class v_继教签到规定 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 活动编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 签到编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 签到开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 签到结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 二维码变化秒数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}