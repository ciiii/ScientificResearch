using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学考勤情况[类]
    /// </summary>
    [Serializable]
	public partial class v_教学考勤情况 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 学员编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学轮转编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 考勤日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学考勤类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学考勤类型名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 说明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 建立人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}