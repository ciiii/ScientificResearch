using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学学员[类]
    /// </summary>
    [Serializable]
	public partial class v_教学学员 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
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
        public string 密码 { get; set; }
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
        public string 民族 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 证件类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 证件号码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 出生日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 手机号码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 政治面貌 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 电子邮箱 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string QQ号码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 微信号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 家庭住址 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 取得执业证书日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 执业证书编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 取得医师资格证书日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 医师资格证书编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 最高学历 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 毕业年份 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 毕业学校 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 毕业专业 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 毕业证编码 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 学位证编码 { get; set; }
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
        public string 工作单位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 医疗卫生机构 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}