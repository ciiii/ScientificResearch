using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_继教某人可参与的活动内容[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_继教某人可参与的活动内容 
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
        public bool? 是否通过 { get; set; }
        
          
        #endregion
	}
}