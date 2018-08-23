using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 横向项目变更[360   类]
    /// </summary>
    [Serializable]
	public partial class 横向项目变更 
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
        [MaxLength(1000,ErrorMessage ="变更内容简介不能超过[500]字")]
		public string 变更内容简介 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="变更事由不能超过[500]字")]
		public string 变更事由 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="变更备注不能超过[500]字")]
		public string 变更备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[变更时间]")]
		public DateTime? 变更时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[横向项目编号]")]
		public int 横向项目编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目分类不能超过[25]字")]
		public string 项目分类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="项目类型不能超过[25]字")]
		public string 项目类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[合同编号]")]
        [MaxLength(50,ErrorMessage ="合同编号不能超过[25]字")]
		public string 合同编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[合同名称]")]
        [MaxLength(100,ErrorMessage ="合同名称不能超过[50]字")]
		public string 合同名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否为第一承建单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[项目负责人编号]")]
		public int 项目负责人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="项目归属部门不能超过[250]字")]
		public string 项目归属部门 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="单位名称不能超过[50]字")]
		public string 单位名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="邮政编码不能超过[25]字")]
		public string 邮政编码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="法定代表人不能超过[25]字")]
		public string 法定代表人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="经费本编号不能超过[25]字")]
		public string 经费本编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="联系人不能超过[25]字")]
		public string 联系人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="联系人电话不能超过[25]字")]
		public string 联系人电话 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(200,ErrorMessage ="通讯地址不能超过[100]字")]
		public string 通讯地址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否需要伦理评审 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="档案编号不能超过[25]字")]
		public string 档案编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="财务简称不能超过[25]字")]
		public string 财务简称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="课题来源不能超过[25]字")]
		public string 课题来源 { get; set; }
        /// <summary>
		/// 院内or院外
		/// </summary>
        [DisplayName("院内or院外")]
        [MaxLength(50,ErrorMessage ="合作方关系不能超过[25]字")]
		public string 合作方关系 { get; set; }
        /// <summary>
		/// 甲乙方
		/// </summary>
        [DisplayName("甲乙方")]
        [MaxLength(50,ErrorMessage ="合作方契约关系不能超过[25]字")]
		public string 合作方契约关系 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(200,ErrorMessage ="合作方单位名称不能超过[100]字")]
		public string 合作方单位名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方法人或组织机构代码不能超过[25]字")]
		public string 合作方法人或组织机构代码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方法定代表人不能超过[25]字")]
		public string 合作方法定代表人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方单位联系人不能超过[25]字")]
		public string 合作方单位联系人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方联系电话不能超过[25]字")]
		public string 合作方联系电话 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方邮箱不能超过[25]字")]
		public string 合作方邮箱 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方邮政编码不能超过[25]字")]
		public string 合作方邮政编码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方所在省不能超过[25]字")]
		public string 合作方所在省 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方所在市不能超过[25]字")]
		public string 合作方所在市 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方所在地区不能超过[25]字")]
		public string 合作方所在地区 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[合同金额]")]
		public decimal 合同金额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[签订时间]")]
		public DateTime? 签订时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[付款方式]")]
        [MaxLength(50,ErrorMessage ="付款方式不能超过[25]字")]
		public string 付款方式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[合同开始时间]")]
		public DateTime? 合同开始时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[合同结束时间]")]
		public DateTime? 合同结束时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[合作方式]")]
        [MaxLength(50,ErrorMessage ="合作方式不能超过[25]字")]
		public string 合作方式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[研究类型]")]
        [MaxLength(50,ErrorMessage ="研究类型不能超过[25]字")]
		public string 研究类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="技术领域不能超过[25]字")]
		public string 技术领域 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合同类型不能超过[25]字")]
		public string 合同类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="技术合同类型不能超过[25]字")]
		public string 技术合同类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否申请技术合同认定 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public decimal? 合同技术交易额 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="知识产权不能超过[25]字")]
		public string 知识产权 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="计划来源不能超过[25]字")]
		public string 计划来源 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方所属国民经济行业不能超过[25]字")]
		public string 合作方所属国民经济行业 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="技术服务的国民经济行业不能超过[25]字")]
		public string 技术服务的国民经济行业 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合同的社会经济目标不能超过[25]字")]
		public string 合同的社会经济目标 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="合作方性质不能超过[25]字")]
		public string 合作方性质 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否高新性质 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public string 合同认定登记承诺书路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[合同文件路径]")]
		public string 合同文件路径 { get; set; }
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