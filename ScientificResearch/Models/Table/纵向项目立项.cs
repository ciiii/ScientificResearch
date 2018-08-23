using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 纵向项目立项[分类: 1-科研项目 2-重点学科 3-人才培养      名称好像都可以重复,??   项目编号可以没有????      项目登记情况,不知道什么意思   这里的"项目分类"还没有基础数据支撑   这里的经办人也不知道什么意思   资助类别???   批准经费和配套经费应该根据预算来计算得出.放到view里面去   410类]
    /// </summary>
    [Serializable]
	public partial class 纵向项目立项 
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
        [Required(ErrorMessage ="请提供[分类]")]
		public int 分类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目登记情况不能超过[25]字")]
		public string 项目登记情况 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目编号不能超过[25]字")]
		public string 项目编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="项目中文名称不能超过[50]字")]
		public string 项目中文名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="项目英文名称不能超过[50]字")]
		public string 项目英文名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目分类不能超过[25]字")]
		public string 项目分类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="成果归属部门不能超过[250]字")]
		public string 成果归属部门 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 负责人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[立项年度]")]
		public int 立项年度 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[登记日期]")]
		public DateTime? 登记日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[登记人编号]")]
		public int 登记人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[批准日期]")]
		public DateTime? 批准日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 批准经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 配套经费 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="经费卡号不能超过[25]字")]
		public string 经费卡号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目等级不能超过[25]字")]
		public string 项目等级 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[计划开始日期]")]
		public DateTime? 计划开始日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[计划完成日期]")]
		public DateTime? 计划完成日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[学科门类]")]
        [MaxLength(50,ErrorMessage ="学科门类不能超过[25]字")]
		public string 学科门类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[学科类型]")]
        [MaxLength(50,ErrorMessage ="学科类型不能超过[25]字")]
		public string 学科类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[研究类型]")]
        [MaxLength(50,ErrorMessage ="研究类型不能超过[25]字")]
		public string 研究类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[项目类型]")]
        [MaxLength(50,ErrorMessage ="项目类型不能超过[25]字")]
		public string 项目类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[项目级别]")]
        [MaxLength(50,ErrorMessage ="项目级别不能超过[25]字")]
		public string 项目级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[项目来源单位]")]
        [MaxLength(50,ErrorMessage ="项目来源单位不能超过[25]字")]
		public string 项目来源单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目类别不能超过[25]字")]
		public string 项目类别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="档案编号不能超过[25]字")]
		public string 档案编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="财务简称不能超过[50]字")]
		public string 财务简称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="亚类说明不能超过[250]字")]
		public string 亚类说明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="附注说明不能超过[250]字")]
		public string 附注说明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="纵向项目合同类型不能超过[25]字")]
		public string 纵向项目合同类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="国民经济行业不能超过[25]字")]
		public string 国民经济行业 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作形式不能超过[25]字")]
		public string 合作形式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="社会经济目标不能超过[500]字")]
		public string 社会经济目标 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否需要伦理评审 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否需要伦理批文 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="伦理批文编号不能超过[25]字")]
		public string 伦理批文编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 伦理批文时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 伦理批文路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 立项文件路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 建立时间 { get; set; }
        
        
        #endregion
	}
}