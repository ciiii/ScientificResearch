﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyLib;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;
using Microsoft.AspNetCore.Authorization;

namespace ScientificResearch.Areas.Manage.Controllers
{
    [Route("Manage/[controller]/[action]")]
    [ApiExplorerSettings(GroupName = "Manage")]
    [Authorize(Roles = "ManageAdmin")]
    public class ManageBaseController : BaseController<CurrentUserOfManage>
    {
        //new protected CurrentUserOfManage CurrentUser
        //{
        //    get
        //    {
        //        var currentUser = new CurrentUserOfManage();

        //        currentUser.SetValueByPropertyName(
        //            nameof(currentUser.工号),
        //            User.Claims.Where(i => i.Type == nameof(currentUser.工号)).SingleOrDefault().Value
        //        );
                
        //        currentUser.SetValueByPropertyName(
        //            nameof(currentUser.DbKey),
        //            User.Claims.Where(i => i.Type == nameof(currentUser.DbKey)).SingleOrDefault().Value
        //        );

        //        return currentUser;
        //    }
        //}
    }
}