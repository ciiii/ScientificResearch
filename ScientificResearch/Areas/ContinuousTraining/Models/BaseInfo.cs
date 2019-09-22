using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 继教培训计划Filter
    {
        public int? 年份 { get; set; }
        public string Like名称 { get; set; }
    }

    public class 继教活动项目分类Filter
    {
        public string WhereIn编号 { get; set; }
    }

    public class 继教标签Filter
    {
        public string Like名称 { get; set; }
    }
}
