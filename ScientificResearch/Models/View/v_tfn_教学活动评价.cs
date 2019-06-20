using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_教学活动评价[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_教学活动评价 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public string 评价项目名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 标准分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否启用 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 评价人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 评价人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 评价人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 教学活动编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 教学活动评价项目编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 评分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}