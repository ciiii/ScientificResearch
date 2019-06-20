using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_教学活动评价_按项目统计[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_教学活动评价_按项目统计 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学活动类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
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
        public string 说明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 平均得分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 评价人数 { get; set; }
        
          
        #endregion
	}
}