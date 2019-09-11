using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教慕课[类]
    /// </summary>
    [Serializable]
	public partial class v_继教慕课 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 活动编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 排序值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 地点 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 慕课素材编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 慕课素材名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 慕课素材路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否允许下载 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 通过时长 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 参与人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 通过人数 { get; set; }
        
          
        #endregion
	}
}