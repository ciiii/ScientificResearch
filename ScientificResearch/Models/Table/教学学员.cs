using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学学员[类]
    /// </summary>
    [Serializable]
	public partial class 教学学员 
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
		public int? 来源学校编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 来源学生编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[学员类型编号]")]
		public int 学员类型编号 { get; set; }
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
        [MaxLength(100,ErrorMessage ="头像路径不能超过[50]字")]
		public string 头像路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[姓名]")]
        [MaxLength(50,ErrorMessage ="姓名不能超过[25]字")]
		public string 姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="性别不能超过[25]字")]
		public string 性别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="民族不能超过[25]字")]
		public string 民族 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="证件类型不能超过[25]字")]
		public string 证件类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="证件号码不能超过[25]字")]
		public string 证件号码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 出生日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="手机号码不能超过[25]字")]
		public string 手机号码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="政治面貌不能超过[25]字")]
		public string 政治面貌 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="电子邮箱不能超过[25]字")]
		public string 电子邮箱 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="QQ号码不能超过[25]字")]
		public string QQ号码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="微信号不能超过[25]字")]
		public string 微信号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="家庭住址不能超过[25]字")]
		public string 家庭住址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 取得执业证书日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="职业证书编号不能超过[25]字")]
		public string 职业证书编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime? 取得医师资格证书日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="医师资格证书编号不能超过[25]字")]
		public string 医师资格证书编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="最高学历不能超过[25]字")]
		public string 最高学历 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public int? 毕业年份 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="毕业学校不能超过[50]字")]
		public string 毕业学校 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="毕业专业不能超过[50]字")]
		public string 毕业专业 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="毕业证编码不能超过[50]字")]
		public string 毕业证编码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="学位证编码不能超过[50]字")]
		public string 学位证编码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[学员培训年界]")]
		public int 学员培训年界 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[学员培训年限]")]
		public int 学员培训年限 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public bool? 是否应届生 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[专业编号]")]
		public int 专业编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(50,ErrorMessage ="送培方式不能超过[25]字")]
		public string 送培方式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="工作单位不能超过[50]字")]
		public string 工作单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(100,ErrorMessage ="医疗卫生机构不能超过[50]字")]
		public string 医疗卫生机构 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage ="请提供[建立时间]")]
		public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [MaxLength(500,ErrorMessage ="备注不能超过[250]字")]
		public string 备注 { get; set; }
        
        
        #endregion
	}
}