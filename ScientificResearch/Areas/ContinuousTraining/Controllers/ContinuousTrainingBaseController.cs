﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.ContinuousTraining.Controllers
{
    /// <summary>
    /// 2019-1-9
    /// 为所有教学管理的控制器加一个分组,加一个路由的area前缀;
    /// 应该用area区分不同的服务;方便以后用微服务分开;
    /// 但是目前models还无法分开;
    /// </summary>
    [Route("ContinuousTraining/[controller]/[action]")]
    [ApiExplorerSettings(GroupName = "ContinuousTraining")]
    [Authorize(Roles = "ScientificResearchUser,UserFromManage,TeachingManagementStudent,TeachingManagementStudentFromManage")]
    public class ContinuousTrainingBaseController : BaseController<CurrentUser> { }
}