using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教助教老师[类]
    /// </summary>
    [Serializable]
	public partial class v_继教助教老师 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 科室编号 { get; set; }
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
        public string 英文名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 性别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 手机 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否启用 { get; set; }
        
          
        #endregion
	}
}