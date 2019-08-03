using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagementOfStudent.Controllers
{
    /// <summary>
    /// 2019-8-3
    /// 教学学员端的
    /// </summary>
    [Route("TeachingManagementOfStudent/[controller]/[action]")]
    [ApiExplorerSettings(GroupName = "TeachingManagementOfStudent")]
    [Authorize(Roles = "TeachingManagementStudent,TeachingManagementStudentFromManage")]
    public class TeachingManagementOfStudentBaseController : BaseController<CurrentStudentOfTeachingManagement> { }
}