using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教活动[类]
    /// </summary>
    [Serializable]
	public partial class v_继教活动 
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
        public int 培训计划编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 培训计划名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 培训计划年份 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 项目分类编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 项目分类名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 学分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 封面 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 简介 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 必须按顺序学习 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 建立人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 建立人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 状态 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 应学人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 完成人数 { get; set; }
        
          
        #endregion
	}
}