using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_教学管床病人[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_教学管床病人 
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
        public int 病人编号 { get; set; }
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
        public bool 是否全程陪护 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}