using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学专业科室要求[类]
    /// </summary>
    [Serializable]
	public partial class v_教学专业科室要求 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学专业科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 说明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 最低评分要求 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 最低评分等级 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}