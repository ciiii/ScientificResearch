using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学活动[类]
    /// </summary>
    [Serializable]
	public partial class v_教学活动 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 活动主题 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 活动开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 活动结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 活动地点 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学活动类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学活动类型名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 主讲人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 主讲人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 主讲人部门编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 主讲人部门名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 主讲人职称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 活动内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学病例 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 病人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 病人姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 病人性别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 病人出生日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 病人住院号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 病人住院床号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 病人主要诊断 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 病人次要诊断 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 病人入院日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 病人出院日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 附件 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 建立人 { get; set; }
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
        public int? 反馈数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 评价次数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 所有项目满分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 所有项目总得分 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 得分星数 { get; set; }
        
          
        #endregion
	}
}