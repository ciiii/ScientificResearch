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

    public class 教学360评价项目Filter
    {
        [Required(ErrorMessage = "教学360评价分类编号")]
        public int? 教学360评价分类编号 { get; set; }
        public bool? 是否启用 { get; set; }
    }

}
