using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教操作考试批次[类]
    /// </summary>
    [Serializable]
	public partial class v_继教操作考试批次 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 考试编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 排序值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 考试开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 考试结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 考试地点 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 人数上限 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 二维码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 口令 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 及格分数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 描述 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 活动编号 { get; set; }
        
          
        #endregion
	}
}