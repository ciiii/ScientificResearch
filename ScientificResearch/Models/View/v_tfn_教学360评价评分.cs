using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_教学360评价评分[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_教学360评价评分 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int? 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 教学360评价编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 教学360评价项目编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学360评价项目名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 标准分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学360评价项目备注 { get; set; }
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