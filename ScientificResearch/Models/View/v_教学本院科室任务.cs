using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学本院科室任务[类]
    /// </summary>
    [Serializable]
	public partial class v_教学本院科室任务 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学本院科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 任务类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 任务类型名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否门诊 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否病房 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否医技 { get; set; }
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
        public int 数量要求 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}