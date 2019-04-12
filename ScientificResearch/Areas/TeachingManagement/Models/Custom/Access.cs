using ScientificResearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 当前教学管理的医院方登录人的信息
    /// </summary>
    public class CurrentUserOfTeachingManagement : CurrentUserBase
    {
        public int 编号 { get; set; }
        public string 工号 { get; set; }
        public string 姓名 { get; set; }
        public int 部门编号 { get; set; }
        public string 部门名称 { get; set; }

        public string 人员类型 { get; set; } = nameof(人员);
    }
}
