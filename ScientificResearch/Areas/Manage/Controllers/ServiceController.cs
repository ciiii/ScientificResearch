using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;
using Dapper;
using MyLib;
using Microsoft.Extensions.Configuration;
using System.IO;
using Microsoft.AspNetCore.Authorization;

namespace ScientificResearch.Areas.Manage.Controllers
{
    /// <summary>
    /// 医院和服务的管理都在这里面
    /// </summary>
    public class ServiceController : ManageBaseController
    {
        /// <summary>
        /// 获取服务列表,包括了禁用的,管理时用
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取服务列表() => await Db.GetListSpAsync<服务>();

        /// <summary>
        /// 获取可用的服务列表,使用这些服务时用,仅仅包括启用的服务
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取可用的服务列表() => await Db.GetListSpAsync<V_服务_启用>();

        [HttpPost]
        async public Task<object> 增改服务([FromBody] 服务 model) => await Db.Merge(model);

        [HttpPost]
        async public Task 启用服务([FromBody] int 服务编号) => await Db.Enable<服务>(服务编号);

        [HttpPost]
        async public Task 禁用服务([FromBody] int 服务编号) => await Db.Disable<服务>(服务编号);

        /// <summary>
        /// 获取医院列表,包括了禁用的,管理时用
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取医院列表() => await Db.GetListSpAsync<医院>();

        /// <summary>
        /// 获取可用的医院列表,使用这些医院时用,仅仅包括启用的医院;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取可用的医院列表() => await Db.GetListSpAsync<V_医院_启用>();

        [HttpPost]
        async public Task<object> 增改医院([FromBody] 医院 model)
        {
            var result = await Db.Merge(model);
            if (model.编号 == 0)
            {
                await Db.ExecuteAsync(RestoreModelDb.GetSql(model.名称, Env));
                await RestoreModelDb.CopyLoginHtmlForScientificResearch(model.名称, model.代码, Env);
            }
            return result;
        }

        [HttpPost]
        async public Task 启用医院([FromBody] int 医院编号) => await Db.Enable<医院>(医院编号);

        [HttpPost]
        async public Task 禁用医院([FromBody] int 医院编号) => await Db.Disable<医院>(医院编号);

        /// <summary>
        /// 获取哪些医院订购了哪些服务的信息,
        /// 目前使用的场景是:获取某医院的服务信息,
        /// 注意:没有订购的服务不会出现,但是已订购却因为医院被禁用或者服务被禁用的情况,该医院服务是禁用的
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取医院服务(医院服务Filter filter) => await Db.GetListSpAsync<V_医院服务, 医院服务Filter>(filter);

        /// <summary>
        /// 为某医院订购某些服务,也包括修改服务的地址;
        /// 即使是同一个服务,针对不同的医院,其地址也很可能不同.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改医院服务([FromBody]医院服务 model)
        {
            return await Db.Merge(model);
        }
    }
}