using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class v_教学活动Filter
    {
        public int? 教学活动类型编号 { get; set; }
        public string Like活动主题 { get; set; }
        public string Like主讲人姓名 { get; set; }
        public DateTime? Begin活动开始时间 { get; set; }
        public DateTime? End活动开始时间 { get; set; }

    }

    public class v_教学活动可参与者Filter
    {
        public int? 教学活动编号 { get; set; }
    }

    public class v_教学活动反馈Filter
    {
        public int? 教学活动编号 { get; set; }
        public int? 学员编号 { get; set; }
    }

    public class v_tfn_教学活动评价Filter
    {
        public bool? 是否启用 { get; set; }
        public string Like评价项目名称 { get; set; }
    }
}
