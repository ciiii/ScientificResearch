﻿using System;
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
            }, orderType: true);

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

        //[HttpPost]
        //async public Task 删除试卷结构([FromBody]IEnumerable<int> 编号列表)
        //{
        //    await Db.Delete<继教试卷结构>(编号列表);
        //}

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
                }, orderStr: nameof(v_继教试卷结构.排序值), orderType: true);

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

        [HttpGet]
        async public Task<object> 获取某试卷信息(int 试卷编号)
        {
            var 试卷基本信息 = await Db.GetModelByIdSpAsync<v_继教试卷>(试卷编号);
            var 试卷结构列表 = await Db.GetListSpAsync<v_继教试卷结构, 继教试卷结构Filter>(
                new 继教试卷结构Filter()
                {
                    试卷编号 = 试卷编号
                }, orderStr: nameof(v_继教试卷结构.排序值), orderType: true);
            return new
            {
                试卷基本信息,
                试卷结构列表
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

        /// <summary>
        /// 考试前预约,或者考试时获取整个试卷的试题;
        /// </summary>
        /// <param name="试卷编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取考试试题(int 试卷编号)
        {
            var result = await Db.GetListSpAsync<v_继教试题_考试时, 继教考试时试题Filter>(
                new 继教考试时试题Filter()
                {
                    试卷编号 = 试卷编号
                });
            var 试题编号字串 = result.Select(i => i.编号).ToStringIdWithSpacer();

            var 试题备选答案列表 = await Db.GetListSpAsync<继教试题备选答案, 继教试题备选答案Filter>(new 继教试题备选答案Filter()
            {
                WhereIn试题编号 = 试题编号字串
            });

            return from item in result
                   select new
                   {
                       试题基本信息 = item,
                       备选答案列表 = from item2 in 试题备选答案列表 orderby item2.备选答案编码 where item2.试题编号 == item.编号 select item2,

                   };
        }

        /// <summary>
        /// 文件夹编号必填,而且必然是"理论考试"的文件夹
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取某文件夹下的理论考试活动(Paging paging, 继教理论考试活动Filter filter)
        {
            //return await Db.GetPagingListSpAsync<v_继教理论考试活动, 继教理论考试活动Filter>(paging, filter);
            var 理论考试活动列表 = await Db.GetPagingListSpAsync<v_继教理论考试活动, 继教理论考试活动Filter>(
                paging, 
                filter,
                orderStr:nameof(v_继教理论考试活动.编号));
            var 考试批次列表 = await Db.GetListSpAsync<继教考试批次, 继教考试批次Filter>(new 继教考试批次Filter()
            {
                WhereIn考试编号 = 理论考试活动列表.list.Select(i => i.编号).ToStringIdWithSpacer()
            });
            return new
            {
                理论考试活动列表.total,
                list = from item in 理论考试活动列表.list
                       select new
                       {
                           理论考试活动基本信息 = item,
                           批次列表 = from item2 in 考试批次列表 where item2.考试编号 == item.编号 select item2
                       }
            };
        }

        /// <summary>
        /// 为特定批次生成一个新口令
        /// </summary>
        /// <param name="批次编号"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<string> 生成新口令(int 批次编号)
        {
            return await 继教理论考试.为特定批次生成一个新口令(批次编号, Db);
        }

        [HttpGet]
        async public Task<object> 获取某理论考试活动详情(int 考试编号)
        {
            return await 继教理论考试.获取某理论考试活动详情(考试编号, Db);
        }

        [HttpPost]
        async public Task 增改继教理论考试活动([FromBody]增改继教理论考试活动 data)
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

                await 继教理论考试.增改继教理论考试(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 其实和慕课活动的发布是一个意思
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 发布继教理论考试活动([FromBody]发布继教活动 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教活动.发布继教活动(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 当某个考生在考试进行中,因为意外情况导致被动交卷,
        /// 他可以请求监考老师/管理员让其继续考试
        /// 继续考试会让其回到未交卷状态,保留已经做过的题/答案,继续答题
        /// 如果考试还没有开始,或者已经结束,无法进行此操作;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 让某考生继续考试([FromBody]考生继续考试 data)
        {
            var 考试批次 = await Db.GetModelByIdSpAsync<v_继教理论考试批次>(data.考试批次编号);
            if (DateTime.Now < 考试批次.考试开始时间)
            {
                throw new Exception("考试还没有开始");
            }
            if (DateTime.Now > 考试批次.考试结束时间)
            {
                throw new Exception("考试已经结束");
            }

            var filter = new 继教理论考试参与情况Filter()
            {
                考试批次编号 = data.考试批次编号,
                参与人类型 = data.人员类型,
                参与人编号 = data.人员编号
            };

            //1
            var 参与情况 = (await Db.GetListSpAsync<继教理论考试参与情况, 继教理论考试参与情况Filter>(filter)).FirstOrDefault();

            if (参与情况?.答题结束时间 == null)
            {
                throw new Exception("该考生还没有交卷");
            }
            //设参与情况为没有交卷
            参与情况.答题结束时间 = null;
            参与情况.得分 = null;

            //2 2019-11-7 修改为交卷的时候,清除以前的答题情况
            //var 答题情况 = await Db.GetListSpAsync<继教理论考试答题情况, 继教理论考试答题情况Filter>(
            //    new 继教理论考试答题情况Filter()
            //    {
            //        理论考试参与情况编号 = 参与情况.编号
            //    });

            ////3从      
            //var 答题答案 = await Db.GetListSpAsync<继教理论考试答题答案, 继教理论考试答题答案Filter>(
            //    new 继教理论考试答题答案Filter()
            //    {
            //        WhereIn理论考试答题情况编号 = 答题情况.Select(i => i.编号).ToStringIdWithSpacer()
            //    });


            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //更新参与情况
                await dbForTransaction.Merge(参与情况, transaction);

                ////删除该参与情况下的答题情况
                //await dbForTransaction.Delete<继教理论考试答题情况>(答题情况.Select(i=>i.编号), transaction);

                ////删除该答题情况下的答题答案
                //await dbForTransaction.Delete<继教理论考试答题答案>(答题情况.Select(i=>i.编号), transaction);

            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }
    }
}
