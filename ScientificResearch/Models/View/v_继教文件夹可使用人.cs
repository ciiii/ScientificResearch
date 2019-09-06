using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教文件夹可使用人[类]
    /// </summary>
    [Serializable]
	public partial class v_继教文件夹可使用人 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 文件夹编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 可使用人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 可使用人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 可使用人 { get; set; }
        
          
        #endregion
	}
}