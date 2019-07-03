using ScientificResearch.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 总库新闻Filter
    {
        /// <summary>
        /// 目前写死:前沿,视听,公告 这三种
        /// </summary>
        public int? 新闻分类编号 { get; set; }
        public string Like标题 { get; set; }
        public string Like标签 { get; set; }

    }

    public class 总库标签Filter
    {
        [Required]
        public int? 新闻分类编号 { get; set; }
    }

    public class 新闻标签Filter
    {
        public int? 新闻编号 { get; set; }
    }
}
