using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 人员OpenId[类]
    /// </summary>
    [Serializable]
	public partial class 人员OpenId 
	{       
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[编号]")]
		public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[OpenId]")]
        [MaxLength(100,ErrorMessage ="OpenId不能超过[50]字")]
		public string OpenId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[DbKey]")]
        [MaxLength(100,ErrorMessage ="DbKey不能超过[50]字")]
		public string DbKey { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[人员编号]")]
		public int 人员编号 { get; set; }
        
        
        #endregion
	}
}