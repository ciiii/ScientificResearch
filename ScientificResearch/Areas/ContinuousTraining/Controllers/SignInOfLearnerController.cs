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
    public class SignInOfLearnerController : ContinuousTrainingBaseController
    {
        [HttpGet]
        async public Task<object> 分页获取自己可参与的签到活动(Paging paging, 继教某人可参与的签到Filter filter)
        {
            filter.活动类型 = 继教文件夹类型.继教签到.ToString();
            return await Db.GetPagingListSpAsync<v_tfn_继教某人可参与的签到, 继教某人可参与的签到Filter>(
                paging,
                filter,
                $"tfn_继教某人可参与的签到('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        [HttpPost]
        async public Task 签到([FromBody]int 签到规定编号)
        {
            var 签到规定 = await Db.GetModelByIdSpAsync<v_继教签到规定>(签到规定编号);

            //验证当前时间在该签到规定的可签到时间范围内
            if(DateTime.Now < 签到规定.签到开始时间)
            {
                throw new Exception("签到还没开始");
            }

            if (DateTime.Now > 签到规定.签到结束时间)
            {
                throw new Exception("签到已经结束");
            }

            //该签到规定为静态二维码,则ok
            //该签到规定为动态二维码,则检查签到的时段是否为正确的时段

            //在活动的可参与人里面加上该签到人.如果有了则覆盖
            var 该活动可参与人 = new 继教活动可参与人()
            {
                活动编号 = 签到规定.活动编号,
                可参与人类型 = CurrentUser.人员类型,
                可参与人编号 = CurrentUser.编号
            };
            await Db.ExecuteSpAsync(new sp_继教活动可参与人_普通增改()
            {
                tt = 该活动可参与人.ToDataTable()
            });

            var 签到参与情况 = new 继教签到参与情况()
            {
                参与人类型 = CurrentUser.人员类型,
                参与人编号 = CurrentUser.编号,
                签到时间 = DateTime.Now,
                签到规定编号 = 签到规定编号
            };

            await Db.Merge(签到参与情况);
        }
    }
}
