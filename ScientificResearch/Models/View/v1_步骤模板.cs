using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v1_步骤模板[类]
    /// </summary>
    [Serializable]
	public partial class v1_步骤模板 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 流程模板编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 步骤类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 上级编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 可操作人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 可用操作 { get; set; }
        
          
        #endregion
	}
}