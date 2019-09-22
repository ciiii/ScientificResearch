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
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.ContinuousTraining.Controllers
{
    public class ExaminationController : ContinuousTrainingBaseController
    {
        [HttpGet]
        async public Task<object> 获取试题类型()
        {
            return await Db.GetListSpAsync<继教试题类型>(orderType: true);
        }

        [HttpGet]
        async public Task<object> 分页获取试题(Paging paging, 继教试题Filter filter)
        {
            var result = await Db.GetPagingListSpAsync<v_继教试题, 继教试题Filter>(paging, filter);
            var 试题编号字串 = result.list.Select(i => i.编号).ToStringIdWithSpacer();

            var 试题标签列表 = await Db.GetListSpAsync<v_继教试题标签, 继教试题标签Filter>(new 继教试题标签Filter()
            {
                WhereIn试题编号 = 试题编号字串
            });

            var 试题备选答案列表 = await Db.GetListSpAsync<继教试题备选答案, 继教试题备选答案Filter>(new 继教试题备选答案Filter()
            {
                WhereIn试题编号 = 试题编号字串
            });

            var 试题正确答案列表 = await Db.GetListSpAsync<继教试题正确答案, 继教试题正确答案Filter>(new 继教试题正确答案Filter()
            {
                WhereIn试题编号 = 试题编号字串
            });

            return new
            {
                result.total,
                list = from item in result.list
                       select new
                       {
                           试题基本信息 = item,
                           标签列表 = from item1 in 试题标签列表 where item1.试题编号 == item.编号 select item1,
                           备选答案列表 = from item2 in 试题备选答案列表 where item2.试题编号 == item.编号 select item2,
                           正确答案列表 = from item3 in 试题正确答案列表 where item3.试题编号 == item.编号 select item3

                       }
            };
        }

        [HttpPost]
        async public Task 增改试题([FromBody]IEnumerable<增改试题> data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教试题.增改继教试题(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

    }
}
