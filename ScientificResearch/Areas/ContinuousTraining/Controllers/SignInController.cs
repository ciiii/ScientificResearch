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
    public class SignInController:ContinuousTrainingBaseController
    {
        [HttpGet]
        async public Task<object> 分页获取某文件夹下的签到活动(Paging paging, 继教签到活动Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_继教签到活动, 继教签到活动Filter>(
                paging,
                filter,
                orderStr: nameof(v_继教签到活动.编号));
        }

        [HttpGet]
        async public Task<object> 获取某签到活动详情(int 签到编号)
        {
            return await 继教签到.获取某签到活动详情(签到编号, Db);
        }

        [HttpPost]
        async public Task 增改继教签到活动([FromBody]增改继教签到活动 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 活动 = new 继教活动()
                {
                    编号 = data.活动内容.活动编号,
                    文件夹编号 = data.文件夹编号,
                    建立人 = CurrentUser.编号,
                    名称 = data.活动内容.名称,
                    学分 = data.学分,
                    必须按顺序学习 = true,
                    //开始时间 = data.活动内容.开始时间,
                    //结束时间 = data.活动内容.结束时间,
                };

                //活动 = await dbForTransaction.Merge(活动, transaction: transaction);
                活动 = await 继教活动.增改继教活动(活动, dbForTransaction, transaction: transaction);
                data.活动内容.活动编号 = 活动.编号;

                await 继教签到.增改继教签到(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 发布继教签到活动([FromBody]发布继教活动 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教活动.发布继教活动(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 这个地方获取到的签到情况，是每个签到每个人一条记录，
        /// 比如某次签到包含两次签到规定，但对于一个人来说，只有一条记录，说明他一共签到了几次
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="签到编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取某签到的签到情况(Paging paging, 继教签到参与情况Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_tfn_继教签到参与情况, 继教签到参与情况Filter>(
                paging,
                filter,
                tbName: $"tfn_继教签到参与情况({filter.签到编号})");
        }

        /// <summary>
        /// 与上面的不同，这个地方获取到的是某次签到某人的签到记录，可能是多条记录
        /// 比如某次签到包含两次签到规定，某人按规定签到了两次，那么他就有两个签到记录
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某签到某人的签到记录(继教签到参与情况Filter filter)
        {
            return await Db.GetListSpAsync<v_继教签到参与情况, 继教签到参与情况Filter>(filter);
        }

        [HttpGet]
        public object 获取服务器时间()
        {
            return DateTime.Now;
        }
    }
}
