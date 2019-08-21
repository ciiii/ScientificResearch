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

        /// <summary>
        /// 目前只有查看,且没有分页;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学活动类型() =>
            await Db.GetListSpAsync<教学活动类型>(orderType: true);

        /// <summary>
        /// 本来是在老师端的setting下,现在在学生端,都放到了baseinfo了
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某教学活动分类下的评价项目(教学活动评价项目Filter filter)
        {
            return await Db.GetListSpAsync<教学活动评价项目, 教学活动评价项目Filter>(filter, orderType: true);
        }


        [HttpGet]
        async public Task<object> 获取教学360评价方向(v_教学360评价方向Filter filter) =>
            await Db.GetListSpAsync<v_教学360评价方向, v_教学360评价方向Filter>(filter, orderType: true);

        [HttpGet]
        async public Task<object> 获取某目标类型的教学360评价分类和项目(教学360评价分类Filter filter)
        {
            var 分类 = await Db.GetListSpAsync<v_教学360评价分类, 教学360评价分类Filter>(filter, orderType: true);
            var 项目filter = new 教学360评价项目Filter() { WhereIn教学360评价分类编号 = 分类.Select(i => i.编号).ToStringIdWithSpacer() };
            var 项目 = await Db.GetListSpAsync<教学360评价项目, 教学360评价项目Filter>(项目filter, orderType: true);

            return from item in 分类
                   select new
                   {
                       分类信息 = item,
                       分类下的项目 = from item项目 in 项目 where item项目.教学360评价分类编号 == item.编号 select item项目
                   };
        }

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
