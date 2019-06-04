using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_教学医疗差错及事故记录[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_教学医疗差错及事故记录 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 学员编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 学员姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学轮转编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 计划入科日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 计划出科日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 实际入科日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 实际出科日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学本院科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 教学本院策略编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学本院策略名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 教学专业科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学专业科室名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 本院科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 本院科室名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 科室管理员编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 科室管理员姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 带教老师编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 带教老师姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 状态 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 处理日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 处理类别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 处理原因 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 处理意见 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 附件 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}