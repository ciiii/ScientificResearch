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
    public class CurrentStudentOfTeachingManagement : CurrentUserBase
    {
        public int 编号 { get; set; }
        public string 工号 { get; set; }
        public string 姓名 { get; set; }

        public string 人员类型 { get; set; } = nameof(教学学员);
    }

    public class 教学学员登录Filter
    {
        public string 工号 { get; set; }
        public string 密码 { get; set; }
    }
}
