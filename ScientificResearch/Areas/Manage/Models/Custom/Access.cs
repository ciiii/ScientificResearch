using ScientificResearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class Code
    {
        public string Value { get; set; }
    }
    public class LoginReturn<T>
    {
        public T 人员 { get; set; }
        //public CurrentUser 人员 { get; set; }
        public string access_token { get; set; }
        public string token_type { get; set; }
    }

    public class 人员OpenIdFilter
    {
        public string OpenId { get; set; }
    }

    /// <summary>
    /// 当前总库登录人的信息
    /// </summary>
    public class CurrentUserOfManage:CurrentUserBase
    {
        public string 工号 { get; set; }
    }
}
