using ScientificResearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class LoginReturn
    {
        public CurrentUser 人员 { get; set; }
        public string access_token { get; set; }
        public string token_type { get; set; }
    }

    public class 人员OpenIdFilter
    {
        public string OpenId { get; set; }
    }
}
