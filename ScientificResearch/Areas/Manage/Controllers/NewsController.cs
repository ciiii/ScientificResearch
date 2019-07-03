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
using System.Data.SqlClient;

namespace ScientificResearch.Areas.Manage.Controllers
{
    /// <summary>
    /// 总库的新闻管理,这个应该是云中漫步自己的新闻,针对所有受众
    /// </summary>
    public class NewsController : ManageBaseController
    {
        [HttpGet]
        [AllowAnonymous]
        async public Task<object> 获取总库新闻分类() =>
            await Db_Manage.GetListSpAsync<新闻分类>(orderType: true);

        /// <summary>
        /// 新闻分类编号 这个条件一般是必须的;
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        async public Task<object> 获取总库标签(总库标签Filter filter) =>
            await Db_Manage.GetListSpAsync<标签, 总库标签Filter>(filter, orderType: true);

        /// <summary>
        /// 分页获取总库新闻,列表,不包括内容
        /// 注意,标签传名称即可;
        /// </summary>
        /// <param name="paging"></param>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        async public Task<PagingResult<v_新闻_列表>> 分页获取总库新闻(Paging paging, 总库新闻Filter filter) =>
            await Db_Manage.GetPagingListSpAsync<v_新闻_列表, 总库新闻Filter>(paging, filter);

        [HttpGet]
        [AllowAnonymous]
        async public Task<object> 获取总库新闻详情(int 新闻编号)
        {
            var 新闻 = await Db_Manage.GetModelByIdSpAsync<v_新闻_详情>(新闻编号);
            var 标签 = await Db_Manage.GetListSpAsync<新闻标签, 新闻标签Filter>(new 新闻标签Filter() { 新闻编号 = 新闻编号 }, orderType: true);
            return new { 新闻, 标签 };

        }

        /// <summary>
        /// model是新闻,list是标签编号列表
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改总库新闻([FromBody]PredefindedModelList<新闻, int> data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 新闻 = await dbForTransaction.Merge(data.Model, transaction: transaction);
                var 新闻标签列表 = data.List.Select(i => new 新闻标签() { 编号 = 0, 新闻编号 = 新闻.编号, 标签编号 = i });
                await dbForTransaction.Merge(新闻.编号, 新闻标签列表, transaction: transaction);
            }
            await PredefinedSpExtention.ExecuteTransaction(Db_ManageConnectionString, myTran);
        }

        /// <summary>
        /// 删除总库新闻;
        /// </summary>
        /// <param name="编号列表"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 删除总库新闻([FromBody]IEnumerable<int> 编号列表) =>
            await Db_Manage.Delete<新闻>(编号列表);

        [HttpPost]
        async public Task<object> 上传总库新闻图片()
        {
            var filesNameList = await UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/总库/新闻图片",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传总库Logo图片()
        {
            var filesNameList = await UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/总库/Logo",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }
    }
}