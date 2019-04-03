using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 论文成果统计Filter
    {
        public DateTime? Begin论文正式出版日期 { get; set; }
        public DateTime? End论文正式出版日期 { get; set; }
    }

    public class 获奖成果统计Filter
    {
        public int? 年度 { get; set; }
    }

    public class 著作成果统计Filter
    {
        public int? 年度 { get; set; }
    }

    public class 专利成果统计Filter
    {
        public int? 年度 { get; set; }
    }

    /// <summary>
    /// 比如"年度"这个条件
    /// </summary>
    public class 所有成果统计Filter
    {
        public int? 年度 { get; set; }
    }
}
