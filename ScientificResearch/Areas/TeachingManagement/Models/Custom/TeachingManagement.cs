using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 教学学员培训情况Filter
    {
        public string 状态 { get; set; }
        public string Like学员类型名称 { get; set; }
        public string Like工号 { get; set; }
        public string Like姓名 { get; set; }
        public string 民族 { get; set; }
        public string Like医师资格证书编号 { get; set; }
    }

    public class 教学学员报到Filter
    {
        public bool? 是否已报到 { get; set; }
        public string Like学员类型名称 { get; set; }
        public string Like工号 { get; set; }
        public string Like姓名 { get; set; }
        public string Begin报到时间 { get; set; }
        public string End报到时间 { get; set; }
    }

    public class 教学学员宿舍楼安排Filter
    {
        public bool? 是否已安排宿舍 { get; set; }
    }
}
