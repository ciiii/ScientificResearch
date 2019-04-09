using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class 教学人员Filter
    {
        /// <summary>
        /// 
        /// </summary>
        public int? NotEqual编号 { get; set; } = 2;

        /// <summary>
        /// 
        /// </summary>
        public int? 部门编号 { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public bool? 是否启用 { get; set; }

        /// <summary>
        /// 同时对姓名和部门名称做搜索
        /// </summary>
        public string LikeAllName { get; set; }
    }
}