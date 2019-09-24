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

        /// <summary>
        /// 注意这个返回的是一系列试题编号;
        /// </summary>
        /// <param name="数量"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 随机获取试题(int 数量, 继教试题Filter filter)
        {
            if (数量 > Config.GetValue<int>("随机选择试题最大数量"))
            {
                throw new Exception($"随机选择试题最大数量不要超过{Config.GetValue<int>("随机选择试题最大数量")}");
            }

            var paging = new Paging() { Index = 1, Size = 数量 };

            var result = await Db.GetPagingListSpAsync<v_继教试题, 继教试题Filter>(paging, filter, orderStr: "NEWID()");

            return result.list.Select(i => i.编号);
        }

        /// <summary>
        /// 如果是随机选择,那么Paging中的Size也就是随机选择的数量,随机选择试题最大数量不要超过100
        /// 题库大的话,这可能比较耗时
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <param name="是否随机选择"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取试题(Paging paging, 继教试题Filter filter)
        {
            //if (试题编号列表.Count() > 0)
            //{
            //    filter.WhereIn编号 = 试题编号列表.ToStringIdWithSpacer();
            //}
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

        [HttpPost]
        async public Task 增改试卷([FromBody]增改试卷 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教试卷.增改继教试卷(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpGet]
        async public Task<object> 分页获取试卷(Paging paging, 继教试卷Filter filter)
        {
            var result = await Db.GetPagingListSpAsync<v_继教试卷, 继教试卷Filter>(
                paging,
                filter);

            var 试卷编号字串 = result.list.Select(i => i.编号).ToStringIdWithSpacer();

            var 试卷结构列表 = await Db.GetListSpAsync<v_继教试卷结构, 继教试卷结构Filter>(
                new 继教试卷结构Filter()
                {
                    WhereIn试卷编号 = 试卷编号字串
                });

            return new
            {
                result.total,
                list = from item in result.list
                       select new
                       {
                           试卷基本信息 = item,
                           试卷结构列表 = from item2 in 试卷结构列表 where item2.试卷编号 == item.编号 select item2
                       }
            };

        }

        /// <summary>
        /// 根据一个试卷结构编号,以及试题的各种筛选条件,来分页得到一个试卷结构中试题的信息
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取试卷试题(Paging paging, 继教试卷试题Filter filter)
        {
            var result = await Db.GetPagingListSpAsync<v_继教试卷试题, 继教试卷试题Filter>(paging, filter);
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
    }
}
