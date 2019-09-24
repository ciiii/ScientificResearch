using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教试卷[类]
    /// </summary>
    [Serializable]
	public partial class v_继教试卷 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 文件夹编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 描述 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 被引用次数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 最高得分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 最低得分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 答卷次数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 总得分 { get; set; }
        
          
        #endregion
	}
}