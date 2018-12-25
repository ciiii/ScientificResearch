using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v4_横向项目经费统计[类]
    /// </summary>
    [Serializable]
	public partial class v4_横向项目经费统计 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public string 项目负责人部门名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 未到经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 待审核到账 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 已审核到账 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 待审核报销 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 已审核报销 { get; set; }
        
          
        #endregion
	}
}