using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学活动[类]
    /// </summary>
    [Serializable]
	public partial class v_教学活动 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 活动主题 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 活动开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 活动结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 活动地点 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学活动类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学活动类型名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 主讲人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 主讲人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 主讲人职称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 活动内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学病例 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 病人编号 { get; set; }
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
        /// <summary>
		/// 
		/// </summary>
        public int? 反馈数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 评价次数 { get; set; }
        
          
        #endregion
	}
}