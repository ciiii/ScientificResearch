using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_教学结业申请[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_教学结业申请 
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
        public string 说明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 申请结业日期 { get; set; }
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