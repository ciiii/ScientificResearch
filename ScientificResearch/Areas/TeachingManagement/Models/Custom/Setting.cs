using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 教学专业Filter
    {
        public int? 年份 { get; set; }
    }
    public class 教学专业科室Filter
    {
        [Required(ErrorMessage = "请输入教学专业编号")]
        public int? 教学专业编号 { get; set; }
        public string Like科室名称 { get; set; }
    }

    public class 教学专业科室要求Filter
    {
        [Required(ErrorMessage = "请输入教学专业科室编号")]
        public int 教学专业科室编号 { get; set; }
        public string Like项目名称 { get; set; }
    }

    public class 教学专业科室任务Filter
    {
        [Required(ErrorMessage = "请输入教学专业科室编号")]
        public int 教学专业科室编号 { get; set; }
        public string Like项目名称 { get; set; }
    }

    public class 教学本院策略Filter
    {
        public int? 教学专业编号 { get; set; }
        public string Like名称 { get; set; }
        public bool? 是否启用 { get; set; }
    }

    public class 教学本院科室Filter
    {
        [Required(ErrorMessage = "请提供教学本院策略编号")]
        public int? 教学本院策略编号 { get; set; }
    }

    public class 教学本院科室任务Filter
    {
        [Required(ErrorMessage = "请输入教学本院科室编号")]
        public int? 教学本院科室编号 { get; set; }
        public string Like项目名称 { get; set; }
    }

    public class 教学轮转任务Filter
    {
        public int 教学轮转编号 { get; set; }
        public int? 任务类型编号 { get; set; }
        public bool? 是否门诊 { get; set; }
        public bool? 是否病房 { get; set; }
        public bool? 是否医技 { get; set; }

    }

    public class 教学活动评价项目Filter
    {
        [Required(ErrorMessage = "请输入教学活动类型编号")]
        public int? 教学活动类型编号 { get; set; }
        public bool? 是否启用 { get; set; }
    }

    public class 教学360评价分类Filter
    {
        [Required(ErrorMessage = "请输入目标类型")]
        public int? 目标类型 { get; set; }
    }

    public class v_教学360评价方向Filter
    {
        public int? 来源类型 { get; set; }
        public int? 目标类型 { get; set; }
    }
    public class 教学360评价项目Filter
    {
        public string WhereIn教学360评价分类编号 { get; set; }
        //[Required(ErrorMessage = "教学360评价分类编号")]
        public int? 教学360评价分类编号 { get; set; }
        public bool? 是否启用 { get; set; } = true;
    }

    public class 教学病人Filter
    {
        public string Like姓名 { get; set; }
        public string Like住院号 { get; set; }
        public string Like住院床号 { get; set; }
    }
}
