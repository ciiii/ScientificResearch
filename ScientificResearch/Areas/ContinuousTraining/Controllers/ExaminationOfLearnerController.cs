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
    /// 针对移动端的理论考试活动
    /// </summary>
    public class ExaminationOfLearnerController: ContinuousTrainingBaseController
    {
        /// <summary>
        /// 注意
        /// 1:对于一个某人可参与的活动来说,状态有:未开始,进行中,已结束,而没有"未发布"!
        /// 2:适应的情况有:
        /// 2-1 登录微信查看我的理论考试,就会给出"所有人都可以参加的"或者"可参与人中有我"的理论考试
        /// 2-2 输入口令(可以二维码得到口令),其实也就是多个条件筛选.
        /// 看到的东西,是以"考试批次"数据为核心的.和"慕课活动"以及"后台管理考试活动"都不一样
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取自己可参与的理论考试活动(Paging paging, 继教某人可参与的理论考试Filter filter,string 口令)
        {
            filter.活动类型 = 继教文件夹类型.继教理论考试.ToString();
            return await Db.GetPagingListSpAsync<v_tfn_继教某人可参与的理论考试, 继教某人可参与的理论考试Filter>(
                paging,
                filter,
                $"tfn_继教某人可参与的理论考试('{CurrentUser.人员类型}',{CurrentUser.编号},'{口令}')");
        }
    }
}
