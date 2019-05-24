using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class 教学科室Filter
    {
        public string Like名称 { get; set; }
        public bool? 是否启用 { get; set; }
        public int? 上级部门编号 { get; set; }
    }

    /// <summary>
    /// 
    /// </summary>
    public class 教学带教老师Filter
    {
        public int 教学科室编号 { get; set; }
    }

    public class 教学学员Filter
    {
        public string WhereIn编号 { get; set; }
        public string Like学员类型名称 { get; set; }
        public string Like工号 { get; set; }
        public string Like姓名 { get; set; }
        public string 民族 { get; set; }
        public string Like医师资格证书编号 { get; set; }
    }

    public class 学员导入
    {
        #region 属性

        [DisplayName("学员类型编号")]
        public int? 学员类型编号 { get; set; }

        [DisplayName("学员类型")]
        public string 学员类型名称 { get; set; }

        [DisplayName("工号(不能重复)")]
        public string 工号 { get; set; }

        [DisplayName("密码")]
        public string 密码 { get; set; }

        [DisplayName("姓名")]
        public string 姓名 { get; set; }

        [DisplayName("性别")]
        public string 性别 { get; set; }

        [DisplayName("民族")]
        public string 民族 { get; set; }

        [DisplayName("出生日期")]
        public DateTime? 出生日期 { get; set; }

        [DisplayName("手机号码")]
        public string 手机号码 { get; set; }

        [DisplayName("政治面貌")]
        public string 政治面貌 { get; set; }

        [DisplayName("电子邮箱")]
        public string 电子邮箱 { get; set; }

        [DisplayName("QQ号码")]
        public string QQ号码 { get; set; }

        [DisplayName("微信号")]
        public string 微信号 { get; set; }

        [DisplayName("家庭住址")]
        public string 家庭住址 { get; set; }
        [DisplayName("取得执业证书日期")]
        public DateTime? 取得执业证书日期 { get; set; }

        [DisplayName("执业证书编号")]
        public string 执业证书编号 { get; set; }

        [DisplayName("取得医师资格证书日期")]
        public DateTime? 取得医师资格证书日期 { get; set; }

        [DisplayName("医师资格证书编号")]
        public string 医师资格证书编号 { get; set; }

        [DisplayName("最高学历")]
        public string 最高学历 { get; set; }

        [DisplayName("毕业年份")]
        public int? 毕业年份 { get; set; }

        [DisplayName("毕业学校")]
        public string 毕业学校 { get; set; }

        [DisplayName("毕业专业")]
        public string 毕业专业 { get; set; }

        [DisplayName("毕业证编码")]
        public string 毕业证编码 { get; set; }

        [DisplayName("学位证编码")]
        public string 学位证编码 { get; set; }

        [DisplayName("学员培训年界")]
        public int 学员培训年界 { get; set; }

        [DisplayName("学员培训年限")]
        public int 学员培训年限 { get; set; }

        [DisplayName("往届应届")]
        public string 往届应届 { get; set; }

        [DisplayName("专业编号")]
        public int 专业编号 { get; set; }

        [DisplayName("送培方式")]
        public string 送培方式 { get; set; }

        [DisplayName("工作单位")]
        public string 工作单位 { get; set; }

        [DisplayName("医疗卫生机构")]
        public string 医疗卫生机构 { get; set; }

        [DisplayName("备注")]
        public string 备注 { get; set; }

        #endregion
    }
}
