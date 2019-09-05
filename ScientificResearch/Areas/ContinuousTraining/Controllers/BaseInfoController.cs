using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.ContinuousTraining.Controllers
{
    public class BaseInfoController : ContinuousTrainingBaseController
    {
        /// <summary>
        /// 字典相关的接口,都使用ScientificResearch-baseinfo中相关的接口,教学管理不再单独提供;
        /// 涉及的字典分类有:学历;职称;学科;民族
        /// </summary>
        /// <param name="分类"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某类字典(string 分类)
        {
            return await Task.FromResult(Content("请使用ScientificResearch-baseinfo中相关的接口"));
        }

        /// <summary>
        /// 能级不应该被修改;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取继教能级()
        {
            return await Db.GetListSpAsync<继教能级>(orderType: true);
        }

        /// <summary>
        /// 慕课设置,考试设置,签到设置,这些都放到一起的
        /// 应该是用json串来存储,这里还是用了表.....
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取继教设置()
        {
            return (await Db.GetListSpAsync<继教设置>()).FirstOrDefault();
        }

        [HttpPost]
        async public Task 增改继教设置([FromBody] 继教设置 data)
        {
            await Db.Merge(data);
        }

    }
}
