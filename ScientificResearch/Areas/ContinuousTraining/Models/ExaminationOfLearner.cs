using ScientificResearch.Infrastucture;
using MyLib;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Qiniu.Util;
using Qiniu.IO.Model;

namespace ScientificResearch.Models
{
    public class 继教某人可参与的理论考试Filter: 继教某人可参与的活动Filter
    {
        //public string 口令 { get; set; }
    }

    public class 继教试卷中试题正确答案Filter
    {
        public int? 试卷编号 { get; set; }
    }

    public class 继教试卷中试题Filter
    {
        public int? 试卷编号 { get; set; }
    }

    public class 交卷
    {
        public int 考试批次编号 { get; set; }
        public DateTime 答题结束时间 { get; set; }
        public IEnumerable<交卷答题情况> 答题情况 { get; set; }

    }

    public class 交卷答题情况
    {
        public int 试题编号 { get; set; }
        public int 显示排序值 { get; set; }
        public DateTime? 答题时间 { get; set; }
        public int 分值 { get; set; }
        public IEnumerable<string> 答案编码 { get; set; }
    }

    public class 继教理论考试答题情况Filter
    {
        public int? 理论考试参与情况编号 { get; set; }
    }

    public class 继教理论考试答题答案Filter
    {
        public string WhereIn理论考试答题情况编号 { get; set; }
    }
    //public class 交卷答题答案
    //{
    //    public string 答题答案编码 { get; set; }
    //}
}
