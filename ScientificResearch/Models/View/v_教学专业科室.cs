using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学专业科室[类]
    /// </summary>
    [Serializable]
	public partial class v_教学专业科室 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学专业编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 排序值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 科室名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 最低培训时长 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 最低管床数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 最低全程管理数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 科室要求 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学专业名称 { get; set; }
        
          
        #endregion
	}
}