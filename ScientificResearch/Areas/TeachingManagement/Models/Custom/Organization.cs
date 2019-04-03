using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class V教学科室Filter
    {
        public string Like名称 { get; set; }
        public bool? 是否启用 { get; set; }
        public int? 上级部门编号 { get; set; }
    }

    /// <summary>
    /// 
    /// </summary>
    public class V教学带教老师Filter
    {
        public int 教学科室编号 { get; set; }
    }
}
