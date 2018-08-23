using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 任职增改
    {
        public 任职 基本资料 { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; }
    }

    public class 人员Filter
    {
        public int? 部门编号 { get; set; }
        //public string Like姓名 { get; set; }
        public bool? 是否启用 { get; set; }
        //public string Like部门名称 { get; set; }
        /// <summary>
        /// 同时对姓名和部门名称做搜索
        /// </summary>
        public string LikeAllName { get; set; }
    }

    public class 任职Filter
    {
        public int? 编号 { get; set; }
        public int? 任职人员编号 { get; set; }
        public string Like姓名 { get; set; }
        public int? 部门编号 { get; set; }
        public DateTime? Begin任职开始时间 { get; set; }
        public DateTime? End任职开始时间 { get; set; }

        public string Like任职团体名称 { get; set; }
        public string Like所任职务 { get; set; }
    }

    [Serializable]
    public class 人员导入
    {
        [DisplayName("工号(不能重复)")]
        [Required]
        public string 工号 { get; set; }
        [DisplayName("密码")]
        [Required]
        public string 密码 { get; set; }
        [DisplayName("姓名")]
        [Required]
        public string 姓名 { get; set; }
        [DisplayName("部门名称")]
        [Required]
        public string 部门名称 { get; set; }
        [DisplayName("英文名")]
        public string 英文名 { get; set; }
        [DisplayName("性别")]
        public string 性别 { get; set; }
        [DisplayName("身份证")]
        public string 身份证 { get; set; }
        [DisplayName("出生日期")]
        public DateTime? 出生日期 { get; set; }
        [DisplayName("入职日期")]
        public DateTime? 入职日期 { get; set; }
        [DisplayName("手机")]
        public string 手机 { get; set; }
        [DisplayName("QQ")]
        public string QQ { get; set; }
        [DisplayName("邮箱")]
        public string 邮箱 { get; set; }
        [DisplayName("籍贯")]
        public string 籍贯 { get; set; }
        [DisplayName("毕业日期")]
        public DateTime? 毕业日期 { get; set; }
        [DisplayName("合同开始日期")]
        public DateTime? 合同开始日期 { get; set; }
        [DisplayName("合同结束日期")]
        public DateTime? 合同结束日期 { get; set; }
        [DisplayName("参加工作日期")]
        public DateTime? 参加工作日期 { get; set; }
        [DisplayName("专业技术获得日期")]
        public DateTime? 专业技术获得日期 { get; set; }
        [DisplayName("职务任职日期")]
        public DateTime? 职务任职日期 { get; set; }
        [DisplayName("学位")]
        public string 学位 { get; set; }
        [DisplayName("学历")]
        public string 学历 { get; set; }
        [DisplayName("政治面貌")]
        public string 政治面貌 { get; set; }
        [DisplayName("技术职称类别")]
        public string 技术职称类别 { get; set; }
        [DisplayName("技术职称")]
        public string 技术职称 { get; set; }
        [DisplayName("第二技术职称类别")]
        public string 第二技术职称类别 { get; set; }
        [DisplayName("第二技术职称")]
        public string 第二技术职称 { get; set; }
        [DisplayName("婚姻情况")]
        public string 婚姻情况 { get; set; }
        [DisplayName("学制")]
        public string 学制 { get; set; }
        [DisplayName("学历性质")]
        public string 学历性质 { get; set; }
        [DisplayName("学习形式")]
        public string 学习形式 { get; set; }
        [DisplayName("人员类别")]
        public string 人员类别 { get; set; }
        [DisplayName("个人身份")]
        public string 个人身份 { get; set; }
        [DisplayName("民族")]
        public string 民族 { get; set; }
        [DisplayName("专业技术级别")]
        public string 专业技术级别 { get; set; }
        [DisplayName("所学专业名称")]
        public string 所学专业名称 { get; set; }
        [DisplayName("岗位性质")]
        public string 岗位性质 { get; set; }
        [DisplayName("职务名称")]
        public string 职务名称 { get; set; }
        [DisplayName("职务级别")]
        public string 职务级别 { get; set; }
        [DisplayName("岗位名称")]
        public string 岗位名称 { get; set; }
        [DisplayName("岗位类型")]
        public string 岗位类型 { get; set; }
        [DisplayName("学科门类")]
        public string 学科门类 { get; set; }
        [DisplayName("一级学科")]
        public string 一级学科 { get; set; }
        [DisplayName("二级学科")]
        public string 二级学科 { get; set; }
        [DisplayName("三级学科")]
        public string 三级学科 { get; set; }
        [DisplayName("人员类型")]
        public string 人员类型 { get; set; }
        [DisplayName("获得最高学历的院校")]
        public string 获得最高学历的院校 { get; set; }
        [DisplayName("获得最高学位的院校")]
        public string 获得最高学位的院校 { get; set; }
        [DisplayName("住宅地址")]
        public string 住宅地址 { get; set; }
        [DisplayName("学术特长")]
        public string 学术特长 { get; set; }
        [DisplayName("研究方向")]
        public string 研究方向 { get; set; }
        [DisplayName("个人获得的荣誉和奖项")]
        public string 个人获得的荣誉和奖项 { get; set; }
        [DisplayName("备注")]
        public string 备注 { get; set; }
    }
}
