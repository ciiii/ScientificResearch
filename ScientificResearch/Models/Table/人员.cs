using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 人员[类]
    /// </summary>
    [Serializable]
	public partial class 人员 
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
        [Required(ErrorMessage ="请提供[工号]")]
        [MaxLength(50,ErrorMessage ="工号不能超过[25]字")]
		public string 工号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[密码]")]
        [MaxLength(50,ErrorMessage ="密码不能超过[25]字")]
		public string 密码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[姓名]")]
        [MaxLength(50,ErrorMessage ="姓名不能超过[25]字")]
		public string 姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[部门编号]")]
		public int 部门编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="英文名不能超过[25]字")]
		public string 英文名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="性别不能超过[25]字")]
		public string 性别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="身份证不能超过[25]字")]
		public string 身份证 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 出生日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 入职日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="手机不能超过[25]字")]
		public string 手机 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="QQ不能超过[25]字")]
		public string QQ { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="邮箱不能超过[25]字")]
		public string 邮箱 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="籍贯不能超过[25]字")]
		public string 籍贯 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 毕业日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 合同开始日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 合同结束日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 参加工作日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 专业技术获得日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 职务任职日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="学位不能超过[25]字")]
		public string 学位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="学历不能超过[25]字")]
		public string 学历 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="政治面貌不能超过[25]字")]
		public string 政治面貌 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="技术职称类别不能超过[50]字")]
		public string 技术职称类别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="技术职称不能超过[50]字")]
		public string 技术职称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="第二技术职称类别不能超过[50]字")]
		public string 第二技术职称类别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="第二技术职称不能超过[50]字")]
		public string 第二技术职称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="婚姻情况不能超过[25]字")]
		public string 婚姻情况 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="学制不能超过[25]字")]
		public string 学制 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="学历性质不能超过[25]字")]
		public string 学历性质 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="学习形式不能超过[25]字")]
		public string 学习形式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="人员类别不能超过[25]字")]
		public string 人员类别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="个人身份不能超过[25]字")]
		public string 个人身份 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="民族不能超过[25]字")]
		public string 民族 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="专业技术级别不能超过[25]字")]
		public string 专业技术级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="所学专业名称不能超过[25]字")]
		public string 所学专业名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="岗位性质不能超过[25]字")]
		public string 岗位性质 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="职务名称不能超过[25]字")]
		public string 职务名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="职务级别不能超过[25]字")]
		public string 职务级别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="岗位名称不能超过[25]字")]
		public string 岗位名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="岗位类型不能超过[25]字")]
		public string 岗位类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="学科门类不能超过[25]字")]
		public string 学科门类 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="一级学科不能超过[25]字")]
		public string 一级学科 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="二级学科不能超过[25]字")]
		public string 二级学科 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="三级学科不能超过[25]字")]
		public string 三级学科 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="人员类型不能超过[25]字")]
		public string 人员类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="获得最高学历的院校不能超过[50]字")]
		public string 获得最高学历的院校 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="获得最高学位的院校不能超过[50]字")]
		public string 获得最高学位的院校 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="住宅地址不能超过[50]字")]
		public string 住宅地址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="学术特长不能超过[500]字")]
		public string 学术特长 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="研究方向不能超过[500]字")]
		public string 研究方向 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(1000,ErrorMessage ="个人获得的荣誉和奖项不能超过[500]字")]
		public string 个人获得的荣誉和奖项 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[是否启用]")]
		public bool 是否启用 { get; set; }
        
        
        #endregion
	}
}