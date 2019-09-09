using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教培训计划[类]
    /// </summary>
    [Serializable]
	public partial class v_继教培训计划 
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
        public int 年份 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 所属部门编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 所属部门名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 简介 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 附件 { get; set; }
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