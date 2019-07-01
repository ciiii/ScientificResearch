using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学学员培训情况[类]
    /// </summary>
    [Serializable]
	public partial class v_教学学员培训情况 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 学员类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 学员类型名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 工号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 头像路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 性别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 学员培训年界 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 学员培训年限 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 往届应届 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 专业编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 专业名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 送培方式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 状态 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 报到时间 { get; set; }
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
        public DateTime? 计划开始培训日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 计划结束培训日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 实际开始培训日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 实际结束培训日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 退培日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 结业日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 证书 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 当前教学轮转编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 当前教学轮转本院科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 当前教学轮转本院科室名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 当前科室管理员编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 当前科室管理员姓名 { get; set; }
        
          
        #endregion
	}
}