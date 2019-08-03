using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagementOfStudent.Controllers
{
    /// <summary>
    /// 主页相关的接口
    /// 获取权限也在这里面
    /// 这个不能抽象为一个独立的area/架构/微服务,因为各自不同;
    /// </summary>
    public class HomePageController : TeachingManagementOfStudentBaseController
    {
        /// <summary>
        /// login 用manage里面的,这个作废了
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpPost]
        async public Task<object> Login([FromBody]LoginInfo model)
        {
            return await Task.FromResult(Content("请使用总库的login接口"));
            //return CurrentUser;
        }

        /// <summary>
        /// 如果要获取必读且未读的通知公告,使用条件"是否必读=true 且 是否已接收=false"
        /// </summary>
        /// <param name="人员编号"></param>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取可查看的教学通知公告(Paging paging, 教学某人员可查看的通知公告Filter filter)
        {
            return await Db.GetPagingListSpAsync<object, 教学某人员可查看的通知公告Filter>(
                paging, filter, $"tfn_教学某人员可查看的通知公告('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        /// <summary>
        /// 首页上查看教学通知公告详情会设置为"已接收"
        /// 不需要看到接收条件
        /// </summary>
        /// <param name="编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学通知公告详情(int 编号)
        {
            var model = await Db.GetModelByIdSpAsync<v_教学通知公告>(编号);

            await Db.ExecuteSpAsync(new sp_教学通知公告_接收()
            {
                通知公告编号 = 编号,
                接收人类型 = CurrentUser.人员类型,
                接收人编号 = CurrentUser.编号
            });

            return model;

            //var list = await Db.GetListSpAsync<v_教学通知公告接收条件, 教学通知公告接收条件Filter>(new 教学通知公告接收条件Filter() { 教学通知公告编号 = 编号 });

            //return new
            //{
            //    通知公告 = model,
            //    接收条件 = list
            //};
        }

        [HttpGet]
        async public Task<object> 分页获取待办事宜(Paging paging, VTFNFLowFilter filter)
        {
            filter.IsCanOperate = true;
            return await Db.GetPagingListSpAsync<VTFNFLow, VTFNFLowFilter>(
                paging,
                filter,
                $"TFNFlow(null,null,'{CurrentUser.人员类型}',{CurrentUser.编号})");
        }
    }
}