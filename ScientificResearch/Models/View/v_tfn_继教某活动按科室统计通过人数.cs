using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_继教某活动按科室统计通过人数[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_继教某活动按科室统计通过人数 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 部门编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 部门名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 参与人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 完成人数 { get; set; }
        
          
        #endregion
	}
}