using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 教学专业Filter
    {
        public int? 教学专业编号 { get; set; }
        public string Like科室名称 { get; set; }
    }

    public class 教学专业科室要求Filter
    {
        public int 教学专业科室编号 { get; set; }
        public string Like项目名称 { get; set; }
    }

    public class 教学专业科室任务Filter
    {
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
        public int? 教学本院策略编号 { get; set; }
    }

    public class 教学本院科室任务Filter
    {
        public int? 教学本院科室编号 { get; set; }
    }

    public class 教学活动评价项目Filter
    {
        public int? 教学活动类型编号 { get; set; }
        public bool? 是否启用 { get; set; }
    }

    public class 教学360评价分类Filter
    {
        public int? 目标类型 { get; set; }
    }

    public class 教学360评价项目Filter
    {
        public int? 教学360评价分类编号 { get; set; }
    }

}
