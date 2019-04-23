using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 教学专业Filter
    {
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
        public string Like名称 { get; set; }
        public bool? 是否启用 { get; set; }
    }
}
