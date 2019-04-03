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
    /// 
    /// </summary>
    public class BaseInfoController : TeachingManagementBaseController
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
        /// 教学学员不应该被修改;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学学员类型()
        {
            return await Db.GetListSpAsync<教学学员类型>();
        }

    }
}