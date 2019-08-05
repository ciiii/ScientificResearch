using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyLib;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagementOfStudent.Controllers
{
    /// <summary>
    /// 培训相关的接口
    /// </summary>
    public class TeachingManagementController : TeachingManagementOfStudentBaseController
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取我的教学管床病人(Paging paging, v_tfn_教学管床病人Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_tfn_教学管床病人, v_tfn_教学管床病人Filter>(
                paging,
                filter,
                $"tfn_教学管床病人('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        /// <summary>
        /// 注意轮转编号一定不能填错了
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改教学管床病人([FromBody]教学管床病人 model)
        {
            await Db.Merge(model);
        }

        /// <summary>
        /// 增改教学管床病人时用
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取病人(Paging paging, 教学病人Filter filter) =>
            await Db.GetPagingListSpAsync<教学病人, 教学病人Filter>(paging, filter);

        /// <summary>
        /// 增改教学管床病人时用
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改病人([FromBody]教学病人 data)
        {
            return await Db.Merge(data);
        }

    }
}