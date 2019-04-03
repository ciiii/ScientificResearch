using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// StepAssignedPerson[步骤指定人   这个已经是流程业务里面的数据了   不是流程模板,步骤模板里面的预定义类]
    /// </summary>
    [Serializable]
	public partial class StepAssignedPerson 
	{       
        #region 属性
        /// <summary>
		/// 自增编号
		/// </summary>
        [DisplayName("自增编号")]
        [Required(ErrorMessage ="请提供[Id]")]
		public int Id { get; set; }
        /// <summary>
		/// 步骤编号
		/// </summary>
        [DisplayName("步骤编号")]
        [Required(ErrorMessage ="请提供[StepId]")]
		public int StepId { get; set; }
        /// <summary>
		/// 指定人类型
		/// </summary>
        [DisplayName("指定人类型")]
        [MaxLength(50,ErrorMessage ="StepAssignedPersonType不能超过[25]字")]
		public string StepAssignedPersonType { get; set; }
        /// <summary>
		/// 指定人编号
		/// </summary>
        [DisplayName("指定人编号")]
        [Required(ErrorMessage ="请提供[StepAssignedPersonId]")]
		public int StepAssignedPersonId { get; set; }
        
        
        #endregion
	}
}