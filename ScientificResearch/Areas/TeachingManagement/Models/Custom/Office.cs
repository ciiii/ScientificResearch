using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 这个可以考虑放到predifined里面去;
    /// 还没用到...
    /// </summary>
    public class PersonInfoByType
    {
        public string PersonType { get; set; }
        public int PersonId { get; set; }
    }

    public class 教学通知公告Filter
    {
        public string 通知类型 { get; set; }
        public string Like通知名称 { get; set; }
        //public string Like通知内容 { get; set; }
        public string Like发送人姓名 { get; set; }
    }

    public class 教学某人员可查看的通知公告Filter
    {
        public bool? 是否已接收 { get; set; }
        public bool? 是否必读 { get; set; }
        public bool? 是否启用 { get; set; } = true;
        public string 通知类型 { get; set; }
        //public string Like通知名称 { get; set; }
        public string Like通知内容 { get; set; }
        public string Like发送人姓名 { get; set; }
    }

    public class 教学通知公告接收条件Filter
    {
        public int? 教学通知公告编号 { get; set; }
    }
}
