using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 报销Filter
    {
        public int? 流程模板编号 { get; set; }
        public int? 项目编号 { get; set; }
        public string Like报销编号 { get; set; }
    }

    public class 报销详情Filter
    {
        public int 报销编号 { get; set; }
    }

    public class 报销增改
    {
        //TODO: 报销编号,是否自动生成的,如果是,那么规则是什么?
        public 报销 基本资料 { get; set; }
        public IEnumerable<报销详情> 报销详情列表 { get; set; }
        public bool IsHold { get; set; }
    }
}
