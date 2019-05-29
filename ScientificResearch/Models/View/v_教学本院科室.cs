using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学本院科室[类]
    /// </summary>
    [Serializable]
	public partial class v_教学本院科室 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学本院策略编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学本院策略名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 排序值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学专业科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学专业科室名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 本院科室编号 { get; set; }
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
        public int? 最大学员人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 带教老师数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool 是否必选 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 培训时长 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 最低管床数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 最低全程管理数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 技能病例数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 疾病病例数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 门诊病例数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 住院病例数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 医技病例数 { get; set; }
        
          
        #endregion
	}
}