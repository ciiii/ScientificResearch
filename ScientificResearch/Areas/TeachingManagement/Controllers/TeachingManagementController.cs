using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    public class TeachingManagementController : TeachingManagementBaseController
    {
        /// <summary>
        /// 医院管理员可以看到所有学员;
        /// 科室管理员只能看到轮转科室有自己管理的科室的学员;
        /// 带教老师只能看到自己带教的学员;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<object> 分页获取我的学员(Paging paging, 教学学员培训情况Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学学员培训情况, 教学学员培训情况Filter>(paging, filter, $"tfn_我的学员({CurrentUser.编号})");
        }

        /// <summary>
        /// 注意:Null报到时间 = true是所有未报到的学员; = false 是所有已报到的学员;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<object> 分页获取学员报到情况(Paging paging, 教学学员报到Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学学员报到, 教学学员报到Filter>(paging, filter);
        }

        /// <summary>
        /// 学员报到/学员报到信息修改;
        /// 报到时,只需要填报到时间,选择的教学本院策略,计划开始培训日期,计划结束培训日期,其他都不用填;
        /// 修改报到信息时,理论上所有的数据都需要;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<object> 增改学员报到([FromBody]教学学员培训 data) =>
            await Db.Merge(data);

        /// <summary>
        /// 注意条件:是否已安排宿舍
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<object> 分页获取学员宿舍楼安排(Paging paging,教学学员宿舍楼安排Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学学员宿舍安排,教学学员宿舍楼安排Filter>(paging, filter);
        }

        /// <summary>
        /// 编号就是学员的编号;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<object> 增改学员宿舍安排([FromBody]教学学员宿舍安排 data) =>
            await Db.Merge(data);

        /// <summary>
        /// 可以针对一批学员设置宿舍
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<object> 批量增改学员宿舍安排([FromBody]IEnumerable<教学学员宿舍安排> data) =>
            await Db.Merge(data);
    }
}