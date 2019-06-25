using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学360评价[类]
    /// </summary>
    [Serializable]
	public partial class v_教学360评价 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学360评价方向名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 来源类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 评价人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 评价人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 评价人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 目标类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 被评价人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 被评价人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 被评价人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 评价内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 评价时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 平均评分 { get; set; }
        
          
        #endregion
	}
}