using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教自测[类]
    /// </summary>
    [Serializable]
	public partial class v_继教自测 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 活动编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 排序值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 地点 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否允许任何人参与 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 试卷编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 试卷名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 时长 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 及格分数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否试题乱序 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否允许考生查看成绩 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否允许考生查看答案 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 自测人次 { get; set; }
        
          
        #endregion
	}
}