using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class v_教学360评价Filter
    {
        /// <summary>
        /// 就是 评价人类型
        /// </summary>
        public int? 来源类型 { get; set; }
        public int? NotEqual来源类型 { get; set; }

        public int? 评价人编号 { get; set; }
        public string Like评价人姓名 { get; set; }

        /// <summary>
        /// 就是 被评价人类型
        /// </summary>
        public int? 目标类型 { get; set; }
        public int? NotEqual目标类型 { get; set; }

        public int? 被评价人编号 { get; set; }
        public string Like被评价人姓名 { get; set; }
    }

    public class v_tfn_教学360评价评分Filter
    {
        [Required]
        public int 教学360评价编号 { get; set; }

    }
}
