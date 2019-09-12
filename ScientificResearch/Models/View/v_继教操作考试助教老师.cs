using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教操作考试助教老师[类]
    /// </summary>
    [Serializable]
	public partial class v_继教操作考试助教老师 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 操作考试编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 助教老师编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 部门编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 部门名称 { get; set; }
        
          
        #endregion
	}
}