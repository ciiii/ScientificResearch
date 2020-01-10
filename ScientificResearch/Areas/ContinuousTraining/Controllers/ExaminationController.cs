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
    public class ExaminationController : ContinuousTrainingBaseController
    {
        #region 试题试卷
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
            }, orderStr: nameof(继教试题备选答案.备选答案编码), orderType: true);

            var 试题正确答案列表 = await Db.GetListSpAsync<继教试题正确答案, 继教试题正确答案Filter>(new 继教试题正确答案Filter()
            {
                WhereIn试题编号 = 试题编号字串
            }, orderStr: nameof(继教试题正确答案.正确答案编码), orderType: true);

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
        #endregion

        #region 理论考试活动 活动内容
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
                orderStr: nameof(v_继教理论考试活动.编号));
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

        [HttpGet]
        async public Task<object> 导出某理论考试参与情况(int 活动内容编号)
        {
            var 基本信息 = await Db.GetModelByIdSpAsync<v_继教理论考试>(活动内容编号);
            if (基本信息 == null)
            {
                throw new Exception("没有找到该理论考试");
            }
            var 参与情况 = await Db.GetListSpAsync<v_继教理论考试参与情况, 继教理论考试参与情况Filter>(
                new 继教理论考试参与情况Filter()
                {
                    考试编号 = 活动内容编号
                });

            var 参与情况导出格式 = 参与情况.Select(i => new 导出继教理论考试参与情况()
            {
                考试编号 = i.考试编号,
                考试批次编号 = i.考试批次编号,
                参与人称谓 = i.参与人称谓,
                答题开始时间 = i.答题开始时间,
                答题结束时间 = i.答题结束时间,
                得分 = i.得分,
                是否通过 = i.是否通过 == true ? "合格" : "不合格"
            });

            var filePathName = MyXls.Export(Env.WebRootPath, "upload/继教/导出理论考试参与情况", 基本信息.名称, 参与情况导出格式);
            return filePathName;
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
        #endregion

        #region 评分表
        [HttpGet]
        async public Task<object> 分页获取评分表(Paging paging, 继教评分表Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_继教评分表, 继教评分表Filter>(
                paging,
                filter);
        }

        [HttpPost]
        async public Task<object> 增改评分表([FromBody]继教评分表 model)
        {
            var result = await Db.Merge(model);
            return result.编号;
        }

        [HttpPost]
        async public Task 删除评分表([FromBody]IEnumerable<int> 编号列表)
        {
            var 要删除的评分表列表 = await Db.GetListSpAsync<v_继教评分表, 继教评分表Filter>(
                new 继教评分表Filter()
                {
                    WhereIn编号 = 编号列表.ToStringIdWithSpacer()
                });

            if (要删除的评分表列表.Any(i => i.是否被引用 == true))
            {
                throw new Exception("不能删除已经被使用的评分表");
            }

            await Db.Delete<继教评分表>(编号列表);
        }

        [HttpGet]
        async public Task<object> 分页获取某评分表的项目(Paging paging, 继教评分表项目Filter filter)
        {
            var result = await Db.GetPagingListSpAsync<继教评分表项目, 继教评分表项目Filter>(paging, filter);

            var 项目编号列表 = result.list.Select(i => i.编号);

            var 相关的评分表项目要求 = await Db.GetListSpAsync<继教评分表项目要求, 继教评分表项目要求Filter>(
                new 继教评分表项目要求Filter()
                {
                    WhereIn评分表项目编号 = 项目编号列表.ToStringIdWithSpacer()
                });

            return new
            {
                result.total,
                list = from item in result.list
                       select new
                       {
                           评分表项目 = item,
                           评分表项目要求 = from item2 in 相关的评分表项目要求 where item2.评分表项目编号 == item.编号 orderby item2.编号 select item2
                       }
            };
        }

        /// <summary>
        /// 同时增改一个评分表项目,以及其包含的多个要求.不在参数中的要求将删除;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改评分表项目([FromBody]增改评分表项目 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 项目 = await dbForTransaction.Merge(data.评分表项目, transaction: transaction);
                await dbForTransaction.Merge(项目.编号, data.评分表项目要求列表, transaction: transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 删除评分表项目([FromBody]IEnumerable<int> 编号列表)
        {
            await Db.Delete<继教评分表项目>(编号列表);
        }
        #endregion

        #region 操作考试活动 活动内容

        /// <summary>
        /// 文件夹编号必填,而且必然是"操作考试"的文件夹
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取某文件夹下的操作考试活动(Paging paging, 继教操作考试活动Filter filter)
        {
            //return await Db.GetPagingListSpAsync<v_继教操作考试活动, 继教操作考试活动Filter>(paging, filter);
            var 操作考试活动列表 = await Db.GetPagingListSpAsync<v_继教操作考试活动, 继教操作考试活动Filter>(
                paging,
                filter,
                orderStr: nameof(v_继教操作考试活动.编号));
            var 考试批次列表 = await Db.GetListSpAsync<继教考试批次, 继教考试批次Filter>(new 继教考试批次Filter()
            {
                WhereIn考试编号 = 操作考试活动列表.list.Select(i => i.编号).ToStringIdWithSpacer()
            });
            return new
            {
                操作考试活动列表.total,
                list = from item in 操作考试活动列表.list
                       select new
                       {
                           操作考试活动基本信息 = item,
                           批次列表 = from item2 in 考试批次列表 where item2.考试编号 == item.编号 select item2
                       }
            };
        }

        [HttpGet]
        async public Task<object> 分页获取某助教可以打分的操作考试活动(Paging paging, 继教操作考试Filter filter)
        {
            //return await Db.GetPagingListSpAsync<v_继教操作考试活动, 继教操作考试活动Filter>(paging, filter);
            var 操作考试活动列表 = await Db.GetPagingListSpAsync<v_继教操作考试活动, 继教操作考试Filter>(
                paging,
                filter,
                tbName: $"tfn_继教某助教可打分的操作考试({CurrentUser.编号})",
                orderStr: nameof(v_继教操作考试活动.编号));
            var 考试批次列表 = await Db.GetListSpAsync<继教考试批次, 继教考试批次Filter>(new 继教考试批次Filter()
            {
                WhereIn考试编号 = 操作考试活动列表.list.Select(i => i.编号).ToStringIdWithSpacer()
            });
            return new
            {
                操作考试活动列表.total,
                list = from item in 操作考试活动列表.list
                       select new
                       {
                           操作考试活动基本信息 = item,
                           批次列表 = from item2 in 考试批次列表 where item2.考试编号 == item.编号 select item2
                       }
            };
        }

        [HttpGet]
        async public Task<object> 获取某操作考试活动详情(int 考试编号)
        {
            return await 继教操作考试.获取某操作考试活动详情(考试编号, Db);
        }

        [HttpPost]
        async public Task 增改继教操作考试活动([FromBody]增改继教操作考试活动 data)
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

                await 继教操作考试.增改继教操作考试(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 其实和慕课活动的发布是一个意思
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 发布继教操作考试活动([FromBody]发布继教活动 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教活动.发布继教活动(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpGet]
        async public Task<object> 获取某操作考试评分表信息(int 操作考试编号)
        {
            var 评分表列表 = await Db.GetListSpAsync<v_继教操作考试评分表, 继教操作考试评分表Filter>(
                new 继教操作考试评分表Filter()
                {
                    操作考试编号 = 操作考试编号
                });

            var 项目列表 = await Db.GetListSpAsync<继教评分表项目, 继教评分表项目Filter>(new 继教评分表项目Filter()
            {
                WhereIn评分表编号 = 评分表列表.Select(i => i.评分表编号).ToStringIdWithSpacer()
            });

            var 项目编号列表 = 项目列表.Select(i => i.编号);

            var 评分表项目要求列表 = await Db.GetListSpAsync<继教评分表项目要求, 继教评分表项目要求Filter>(
                new 继教评分表项目要求Filter()
                {
                    WhereIn评分表项目编号 = 项目编号列表.ToStringIdWithSpacer()
                });

            return from item in 评分表列表
                   select new
                   {
                       评分表 = item,
                       评分表项目列表 = from item2 in 项目列表
                                 where item2.评分表编号 == item.评分表编号
                                 orderby item2.编号
                                 select new
                                 {
                                     评分表项目 = item2,
                                     评分表项目要求列表 = from item3 in 评分表项目要求列表 where item3.评分表项目编号 == item2.编号 orderby item3.编号 select item3
                                 },
                   };
        }

        [HttpPost]
        async public Task 操作考试打分([FromBody]操作考试打分 data)
        {
            var 现有参与情况 = (await Db.GetListSpAsync<继教操作考试参与情况, 继教操作考试参与情况Filter>(
               new 继教操作考试参与情况Filter
               {
                   考试批次编号 = data.参与情况.考试批次编号,
                   参与人类型 = data.参与情况.参与人类型,
                   参与人编号 = data.参与情况.参与人编号
               })).FirstOrDefault();

            if (现有参与情况 != null)
            {
                throw new Exception("该考生本次操作考试已经打分");
            }

            var 批次信息 = await Db.GetModelByIdSpAsync<继教考试批次>(data.参与情况.考试批次编号);

            if (DateTime.Now < 批次信息.考试开始时间 || DateTime.Now > 批次信息.考试结束时间)
            {
                throw new Exception("当前不在考试时间范围内不能打分");
            }

            if (data.参与情况.开始操作时间 > data.参与情况.结束操作时间)
            {
                throw new Exception("开始操作时间不能大于结束操作时间");
            }

            //注意:操作考试参与情况中的得分,是int;而在某一个项目的某一个打分中,是可以为一位小数的
            data.参与情况.得分 = (int)data.打分情况列表.Sum(i => i.打分);

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 参与情况 = await dbForTransaction.Merge(data.参与情况, transaction: transaction);
                await dbForTransaction.Merge(参与情况.编号, data.打分情况列表, transaction: transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);

        }

        #endregion

        #region 自测活动 活动内容
        /// <summary>
        /// 文件夹编号必填,而且必然是"继教自测"的文件夹
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取某文件夹下的自测活动(Paging paging, 继教理论考试活动Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_继教自测活动, 继教理论考试活动Filter>(
                paging,
                filter,
                orderStr: nameof(v_继教自测活动.编号));
        }


        [HttpGet]
        async public Task<object> 获取某自测活动详情(int 自测编号)
        {
            var 基本信息 = await Db.GetModelByIdSpAsync<v_继教自测活动>(自测编号);
            var 活动可参与人列表 = await Db.GetListSpAsync<v_继教活动可参与人, 继教活动可参与人Filter>(
                new 继教活动可参与人Filter()
                {
                    活动编号 = 基本信息.活动编号
                });
            return new { 基本信息, 活动可参与人列表 };
        }

        /// <summary>
        /// 考试编号 必须填,"分页获取某文件夹下的自测活动"中的"编号"就是考试编号/或者叫自测编号;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取某自测活动内容参与情况(Paging paging, 继教理论考试参与情况Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_继教理论考试参与情况, 继教理论考试参与情况Filter>(paging, filter);
        }

        [HttpPost]
        async public Task 增改继教自测活动([FromBody]增改继教自测活动 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 活动 = new 继教活动()
                {
                    编号 = data.活动内容.活动编号,
                    文件夹编号 = data.文件夹编号,
                    建立人 = CurrentUser.编号,
                    名称 = data.活动内容.名称,
                    学分 = 0,
                    必须按顺序学习 = true,
                    //开始时间 = data.活动内容.开始时间,
                    //结束时间 = data.活动内容.结束时间,
                };

                //活动 = await dbForTransaction.Merge(活动, transaction: transaction);
                活动 = await 继教活动.增改继教活动(活动, dbForTransaction, transaction: transaction);
                data.活动内容.活动编号 = 活动.编号;

                await 继教理论考试.增改继教自测(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 发布继教自测活动([FromBody]发布继教活动 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教活动.发布继教活动(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }
        #endregion

        #region 统计
        /// <summary>
        /// 需要注意的是,区间一般都是左开右闭型的,除了起始数值为0的区间为左闭右闭类型
        /// </summary>
        /// <param name="data"></param>
        /// <param name="理论考试编号"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 获取某理论考试成绩分析([FromBody]分数段以及理论考试编号 data)
        {
            var 理论考试参与情况 = await Db.GetListSpAsync<v_继教理论考试参与情况, 继教理论考试参与情况Filter>(
                 new 继教理论考试参与情况Filter()
                 {
                     考试编号 = data.理论考试编号
                 });

            var 统计结果 = new List<分数段统计>();

            foreach (var item in data.分数段列表)
            {
                var 该分段统计结果 = new 分数段统计()
                {
                    起始分数 = item.起始分数,
                    结束分数 = item.结束分数,
                    人数 = 理论考试参与情况.Count(i => i.得分 > item.起始分数 && i.得分 <= item.结束分数 || (item.起始分数 == 0 && i.得分 == 0))
                };
                统计结果.Add(该分段统计结果);
            }

            return 统计结果;
        }

        [HttpGet]
        async public Task<object> 分页获取某理论考试错题分析(Paging paging, int 理论考试编号)
        {
            return await Db.GetPagingListSpAsync<object>(paging, $"tfn_继教某次考试试题正确率统计({理论考试编号})");
        }

        [HttpGet]
        async public Task<object> 获取某次理论考试某试题答题统计(int 理论考试编号, int 试题编号)
        {
            var 备选答案 = await Db.GetListSpAsync<继教试题备选答案, 继教试题备选答案Filter>(
                new 继教试题备选答案Filter()
                {
                    试题编号 = 试题编号
                });

            var 正确答案 = await Db.GetListSpAsync<继教试题正确答案, 继教试题正确答案Filter>(
                new 继教试题正确答案Filter()
                {
                    试题编号 = 试题编号
                });

            var 本次考试该试题的答案统计 =
                await Db.GetListSpAsync<某次考试某试题答题统计>($"tfn_继教某次考试某试题答题统计({理论考试编号},{试题编号})");

            return new
            {
                备选答案以及选择次数 = from item in 备选答案
                             select new
                             {
                                 备选答案 = item,
                                 选择次数 = (from item2 in 本次考试该试题的答案统计 where item2.答题答案编码 == item.备选答案编码 select item2.选择该答案次数).FirstOrDefault()

                             },
                正确答案
            };
        }

        /// <summary>
        /// 需要注意的是,区间一般都是左开右闭型的,除了起始数值为0的区间为左闭右闭类型
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 获取某操作考试成绩分析([FromBody]分数段以及操作考试编号 data)
        {
            var 操作考试参与情况 = await Db.GetListSpAsync<v_继教操作考试参与情况, 继教操作考试参与情况Filter>(
                 new 继教操作考试参与情况Filter()
                 {
                     考试编号 = data.操作考试编号
                 });

            var 统计结果 = new List<分数段统计>();

            foreach (var item in data.分数段列表)
            {
                var 该分段统计结果 = new 分数段统计()
                {
                    起始分数 = item.起始分数,
                    结束分数 = item.结束分数,
                    人数 = 操作考试参与情况.Count(i => i.得分 > item.起始分数 && i.得分 <= item.结束分数 || (item.起始分数 == 0 && i.得分 == 0))
                };
                统计结果.Add(该分段统计结果);
            }

            return 统计结果;
        }

        [HttpGet]
        async public Task<object> 分页获取某操作考试某评分表打分统计(int 操作考试编号,int 评分表编号)
        {
            return await Db.GetListSpAsync<object>($"tfn_继教某次考试评分表正确率统计({操作考试编号},{评分表编号})");
        }
        #endregion
    }
}
