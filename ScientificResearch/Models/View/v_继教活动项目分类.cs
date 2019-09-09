using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教活动项目分类[类]
    /// </summary>
    [Serializable]
	public partial class v_继教活动项目分类 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 父编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 未发布活动数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 未开始活动数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 进行中活动数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 已结束活动数量 { get; set; }
        
          
        #endregion
	}
}