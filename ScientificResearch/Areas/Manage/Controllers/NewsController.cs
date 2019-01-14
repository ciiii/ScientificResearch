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
    /// 总库的新闻管理,这个应该是云中漫步自己的新闻,针对所有受众
    /// </summary>
    public class NewsController : ManageBaseController
    {
        /// <summary>
        /// 分页获取总库新闻
        /// </summary>
        /// <param name="paging"></param>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        async public Task<PagingResult<新闻>> 分页获取总库新闻(Paging paging) =>
            await Db_Manage.GetPagingListSpAsync<新闻>(paging);

        /// <summary>
        /// 增改总库新闻,老规矩.编号=0为新增;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改总库新闻([FromBody]新闻 model) =>
            await Db_Manage.Merge(model);

        /// <summary>
        /// 删除总库新闻;
        /// </summary>
        /// <param name="编号列表"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 删除总库新闻([FromBody]IEnumerable<int> 编号列表) =>
            await Db_Manage.Delete<新闻>(编号列表);

    }
}