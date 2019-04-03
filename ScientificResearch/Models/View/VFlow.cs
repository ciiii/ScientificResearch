using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// VFlow[类]
    /// </summary>
    [Serializable]
	public partial class VFlow 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int Id { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int FlowTemplateId { get; set; }
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
        public int SourceId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int State { get; set; }
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
        public int CreatorId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string CreatorInfo { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime CreateDateTime { get; set; }
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
        
          
        #endregion
	}
}