using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Infrastucture;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    /// <summary>
    /// 2019-1-9
    /// 为所有教学管理的控制器加一个分组,加一个路由的area前缀;
    /// 应该用area区分不同的服务;方便以后用微服务分开;
    /// 但是目前models还无法分开;
    /// </summary>
    [Route("TeachingManagement/[controller]/[action]")]
    [ApiExplorerSettings(GroupName = "TeachingManagement")]
    public class TeachingManagementBaseController : BaseController
    {

    }
}