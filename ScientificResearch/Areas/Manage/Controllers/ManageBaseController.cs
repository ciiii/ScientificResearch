using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Infrastucture;

namespace ScientificResearch.Areas.Manage.Controllers
{
    [Route("Manage/[controller]/[action]")]
    [ApiExplorerSettings(GroupName = "Manage")]
    public class ManageBaseController : BaseController
    {
    }
}