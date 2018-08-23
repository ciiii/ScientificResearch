using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 成果获奖[相关项目,相关论文,都用关联来示   论文获奖先不管   完成单位数量默认1,前台在1的时候加上备注(独立申报)   303   类]
    /// </summary>
    [Serializable]
	public partial class 成果获奖 
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
        [Required(ErrorMessage ="请提供[获奖名称]")]
        [MaxLength(200,ErrorMessage ="获奖名称不能超过[100]字")]
		public string 获奖名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[获奖级别]")]
        [MaxLength(50,ErrorMessage ="获奖级别不能超过[25]字")]
		public string 获奖级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[获奖日期]")]
		public DateTime? 获奖日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[获奖类别]")]
        [MaxLength(50,ErrorMessage ="获奖类别不能超过[25]字")]
		public string 获奖类别 { get; set; }
        /// <summary>
		/// 联系人
		/// </summary>
        [DisplayName("联系人")]
        [MaxLength(50,ErrorMessage ="获奖等级不能超过[25]字")]
		public string 获奖等级 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="奖励情况不能超过[25]字")]
		public string 奖励情况 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="联系人不能超过[25]字")]
		public string 联系人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="联系人手机不能超过[25]字")]
		public string 联系人手机 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 项目开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 项目结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 应用开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 应用结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 年度 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 批文时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="颁奖单位不能超过[25]字")]
		public string 颁奖单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 完成人数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="获奖证书编号不能超过[25]字")]
		public string 获奖证书编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 完成单位数量 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="获奖摘要不能超过[250]字")]
		public string 获奖摘要 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 相关文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 获奖单位文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 获奖批文 { get; set; }
        
        
        #endregion
	}
}