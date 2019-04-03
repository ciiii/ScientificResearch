using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// V教学带教老师[类]
    /// </summary>
    [Serializable]
	public partial class V教学带教老师 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 教学科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 带教老师编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
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