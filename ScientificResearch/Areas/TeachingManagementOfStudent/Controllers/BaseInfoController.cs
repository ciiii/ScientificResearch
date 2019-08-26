using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using MyLib;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagementOfStudent.Controllers
{
    public class BaseInfoController : TeachingManagementOfStudentBaseController
    {
        /// <summary>
        /// 根据分类名称,获取某类字典,包括一个层次的和两个层次的字典数据,具体有哪些见基本信息整理文档.xlsx
        /// </summary>
        /// <param name="分类"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<IEnumerable<字典>> 获取某类字典(string 分类)
        {
            var filter = new 字典Filter() { 分类 = 分类 };
            return await Db.GetListSpAsync<字典, 字典Filter>(filter);
        }

        [HttpGet]
        async public Task<object> 获取教学专业科室任务类型() =>
            await Db.GetListSpAsync<教学专业科室任务类型>();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="教学角色编号"></param>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取教学角色中的人员([Required]int 教学角色编号, Paging paging, 教学人员Filter filter) =>
            await Db.GetPagingListSpAsync<v_教学人员, 教学人员Filter>(paging, filter, $"tfn_教学角色中的人员({教学角色编号})");

        [HttpGet]
        async public Task<object> 分页获取教学学员(Paging paging, 教学学员Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学学员, 教学学员Filter>(paging, filter, orderType: true);
        }

    }
}
