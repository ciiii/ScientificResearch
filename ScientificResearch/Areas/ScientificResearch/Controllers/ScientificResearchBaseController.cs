using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyLib;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Controllers
{
    //[Route("ScientificResearch/[controller]/[action]")]
    //[ApiExplorerSettings(GroupName = "ScientificResearch")]
    [Authorize(Roles = "ScientificResearchUser,UserFromManage")]
    //[Authorize(Roles = "1234")]
    [Route("[controller]/[action]")]
    public class ScientificResearchBaseController : BaseController<CurrentUser>
    {
        /// <summary>
        /// MyWorkFlowBusiness的实例不采用注入
        /// </summary>
        protected Business.WorkFlowBusiness MyWorkFlowBusiness
        {
            get
            {
                return new Business.WorkFlowBusiness(DbConnectionString);
            }
        }
    }
}