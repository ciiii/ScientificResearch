using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    /// <summary>
    /// 和科研办公功能对应
    /// </summary>
    public class OfficeController : TeachingManagementBaseController
    {

        /// <summary>
        /// 修改密码,这个应该放到一个独立的area去;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task ChangePassword([FromBody]ChangePassword model) =>
            await Db.ExecuteSpAsync(new sp_人员_修改密码()
            {
                工号 = CurrentUser.工号,
                旧密码 = model.旧密码,
                新密码 = model.新密码
            });


    }
}