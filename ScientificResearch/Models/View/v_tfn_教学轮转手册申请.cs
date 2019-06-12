using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_教学轮转手册申请[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_教学轮转手册申请 
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
        public int 教学轮转手册类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 教学轮转手册类型名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 操作时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 病人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 概要 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 内容 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 附件 { get; set; }
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
        public int? FlowId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? FlowTemplateId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string FlowTemplateName { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string FlowTemplateComponentName { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? SourceId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? State { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string StateName { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string CreatorType { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? CreatorId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string CreatorInfo { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? CreateDateTime { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string Remark { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? LastStepId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? LastStepTemplateId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string LastStepTemplateName { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string LastViewStepComponentName { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string LastEditStepComponentName { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string LastStepTemplateStyle { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? LastStepState { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string LastStepStateName { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string LastStepOperatorType { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? LastStepOperatorId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string LastStepOpeartorInfo { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? LastStepOperatorDatetime { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? IsCanOperate { get; set; }
        
          
        #endregion
	}
}