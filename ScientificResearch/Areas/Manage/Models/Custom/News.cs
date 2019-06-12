using ScientificResearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 总库新闻Filter
    {
        /// <summary>
        /// 目前写死:前沿,视听,公告 这三种
        /// </summary>
        public string 分类 { get; set; }
        public string Like标题 { get; set; }
    }
}
