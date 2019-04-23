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
    /// 和基础信息维护功能对应
    /// </summary>
    public class BaseInfoController : TeachingManagementBaseController
    {
        /// <summary>
        /// 字典相关的接口,都使用ScientificResearch-baseinfo中相关的接口,教学管理不再单独提供;
        /// 涉及的字典分类有:学历;职称;学科;民族,"往届应届","送培方式","医疗卫生机构类型"
        /// </summary>
        /// <param name="分类"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某类字典(string 分类)
        {
            return await Task.FromResult(Content("请使用ScientificResearch-baseinfo中相关的接口"));
        }

        /// <summary>
        /// 教学学员不应该被修改;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学学员类型()
        {
            return await Db.GetListSpAsync<教学学员类型>();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学宿舍楼()
        {
            return await Db.GetListSpAsync<教学宿舍楼>();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改教学宿舍楼([FromBody]教学宿舍楼 data)
        {
            return await Db.Merge(data);
        }

        /// <summary>
        /// 只读;用来说明打分分数和评分等级之间的对应关系;
        /// 如果业务上是打分,可以用此来说明其"掌握程度"
        /// 如果业务上是评等级,实际上是将取对应评分等级中的最大分值保存;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学评分等级() =>
            await Db.GetListSpAsync<教学评分等级>();

    }
}