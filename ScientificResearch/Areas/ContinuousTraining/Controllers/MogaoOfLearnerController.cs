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
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.ContinuousTraining.Controllers
{
    /// <summary>
    /// 慕课学习者的接口,针对移动端
    /// </summary>
    public class MogaoOfLearnerController : ContinuousTrainingBaseController
    {
        /// <summary>
        /// 注意
        /// 1:后台来填:必填条件 活动类型指"继教慕课, 继教理论考试, 继教操作考试, 继教签到, 继教慕课素材, 继教试题, 继教试卷, 继教评分表"
        /// 2:对于一个某人可参与的活动来说,状态有:未开始,进行中,已结束,而没有"未发布"!
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取自己可参与的慕课活动(Paging paging, 继教某人可参与的活动Filter filter)
        {
            filter.活动类型 = 继教文件夹类型.继教慕课.ToString();
            return await Db.GetPagingListSpAsync<v_tfn_继教某人可参与的活动, 继教某人可参与的活动Filter>(
                paging,
                filter,
                $"tfn_继教某人可参与的活动('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        /// <summary>
        /// 注意活动内容列表里面的"是否通过": true-通过,false-参与了但没通过,null-就根本没有参与
        /// </summary>
        /// <param name="活动编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取自己可参与的某慕课活动详情(int 活动编号)
        {
            return await 继教活动.获取某人可参与的活动详情(活动编号, CurrentUser.人员类型, CurrentUser.编号, Db);
        }

        [HttpGet]
        async public Task<object> 获取某慕课活动内容详情以及自己的参与情况(int 活动内容编号)
        {
            return await 继教慕课.获取某慕课活动内容详情以及某人参与情况(
                活动内容编号,
                CurrentUser.人员类型,
                CurrentUser.编号,
                Config.GetValue<string>("七牛:AccessKey"),
                Config.GetValue<string>("七牛:SecretKey"),
                Config.GetValue<string>("七牛:Domain"),
                Db);
        }

        [HttpGet]
        async public Task<object> 获取某理论考试活动内容详情以及自己的参与情况(int 活动内容编号)
        {
            return await Db.GetModelByIdSpAsync<v_tfn_继教某人可参与的理论考试>(
                活动内容编号,
                nameof(v_tfn_继教某人可参与的理论考试.考试编号),
                tableName: $"tfn_继教某人可参与的理论考试('{CurrentUser.人员类型}',{CurrentUser.编号},'')");
        }

        [HttpGet]
        async public Task<object> 获取某操作考试活动内容详情以及自己的参与情况(int 活动内容编号)
        {
            return await Db.GetModelByIdSpAsync<v_tfn_继教某人可参与的操作考试>(
                活动内容编号,
                nameof(v_tfn_继教某人可参与的操作考试.考试编号),
                tableName: $"tfn_继教某人可参与的操作考试('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        [HttpPost]
        async public Task 参与慕课活动内容([FromBody]继教慕课参与情况 model)
        {
            await 继教慕课.增改某人某慕课活动内容参与情况(model, Db);
        }
    }
}
