using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v1_经费模版支出内容[类]
    /// </summary>
    [Serializable]
	public partial class v1_经费模版支出内容 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 项目支出类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 所属经费模版编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目支出类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 经费占比 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 项目支出内容编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目支出内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 财务科目 { get; set; }
        
          
        #endregion
	}
}