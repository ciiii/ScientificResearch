using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_sp_教学考勤统计[类]
    /// </summary>
    [Serializable]
	public partial class v_sp_教学考勤统计 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 正常白班 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 正常休假 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 迟到 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 早退 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 脱岗 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 旷工 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 夜班 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 请假 { get; set; }
        
          
        #endregion
	}
}