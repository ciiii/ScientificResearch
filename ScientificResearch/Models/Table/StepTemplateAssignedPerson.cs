using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// StepTemplateAssignedPerson[类]
    /// </summary>
    [Serializable]
	public partial class StepTemplateAssignedPerson 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[Id]")]
		public int Id { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[StepTemplateId]")]
		public int StepTemplateId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="StepAssignedPersonType不能超过[25]字")]
		public string StepAssignedPersonType { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[StepAssignedPersonId]")]
		public int StepAssignedPersonId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="Remark不能超过[250]字")]
		public string Remark { get; set; }
        
        
        #endregion
	}
}