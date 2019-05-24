using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学本院策略[类]
    /// </summary>
    [Serializable]
	public partial class v_教学本院策略 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学专业编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学专业名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学专业年份 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 专业基地管理员编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 教学本院科室数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 培训总时长 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否启用 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 建立日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}