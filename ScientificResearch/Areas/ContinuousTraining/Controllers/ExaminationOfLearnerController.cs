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
    public class ExaminationOfLearnerController : ContinuousTrainingBaseController
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
        async public Task<object> 分页获取自己可参与的理论考试活动(Paging paging, 继教某人可参与的理论考试Filter filter, string 口令)
        {
            filter.活动类型 = 继教文件夹类型.继教理论考试.ToString();
            return await Db.GetPagingListSpAsync<v_tfn_继教某人可参与的理论考试, 继教某人可参与的理论考试Filter>(
                paging,
                filter,
                $"tfn_继教某人可参与的理论考试('{CurrentUser.人员类型}',{CurrentUser.编号},'{口令}')");
        }

        /// <summary>
        /// 可以参与考试的条件
        /// 1. 在考试批次时间范围内,否则报错.
        /// 2. 没有答题结束时间/或者根本没有参与情况
        ///     "继教理论考试参与情况"中的"答题开始时间"表示参与过考试
        ///     "答题结束时间"表示提交过试卷
        ///     "得分"目前是立即给算出来, 日后也有可能改为延迟打分;
        /// <param name="考试批次编号"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 参与理论考试([FromBody]int 考试批次编号)
        {
            var 考试批次 = await Db.GetModelByIdSpAsync<v_继教理论考试批次>(考试批次编号);
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
                考试批次编号 = 考试批次编号,
                参与人类型 = CurrentUser.人员类型,
                参与人编号 = CurrentUser.编号
            };

            var 参与情况 = (await Db.GetListSpAsync<继教理论考试参与情况, 继教理论考试参与情况Filter>(filter)).FirstOrDefault();

            if (参与情况?.答题结束时间 != null)
            {
                throw new Exception("已经交卷");
            }

            if (参与情况 == null)
            {
                参与情况 = new 继教理论考试参与情况();
                参与情况.考试批次编号 = 考试批次编号;
                参与情况.参与人类型 = CurrentUser.人员类型;
                参与情况.参与人编号 = CurrentUser.编号;
                参与情况.答题开始时间 = DateTime.Now;
                参与情况.答题结束时间 = null;
                参与情况.得分 = null;

                await Db.Merge(参与情况);

                //var 该考试批次可参与人 = new 继教考试批次可参与人();

                //19-10-21 如果某人没有被添加到可参与人,但是他有口令,则要把他放到可参与人里面去,方便他查看
                var 该活动可参与人 = new 继教活动可参与人()
                {
                    活动编号 = 考试批次.活动编号,
                    可参与人类型 = CurrentUser.人员类型,
                    可参与人编号 = CurrentUser.编号
                };
                await Db.ExecuteSpAsync(new sp_继教活动可参与人_普通增改()
                {
                    tt = 该活动可参与人.ToDataTable()
                });
            }
        }

        [HttpPost]
        async public Task 交卷([FromBody]交卷 data)
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
                参与人类型 = CurrentUser.人员类型,
                参与人编号 = CurrentUser.编号
            };

            var 参与情况 = (await Db.GetListSpAsync<继教理论考试参与情况, 继教理论考试参与情况Filter>(filter)).FirstOrDefault();

            if (参与情况?.答题结束时间 != null)
            {
                throw new Exception("已经交卷");
            }

            //var 试题 = await Db.GetListSpAsync<v_继教试卷中试题, 继教试卷中试题Filter>(
            //    new 继教试卷中试题Filter()
            //    {
            //        试卷编号 = 考试批次.试卷编号
            //    });

            //2 2019-11-7 修改为交卷的时候,清除以前的答题情况
            var 已有的答题情况 = await Db.GetListSpAsync<继教理论考试答题情况, 继教理论考试答题情况Filter>(
                new 继教理论考试答题情况Filter()
                {
                    理论考试参与情况编号 = 参与情况.编号
                });

            var 正确答案 = await Db.GetListSpAsync<v_继教试卷中试题正确答案, 继教试卷中试题正确答案Filter>(
                new 继教试卷中试题正确答案Filter()
                {
                    试卷编号 = 考试批次.试卷编号
                });

            var 正确答案拼串字典 = 正确答案.GroupBy(i => i.试题编号)
                                    .ToDictionary(
                                        i => i.Key,
                                        j => string.Join("",
                                            j.Select(h => h.正确答案编码)));

            //根据正确答案 和 data 生成每道题的 "继教理论考试答题情况" 和 其下的多个"继教理论考试答题答案"
            var 将提交的继教理论考试答题情况列表 = new List<继教理论考试答题情况>();
            foreach (var item in data.答题情况)
            {
                var 是否正确 = 正确答案拼串字典[item.试题编号] == string.Join("", item.答案编码);

                var 将提交的继教理论考试答题情况 = new 继教理论考试答题情况()
                {
                    编号 = 0,
                    理论考试参与情况编号 = 参与情况.编号,
                    试题编号 = item.试题编号,
                    答题时间 = item.答题时间,
                    显示排序值 = item.显示排序值,

                    是否正确 = 是否正确,
                    得分 = 是否正确 == true ? item.分值 : 0,

                    纠错 = null,
                    备注 = null
                };

                将提交的继教理论考试答题情况列表.Add(将提交的继教理论考试答题情况);
            }

            var 将提交的继教理论考试答题答案列表 = new List<继教理论考试答题答案>();

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //await 继教操作考试.增改继教操作考试(data, dbForTransaction, transaction);


                //2019-11-7删除该参与情况下的已有答题情况
                await dbForTransaction.Delete<继教理论考试答题情况>(已有的答题情况.Select(i => i.编号), transaction);

                //2019-11-7删除该答题情况下的已有答题答案
                await dbForTransaction.Delete<继教理论考试答题答案>(已有的答题情况.Select(i => i.编号), transaction);

                //保存"继教理论考试答题情况" 和 其下的多个"继教理论考试答题答案"
                var 保存的继教理论考试答题情况列表 = await dbForTransaction.Merge
                    (将提交的继教理论考试答题情况列表.AsEnumerable(), transaction);
                //需要取得本次新增时,每个试题对应的"继教理论考试答题情况的自增id"
                var 保存的继教理论考试答题情况字典 = 保存的继教理论考试答题情况列表.ToDictionary(i => i.试题编号, j => j.编号);
                foreach (var i in data.答题情况)
                {
                    foreach (var j in i.答案编码)
                    {
                        var 将提交的继教理论考试答题答案 = new 继教理论考试答题答案()
                        {
                            理论考试答题情况编号 = 保存的继教理论考试答题情况字典[i.试题编号],
                            答题答案编码 = j
                        };

                        将提交的继教理论考试答题答案列表.Add(将提交的继教理论考试答题答案);
                    }
                }
                await dbForTransaction.Merge(将提交的继教理论考试答题答案列表.AsEnumerable(), transaction);

                //更新一下"继教理论考试参与情况"中的结束时间和得分
                参与情况.答题结束时间 = data.答题结束时间;
                参与情况.得分 = 将提交的继教理论考试答题情况列表.Sum(i => i.得分);
                await dbForTransaction.Merge(参与情况, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpGet]
        async public Task<object> 获取答题情况(int 考试批次编号)
        {
            return await 获取某人答题情况(考试批次编号, CurrentUser.人员类型,CurrentUser.编号);
        }

        [HttpGet]
        async public Task<object> 获取某人的答题情况(int 考试批次编号, string 人员类型, int 人员编号)
        {
            return await 获取某人答题情况(考试批次编号, 人员类型, 人员编号);
        }

        private async Task<object> 获取某人答题情况(int 考试批次编号,string 人员类型 ,int 人员编号)
        {
            var 考试批次 = await Db.GetModelByIdSpAsync<v_继教理论考试批次>(考试批次编号);

            var result = await Db.GetListSpAsync<v_继教试卷试题, 继教考试时试题Filter>(
                new 继教考试时试题Filter() { 试卷编号 = 考试批次.试卷编号 });

            var 试题编号字串 = result.Select(i => i.编号).ToStringIdWithSpacer();

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

            var 参与情况 = (await Db.GetListSpAsync<继教理论考试参与情况, 继教理论考试参与情况Filter>(
                new 继教理论考试参与情况Filter
                {
                    考试批次编号 = 考试批次编号,
                    参与人类型 = 人员类型,
                    参与人编号 = 人员编号
                })).FirstOrDefault();

            var 答题情况 = await Db.GetListSpAsync<继教理论考试答题情况, 继教理论考试答题情况Filter>(
                new 继教理论考试答题情况Filter()
                {
                    理论考试参与情况编号 = 参与情况.编号
                });

            var 答题情况字典 = 答题情况.ToDictionary(i => i.试题编号, i => i);
            var 答题情况编号字串 = 答题情况.Select(i => i.编号).ToStringIdWithSpacer();

            var 答题答案 = await Db.GetListSpAsync<继教理论考试答题答案, 继教理论考试答题答案Filter>(
                new 继教理论考试答题答案Filter()
                {
                    WhereIn理论考试答题情况编号 = 答题情况编号字串
                });

            return from item in result
                   select new
                   {
                       试题基本信息 = item,
                       标签列表 = from item1 in 试题标签列表 where item1.试题编号 == item.编号 select item1,
                       备选答案列表 = from item2 in 试题备选答案列表 where item2.试题编号 == item.编号 orderby item2.备选答案编码 select item2,
                       正确答案列表 = from item3 in 试题正确答案列表 where item3.试题编号 == item.编号 orderby item3.正确答案编码 select item3,
                       //答题情况 = 答题情况.Where(i=>i.试题编号 == item.试题编号).FirstOrDefault(),
                       答题情况 = 答题情况字典.ContainsKey(item.试题编号) ? 答题情况字典[item.试题编号] : null,
                       答题答案 = 答题情况字典.ContainsKey(item.试题编号)
                           ? from item4 in 答题答案 where item4.理论考试答题情况编号 == 答题情况字典[item.试题编号]?.编号 orderby item4.答题答案编码 select item4
                           : null
                   };
        }
    }
}
