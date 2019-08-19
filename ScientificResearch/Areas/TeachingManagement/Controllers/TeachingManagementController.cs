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
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    public class TeachingManagementController : TeachingManagementBaseController
    {
        /// <summary>
        /// 学员可以看到自己,不过学员不用这个接口看自己的信息
        /// 医院管理员可以看到所有学员;
        /// 科室管理员只能看到轮转科室有自己管理的科室的学员;
        /// 带教老师只能看到自己带教的学员;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<object> 分页获取我的学员(Paging paging, 教学学员培训情况Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学学员培训情况, 教学学员培训情况Filter>
                (paging, filter, $"tfn_我的学员('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        /// <summary>
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<object> 分页获取学员报到情况(Paging paging, 教学学员报到Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学学员报到, 教学学员报到Filter>(paging, filter);
        }

        /// <summary>
        /// 学员报到/学员报到信息修改;
        /// 报到时,只需要填报到时间,选择的教学本院策略,计划开始培训日期,计划结束培训日期,其他都不用填;
        /// 修改报到信息时,理论上所有的数据都需要;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<object> 增改学员报到([FromBody]教学学员培训 data) =>
            await Db.Merge(data);

        [HttpPost]
        public async Task<object> 批量增改学员报到([FromBody]IEnumerable<教学学员培训> data) =>
            await Db.Merge(data);

        /// <summary>
        /// 注意条件:是否已安排宿舍
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<object> 分页获取学员宿舍楼安排(Paging paging, 教学学员宿舍楼安排Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学学员宿舍安排, 教学学员宿舍楼安排Filter>(paging, filter);
        }

        /// <summary>
        /// 编号就是学员的编号;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<object> 增改学员宿舍安排([FromBody]教学学员宿舍安排 data) =>
            await Db.Merge(data);

        /// <summary>
        /// 可以针对一批学员设置宿舍
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<object> 批量增改学员宿舍安排([FromBody]IEnumerable<教学学员宿舍安排> data) =>
            await Db.Merge(data);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data">id为教学本院科室编号,list为</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<object> 获取轮转自动设置临时结果(自动设置轮转 data)
        {
            //在某个开始日期之后,针对指定的教学本院策略,计算一批学员的教学轮转安排;

            //得到该教学本院策略的详情
            //得到一个周期的总时长
            var 选定教学本院策略 = await Db.GetModelByIdSpAsync<v_教学本院策略>((int)data.教学本院策略编号);

            //得到该教学本院策略下的"v_教学本院科室"列表,
            var 选定教学本院策略下的科室 = (await Db.GetListSpAsync<v_教学本院科室, 教学本院科室Filter>
                (new 教学本院科室Filter()
                {
                    教学本院策略编号 = data.教学本院策略编号
                },
                orderStr: nameof(v_教学本院科室.排序值),
                orderType: true))
                .ToList();
            var 科室数量 = 选定教学本院策略下的科室.Count();

            //得到列表中最小的"最大学员人数"作为每一个策略组合的可重复数量;
            var 最小的最大学员人数 = (int)选定教学本院策略下的科室.Min(i => i.最大学员人数);

            //得到列表中周期最长的第一个科室,得到其index,作为换科室的依据;
            var 最长周期 = 选定教学本院策略下的科室.Max(i => i.培训时长);
            var 原第一个最长周期科室index = 选定教学本院策略下的科室.FindIndex(i => i.培训时长 == 最长周期);

            var 原第一个最长周期所占的时间范围 =
                Enumerable.Range(选定教学本院策略下的科室.Take(原第一个最长周期科室index).Sum(i => i.培训时长), 最长周期).ToList();
            var 新第一个最长周期科室index = 原第一个最长周期科室index;

            //定义一个存放策略组合的列表
            var 存放策略组合的列表 = new List<List<v_教学本院科室>>();

            var 原与新第一个最长周期所占的时间范围是否有重复 = false;

            //开始循环
            do
            {
                //把"v_教学本院科室"列表复制1份放到"存放策略组合的列表"中去;
                存放策略组合的列表.Add(MyLib.MyObject.CreateDeepCopy(选定教学本院策略下的科室));

                //把源"v_教学本院科室"列表尾部至少周期>=最大周期的多个元素移动到头部;并计算原"周期最长的第一个科室"的新的index,
                var 已移动的科室的总时长 = 0;
                do
                {
                    var 将移动的科室 = 选定教学本院策略下的科室.Last();
                    已移动的科室的总时长 += 将移动的科室.培训时长;
                    选定教学本院策略下的科室.Insert(0, 将移动的科室);
                    选定教学本院策略下的科室.RemoveAt(科室数量);
                    新第一个最长周期科室index = (新第一个最长周期科室index + 1) % 科室数量;

                } while (最长周期 > 已移动的科室的总时长);

                //如果新的index的周期和原index的周期没有重合,继续循环,否则退出;
                var 新第一个最长周期所占的时间范围 =
                    Enumerable.Range(选定教学本院策略下的科室.Take(新第一个最长周期科室index).Sum(i => i.培训时长), 最长周期).ToList();
                //退出时得到的就是所有的策略的组合列表的一个列表;
                原与新第一个最长周期所占的时间范围是否有重复 =
                    原第一个最长周期所占的时间范围.Any(i => 新第一个最长周期所占的时间范围.Any(j => i == j));

            } while (原与新第一个最长周期所占的时间范围是否有重复 == false);

            var 一个完整轮转容纳人数 = 存放策略组合的列表.Count() * 最小的最大学员人数;
            var 一个完整轮转的总时长 = (int)选定教学本院策略.培训总时长;

            var 学员培训情况 = (await Db.GetListSpAsync<v_教学学员培训情况, 教学学员培训情况Filter>(new 教学学员培训情况Filter()
            {
                WhereIn编号 = data.学员编号列表.ToStringIdWithSpacer()
            })).ToList();

            //只有已报到状态的才能自动安排轮转
            if (学员培训情况.Any(i => i.状态 != 教学学员培训状态.已报到.ToString()))
            {
                throw new Exception("只有已报到且未安排轮转的学员可以被安排轮转");
            }

            //循环每个学员
            var 学员轮转安排列表 = new List<v_教学轮转>();

            //2019-8-19 这里的是优先填满某个科室,再下一个;
            for (int i = 0, length = data.学员编号列表.Count(); i < length; i++)
            {
                //当前学员的index/可重复数的商,再对"存放策略组合的列表"的数量取商取余,余对应元素对总周期*商,就是该学员对应的策略组合

                var 该学员在第几个完整轮转 = i / 一个完整轮转容纳人数; // 下标以0开始

                //对应的策略
                //var 对应的策略 = 存放策略组合的列表[i / 最小的最大学员人数];

                //(i % 一个完整轮转容纳人数)表示这个学员在一个完整轮转里面处于第几个;
                //(i % 一个完整轮转容纳人数) / 最小的最大学员人数,表示用学员先填满一个完整轮转里面的a计划,满了再b计划
                //var 对应的策略 = 存放策略组合的列表[(i % 一个完整轮转容纳人数) / 最小的最大学员人数];

                //(i % 一个完整轮转容纳人数) % 存放策略组合的列表.Count()表示用学员平均放到abc计划里面去.第一个去a,第二个去b,完了再从a开始;
                var 对应的策略 = 存放策略组合的列表[(i % 一个完整轮转容纳人数) % 存放策略组合的列表.Count()];

                //该学员最初的开始结束日期, 要考虑该学员在第几个完整轮转
                var 开始日期 = ((DateTime)data.计划开始培训日期).AddDays(一个完整轮转的总时长 * 该学员在第几个完整轮转 * 7);
                var 结束日期 = ((DateTime)data.计划开始培训日期).AddDays(一个完整轮转的总时长 * 该学员在第几个完整轮转 * 7 - 1);



                for (int j = 0, lengthj = 对应的策略.Count(); j < lengthj; j++)
                {
                    var 教学专业科室对应本院科室关系 = 对应的策略[j];
                    结束日期 = 结束日期.AddDays(教学专业科室对应本院科室关系.培训时长 * 7);
                    var 学员轮转安排 = new v_教学轮转()
                    {
                        编号 = 0,
                        学员编号 = data.学员编号列表[i],
                        学员姓名 = 学员培训情况.Find(k => k.编号 == data.学员编号列表[i]).姓名,
                        计划入科日期 = 开始日期,
                        计划出科日期 = 结束日期,
                        教学本院科室编号 = 教学专业科室对应本院科室关系.编号,
                        教学专业科室编号 = 教学专业科室对应本院科室关系.教学专业科室编号,
                        教学专业科室名称 = 教学专业科室对应本院科室关系.教学专业科室名称,
                        本院科室编号 = 教学专业科室对应本院科室关系.本院科室编号,
                        本院科室名称 = 教学专业科室对应本院科室关系.本院科室名称,
                        科室管理员编号 = 教学专业科室对应本院科室关系.科室管理员编号,
                        科室管理员姓名 = 教学专业科室对应本院科室关系.科室管理员姓名,
                        最低管床数量 = 教学专业科室对应本院科室关系.最低管床数量,
                        最低全程管理数量 = (int)教学专业科室对应本院科室关系.最低全程管理数量
                    };
                    //递增该学员的开始结束日期;
                    开始日期 = 开始日期.AddDays(教学专业科室对应本院科室关系.培训时长 * 7);
                    //结束日期 = 结束日期.AddDays(1);

                    学员轮转安排列表.Add(学员轮转安排);
                }

            }


            //这个策略组合不能马上存库,而是要返给前台,让用户确认甚至修改后再保存;

            //data.学员编号列表.ToList().
            //return 学员轮转安排列表;

            return new
            {
                //total = 学员信息.Count(),
                最小日期 = 学员轮转安排列表.Min(i => (DateTime?)i.计划入科日期),
                最大日期 = 学员轮转安排列表.Max(i => (DateTime?)i.计划出科日期),
                list = from item in 学员培训情况
                       select new
                       {
                           学员信息 = item,
                           轮转信息 = from item2 in 学员轮转安排列表 where item2.学员编号 == item.编号 select item2
                       }
            };
        }

        //class 学员最小开始和最大结束计划培训时间
        //{
        //    public int 学员编号 { get; set; }
        //    public DateTime 最小计划入科日期 { get; set; }
        //    public DateTime 最大计划出科日期 { get; set; }
        //}

        /// <summary>
        /// 1 更新相应学员的计划开始结束培训日期
        /// 2 如果是增加,那每个教学轮转的任务要添加
        /// 但是没有考虑原来是a科室,改为b科室后相应任务的变换
        /// 3 增改教学轮转基本信息
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改教学轮转([FromBody]IEnumerable<教学轮转> data)
        {
            var 要更新的v轮转 = await Db.GetListSpAsync<v_教学轮转, v_教学轮转Filter>(new v_教学轮转Filter()
            {
                WhereIn编号 = data.Where(i => i.编号 != 0).Select(j => j.编号).ToStringIdWithSpacer()
            });

            if (要更新的v轮转.Any(i => i.状态 == 教学轮转状态.已出科.ToString()))
            {
                throw new Exception("已出科的轮状不能再修改");
            }

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //await 更新教学学员培训计划日期(data, dbForTransaction, transaction, false);

                var 将增加的教学轮转任务列表 = new List<教学轮转任务>();
                foreach (var item in data.Where(i => i.编号 == 0))
                {
                    //如果是新增一个教学轮转,则需要同时新增其相应的任务;
                    var 新增的教学轮转 = await dbForTransaction.Merge(item, transaction);
                    var 新增的教学轮转对应的本院科室任务列表 =
                        await dbForTransaction.GetListSpAsync<教学本院科室任务, 教学本院科室任务Filter>
                        (new 教学本院科室任务Filter()
                        {
                            教学本院科室编号 = item.教学本院科室编号
                        }, transaction: transaction);

                    foreach (var 新增的教学轮转对应的本院科室任务 in 新增的教学轮转对应的本院科室任务列表)
                    {
                        var 将增加的教学轮转任务 = new 教学轮转任务()
                        {
                            编号 = 0,
                            教学轮转编号 = 新增的教学轮转.编号,
                            项目名称 = 新增的教学轮转对应的本院科室任务.项目名称,
                            任务类型编号 = 新增的教学轮转对应的本院科室任务.任务类型编号,
                            是否门诊 = 新增的教学轮转对应的本院科室任务.是否门诊,
                            是否病房 = 新增的教学轮转对应的本院科室任务.是否病房,
                            是否医技 = 新增的教学轮转对应的本院科室任务.是否医技,
                            最低评分要求 = 新增的教学轮转对应的本院科室任务.最低评分要求,
                            数量要求 = 新增的教学轮转对应的本院科室任务.数量要求,
                            备注 = 新增的教学轮转对应的本院科室任务.备注,
                        };
                        将增加的教学轮转任务列表.Add(将增加的教学轮转任务);
                    }
                }
                await dbForTransaction.Merge(将增加的教学轮转任务列表.AsEnumerable(), transaction);

                //修改的,能否修改?能否修改科室?是否相应修改任务?
                await dbForTransaction.Merge(data.Where(i => i.编号 != 0), transaction);

            }
            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 2019-7-1 因为表"教学学员培训"中的"计划开始培训日期 和 计划结束培训日期"被移到了"v_教学学员培训情况"中计算而得到,
        /// 所以这里就不需要这个过程了
        /// </summary>
        /// <param name="data"></param>
        /// <param name="dbForTransaction"></param>
        /// <param name="transaction"></param>
        /// <param name="是否最终结果">真:传入的是最终的轮转数据,假:传入的是新增的部分轮转数据</param>
        /// <returns></returns>
        //private static async Task 更新教学学员培训计划日期(
        //    IEnumerable<教学轮转> data,
        //    SqlConnection dbForTransaction,
        //    SqlTransaction transaction,
        //    bool 是否最终结果)
        //{
        //    var 按学员分组的教学轮转 = from item in data
        //                     group item by item.学员编号 into g
        //                     select new 学员最小开始和最大结束计划培训时间()
        //                     {
        //                         学员编号 = g.Key,
        //                         最小计划入科日期 = g.Min(i => (DateTime)i.计划入科日期),
        //                         最大计划出科日期 = g.Max(i => (DateTime)i.计划出科日期)
        //                     };

        //    var 将要更新的教学学员培训列表 = await dbForTransaction.GetListSpAsync<教学学员培训, 教学学员培训情况Filter>
        //        (new 教学学员培训情况Filter()
        //        {
        //            WhereIn编号 = 按学员分组的教学轮转.Select(i => i.学员编号).ToStringIdWithSpacer()
        //        }, transaction: transaction);

        //    await dbForTransaction.Merge(将要更新的教学学员培训列表.Select(i =>
        //    {
        //        var 某学员最小开始和最大结束计划培训时间 = 按学员分组的教学轮转.Where(j => j.学员编号 == i.编号).FirstOrDefault();

        //        if (是否最终结果 == true)
        //        {
        //            i.计划开始培训日期 = 某学员最小开始和最大结束计划培训时间.最小计划入科日期;
        //            i.计划结束培训日期 = 某学员最小开始和最大结束计划培训时间.最大计划出科日期;
        //        }
        //        else
        //        {
        //            if (i.计划开始培训日期 == null || i.计划开始培训日期 > 某学员最小开始和最大结束计划培训时间.最小计划入科日期)
        //            {
        //                i.计划开始培训日期 = 某学员最小开始和最大结束计划培训时间.最小计划入科日期;
        //            }

        //            if (i.计划结束培训日期 == null || i.计划结束培训日期 < 某学员最小开始和最大结束计划培训时间.最大计划出科日期)
        //            {
        //                i.计划结束培训日期 = 某学员最小开始和最大结束计划培训时间.最大计划出科日期;
        //            }
        //        }

        //        return i;
        //    }), transaction);
        //}

        /// <summary>
        /// data是状态为"轮转计划已安排"的学员编号数组
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 删除学员教学轮转安排([FromBody]IEnumerable<int> data)
        {
            var 要删除的学员培训情况 = await Db.GetListSpAsync<v_教学学员培训情况, 教学学员培训情况Filter>(new 教学学员培训情况Filter()
            {
                WhereIn编号 = data.ToStringIdWithSpacer()
            });

            //如果有任何一个的状态不是"已安排轮转计划"则不能删除
            if (要删除的学员培训情况.Any(i => i.状态 != 教学学员培训状态.轮转计划已安排.ToString()))
            {
                throw new Exception("只有已安排轮转计划且没有实际入科的学员才能撤销轮转安排");
            }

            var 要删除的学员的所有轮转 = await Db.GetListSpAsync<教学轮转, v_教学轮转Filter>(new v_教学轮转Filter()
            {
                WhereIn学员编号 = data.ToStringIdWithSpacer()
            });

            //var 要删除的学员培训 = new List<教学学员培训>();
            //foreach (var item in 要删除的学员培训情况)
            //{
            //    var 对应的学员培训 = Tool.ModelToModel<v_教学学员培训情况, 教学学员培训>(item);
            //    对应的学员培训.计划开始培训日期 = null;
            //    对应的学员培训.计划结束培训日期 = null;
            //    要删除的学员培训.Add(对应的学员培训);
            //}

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //await dbForTransaction.Merge(要删除的学员培训.AsEnumerable(), transaction: transaction);
                await dbForTransaction.Delete<教学轮转>(要删除的学员的所有轮转.Select(i => i.编号), transaction: transaction);
            }
            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 为什么要单独删除,而不是传入某学员轮转的最终安排,后台删除不在传入的数据呢?
        /// 1 可能传入很多人的教学轮转
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 批量删除教学轮转([FromBody]IEnumerable<int> data)
        {
            var 要删除的教学轮转 = await Db.GetListSpAsync<v_教学轮转, v_教学轮转Filter>(new v_教学轮转Filter()
            {
                WhereIn编号 = data.ToStringIdWithSpacer()
            });

            if (要删除的教学轮转.Any(i => i.状态 != 教学轮转状态.未入科.ToString()))
            {
                throw new Exception("只有未入科的轮转才能被删除");
            }

            var 要删除轮转的学员编号 = 要删除的教学轮转.Select(i => i.学员编号).Distinct();

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {

                await dbForTransaction.Delete<教学轮转>(data, transaction);

                //var 删除之后的这些学员的教学轮转 = await dbForTransaction.GetListSpAsync<教学轮转, 教学轮转Filter>(new 教学轮转Filter()
                //{
                //    WhereIn学员编号 = 要删除轮转的学员编号.ToStringIdWithSpacer()
                //}, transaction: transaction);

                //await 更新教学学员培训计划日期(删除之后的这些学员的教学轮转, dbForTransaction, transaction, true);
            }
            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 增改教学轮转任务([FromBody]IEnumerable<教学轮转任务> data) =>
            await Db.Merge(data);

        [HttpPost]
        async public Task 批量删除教学轮转任务([FromBody]IEnumerable<int> data) =>
            await Db.Delete<教学轮转任务>(data);

        /// <summary>
        /// 这个估计用不到
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        //[HttpGet]
        //async public Task<object> 分页获取教学轮转(Paging paging, 教学轮转Filter filter) =>
        //    await Db.GetPagingListSpAsync<v_教学轮转, 教学轮转Filter>(paging, filter);

        /// <summary>
        /// 看某个学员的所有轮转
        /// </summary>
        /// <param name="学员编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某学员的教学轮转([Required]int 学员编号) =>
            await Db.GetListSpAsync<v_教学轮转, v_教学轮转Filter>(new v_教学轮转Filter() { 学员编号 = 学员编号 }, orderType: true);

        /// <summary>
        /// 通过"tfn_我的学员":
        /// 学员可以看到自己的轮转;
        /// 医院管理员可以看到所有;
        /// 科室管理员可以看到自己管理的科室相关轮转的轮转;
        /// 带教老师可以看到自己带教的轮转的轮转
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<object> 分页获取我的学员的教学轮转(Paging paging, 教学学员培训情况Filter filter)
        {
            var 分页的学员 = await Db.GetPagingListSpAsync<v_教学学员培训情况, 教学学员培训情况Filter>
                (paging, filter, $"tfn_我的学员('{CurrentUser.人员类型}',{CurrentUser.编号})");

            var 学员的轮转 = await Db.GetListSpAsync<v_教学轮转, v_教学轮转Filter>(new v_教学轮转Filter()
            {
                WhereIn学员编号 = 分页的学员.list.Select(i => i.编号).ToStringIdWithSpacer()
            }, $"tfn_我的轮转('{CurrentUser.人员类型}',{CurrentUser.编号})", orderType: true, orderStr: nameof(v_教学轮转.计划入科日期));

            return new
            {
                分页的学员.total,
                最小日期 = 学员的轮转.Min(i => (DateTime?)i.计划入科日期),
                最大日期 = 学员的轮转.Max(i => (DateTime?)i.计划出科日期),
                list = from item in 分页的学员.list
                       select new
                       {
                           学员信息 = item,
                           轮转信息 = from item2 in 学员的轮转 where item2.学员编号 == item.编号 select item2
                       }
            };
        }

        [HttpGet]
        public async Task<object> 按科室统计轮转([Required]DateTime beginDate, [Required]DateTime endDate)
        {
            var 教学科室 = await Db.GetListSpAsync<v_教学科室, 教学科室Filter>(new 教学科室Filter() { 是否教学科室 = true });

            var 按科室统计轮转的结果 = await Db.QuerySpAsync<sp_教学按科室统计轮转, 按科室统计轮转的结果>(new sp_教学按科室统计轮转()
            {
                beginDate = beginDate,
                endDate = endDate
            });

            return from item in 教学科室
                   select new
                   {
                       教学科室 = item,
                       统计轮转的结果 = new
                       {
                           未入科 = from item统计 in 按科室统计轮转的结果
                                 where item统计.本院科室编号 == item.编号 && item统计.状态 == 教学轮转状态.未入科.ToString()
                                 select new
                                 {
                                     日期 = item统计.日期.ToShortDateString(),
                                     item统计.人数
                                 },
                           在科 = from item统计 in 按科室统计轮转的结果
                                where item统计.本院科室编号 == item.编号 && item统计.状态 == 教学轮转状态.在科.ToString()
                                select new
                                {
                                    日期 = item统计.日期.ToShortDateString(),
                                    item统计.人数
                                },
                           已出科 = from item统计 in 按科室统计轮转的结果
                                 where item统计.本院科室编号 == item.编号 && item统计.状态 == 教学轮转状态.已出科.ToString()
                                 select new
                                 {
                                     日期 = item统计.日期.ToShortDateString(),
                                     item统计.人数
                                 }
                       }
                   };
        }

        [HttpGet]
        async public Task<object> 分页获取教学补轮转(Paging paging, v_教学补轮转Filter filter) =>
            await Db.GetPagingListSpAsync<v_教学补轮转, v_教学补轮转Filter>(paging, filter);

        /// <summary>
        /// 教学补轮转
        /// 在某个未入科或者在科的教学轮转上增加计划出科日期;
        /// 1 相应学员的教学培训的计划结束培训日期会相应增加
        /// 2 该教学轮转的计划出科日期会增加;
        /// 3 该学员该教学轮转之后的轮转的计划入科和出科日期会增加;
        /// 4 会记录此补轮转日志;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 补轮转([FromBody]补轮转 data)
        {
            var 要补轮转的教学轮转视图 = await Db.GetModelByIdSpAsync<v_教学轮转>(data.教学轮转编号);
            if (要补轮转的教学轮转视图.编号 == 0)
            {
                throw new Exception("没有找到该轮转");
            }
            if (要补轮转的教学轮转视图.状态 == 教学轮转状态.已出科.ToString())
            {
                throw new Exception("已出科轮转 不能补轮转");
            }
            var 要补轮转的教学轮转 = MyLib.Tool.ModelToModel<v_教学轮转, 教学轮转>(要补轮转的教学轮转视图);

            var 将连带受到影响的教学轮转 = await Db.GetListSpAsync<教学轮转, v_教学轮转Filter>(new v_教学轮转Filter()
            {
                学员编号 = 要补轮转的教学轮转.学员编号,
                Begin计划入科日期 = 要补轮转的教学轮转.计划出科日期
            });

            var 将受到影响的教学轮转 = new List<教学轮转>();
            要补轮转的教学轮转.计划出科日期 = ((DateTime)要补轮转的教学轮转.计划出科日期).AddDays(data.补轮转天数);
            将受到影响的教学轮转.Add(要补轮转的教学轮转);

            foreach (var item in 将连带受到影响的教学轮转.Select(i =>
            {
                i.计划入科日期 = ((DateTime)i.计划入科日期).AddDays(data.补轮转天数);
                i.计划出科日期 = ((DateTime)i.计划出科日期).AddDays(data.补轮转天数);
                return i;
            }).ToList())
            {
                将受到影响的教学轮转.Add(item);
            };

            //var 将受影响的教学学员培训 = await Db.GetModelByIdSpAsync<教学学员培训>(要补轮转的教学轮转视图.学员编号);
            //将受影响的教学学员培训.计划结束培训日期 = ((DateTime)将受影响的教学学员培训.计划结束培训日期).AddDays(data.补轮转天数);

            var 教学补轮转 = new 教学补轮转()
            {
                编号 = 0,
                教学轮转编号 = data.教学轮转编号,
                说明 = data.说明,
                开始日期 = 要补轮转的教学轮转视图.计划出科日期.AddDays(1),
                结束日期 = 要补轮转的教学轮转视图.计划出科日期.AddDays(data.补轮转天数),
                建立人 = CurrentUser.编号,
                建立时间 = DateTime.Now,
                备注 = null
            };

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //await dbForTransaction.Merge(将受影响的教学学员培训, transaction);
                await dbForTransaction.Merge(将受到影响的教学轮转.AsEnumerable(), transaction);
                await dbForTransaction.Merge(教学补轮转, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 各自只能看到自己可以看到的学员的成绩
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取我的学员的教学考试成绩(Paging paging, v_tfn_教学考试成绩Filter filter)
        {
            filter.NotEqual状态 = 教学轮转状态.未入科.ToString();
            return await Db.GetPagingListSpAsync<v_tfn_教学考试成绩, v_tfn_教学考试成绩Filter>
               (paging, filter, $"tfn_教学考试成绩('{CurrentUser.人员类型}',{CurrentUser.编号})");
        }

        /// <summary>
        /// 针对一个轮转来记录;
        /// 一个轮转只有一条考试成绩
        /// 考试成绩的编号就是轮转的编号
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改教学考试成绩([FromBody]教学考试成绩 data)
        {
            var 轮转情况 = await Db.GetModelByIdSpAsync<v_教学轮转>(data.编号);
            if (轮转情况.状态 == 教学轮转状态.未入科.ToString())
            {
                throw new Exception("未入科的轮转不能填写考试成绩");
            }
            await Db.Merge(data);
        }

        /// <summary>
        /// 通过"tfn_我的轮转":
        /// 学员可以看到自己的教学医疗差错及事故记录;
        /// 医院管理员可以看到所有;
        /// 科室管理员可以看到自己管理的科室相关轮转的教学医疗差错及事故记录;
        /// 带教老师可以看到自己带教的轮转的教学医疗差错及事故记录
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取我的学员的教学医疗差错及事故记录(Paging paging, v_tfn_教学医疗差错及事故记录Filter filter) =>
            await Db.GetPagingListSpAsync<v_tfn_教学医疗差错及事故记录, v_tfn_教学医疗差错及事故记录Filter>
            (paging, filter, $"tfn_教学医疗差错及事故记录('{CurrentUser.人员类型}',{CurrentUser.编号})");

        /// <summary>
        /// 针对一个轮转来记录;
        /// 一个轮转可以有多次该记录
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改教学医疗差错及事故记录([FromBody]教学医疗差错及事故记录 data)
        {
            var v教学轮转 = await Db.GetModelByIdSpAsync<v_教学轮转>(data.教学轮转编号);
            if (v教学轮转.状态 == 教学轮转状态.未入科.ToString())
            {
                throw new Exception("未入科轮转不能添加医疗差错及事故记录");
            }

            await Db.Merge(data);
        }

        [HttpPost]
        async public Task<object> 上传教学医疗差错及事故记录附件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/教学/培训/教学医疗差错及事故记录附件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        /// <summary>
        /// 也应该是从一个轮转图点进来
        /// 该学员该轮转之前的轮转都出科,才能入科
        /// 该轮转未入科,才能入科
        /// 当前时间小于计划入科日期,不能入科
        /// 当前时间大于计划出科日期,不能入科,提示去延期;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 学员入科([FromBody]学员入科 data)
        {

            var 要入科的轮转视图 = await Db.GetModelByIdSpAsync<v_教学轮转>(data.教学轮转编号);
            if (要入科的轮转视图 == null)
            {
                throw new Exception("没有找到该教学轮转");
            }

            //if(要入科的轮转视图.科室管理员编号 != CurrentUser.编号)
            //{
            //    throw new Exception("科室管理员才能操作入科");
            //}

            if (要入科的轮转视图.状态 != 教学轮转状态.未入科.ToString())
            {
                throw new Exception("该教学轮转已入科");
            }

            if (DateTime.Now < 要入科的轮转视图.计划入科日期)
            {
                throw new Exception("还未到入科日期");
            }

            if (要入科的轮转视图.计划出科日期 < DateTime.Now)
            {
                throw new Exception("已超过该教学轮转计划出科日期,请申请补轮转或修改轮转计划");
            }

            var 该学员所有的轮转 = await Db.GetListSpAsync<v_教学轮转, v_教学轮转Filter>(new v_教学轮转Filter()
            {
                学员编号 = 要入科的轮转视图.学员编号
            });

            if (该学员所有的轮转
                .Where(i => i.计划出科日期 < 要入科的轮转视图.计划入科日期)
                .Any(j => j.状态 != 教学轮转状态.已出科.ToString()))
            {
                throw new Exception("该教学轮转之前还有未出科的轮转");
            }

            要入科的轮转视图.实际入科日期 = DateTime.Now;
            要入科的轮转视图.带教老师编号 = data.带教老师编号;

            var 要入科的轮转 = MyLib.Tool.ModelToModel<v_教学轮转, 教学轮转>(要入科的轮转视图);
            await Db.Merge(要入科的轮转);

            //如果是第一个入科,那么学员培训情况的实际入科时间要修改
            if (该学员所有的轮转.All(i => i.状态 == 教学轮转状态.未入科.ToString()))
            {
                var 教学学员培训情况 = await Db.GetModelByIdSpAsync<教学学员培训>(要入科的轮转.学员编号);
                教学学员培训情况.实际开始培训日期 = DateTime.Now;
                await Db.Merge(教学学员培训情况);
            }
        }

        /// <summary>
        /// 通过"tfn_我的轮转":
        /// 学员可以看到自己的更换带教老师记录;
        /// 医院管理员可以看到所有;
        /// 科室管理员可以看到自己管理的科室相关轮转的更换老师记录;
        /// 带教老师可以看到自己带教的轮转的更换老师记录
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取我的教学更换带教老师(Paging paging, v_tfn_教学更换带教老师Filter filter) =>
            await Db.GetPagingListSpAsync<v_tfn_教学更换带教老师, v_tfn_教学更换带教老师Filter>
            (paging, filter, $"tfn_教学更换带教老师('{CurrentUser.人员类型}',{CurrentUser.编号})");

        /// <summary>
        /// 在科的轮转才能更换带教老师
        /// 1111
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改教学更换带教老师([FromBody]教学更换带教老师 data)
        {
            var v教学轮转 = await Db.GetModelByIdSpAsync<v_教学轮转>(data.教学轮转编号);
            if (v教学轮转.状态 != 教学轮转状态.在科.ToString())
            {
                throw new Exception("在科的轮转才能更换带教老师");
            }
            //await Db.Merge(data);

            var 教学轮转 = Tool.ModelToModel<v_教学轮转, 教学轮转>(v教学轮转);
            教学轮转.带教老师编号 = data.新带教老师编号;

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await dbForTransaction.Merge(data, transaction: transaction);
                await dbForTransaction.Merge(教学轮转, transaction: transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 考勤的可选类型
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<object> 获取教学考勤类型()
        {
            return await Db.GetListSpAsync<教学考勤类型>();
        }

        /// <summary>
        /// 这个统计时针对时间范围内所有轮转来的,而不是某科室管理员只看自己科室的学员的考勤统计;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <param name="开始日期"></param>
        /// <param name="结束日期"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<object> 分页获取我的学员的考勤统计(
            Paging paging,
            教学学员培训情况Filter filter,
            [Required]DateTime 开始日期,
            [Required]DateTime 结束日期)
        {
            var 分页的学员 = await Db.GetPagingListSpAsync<v_教学学员培训情况, 教学学员培训情况Filter>
                (paging, filter, $"tfn_我的学员('{CurrentUser.人员类型}',{CurrentUser.编号})");

            var 学员的考勤统计 = await Db.QuerySpAsync<sp_教学考勤统计, v_sp_教学考勤统计>(new sp_教学考勤统计()
            {
                学员编号列表 = 分页的学员.list.Select(i => i.编号).ToPredefindedKeyFieldsList().ToDataTable(),
                开始日期 = 开始日期,
                结束日期 = 结束日期
            });

            return new
            {
                分页的学员.total,
                list = from item in 分页的学员.list
                       select new
                       {
                           学员信息 = item,
                           考勤统计 = ((from item2 in 学员的考勤统计 where item2.编号 == item.编号 select item2).FirstOrDefault())
                           ?? new v_sp_教学考勤统计()
                       }
            };
        }

        /// <summary>
        /// 这个不是统计
        /// </summary>
        /// <param name="教学轮转编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某教学轮转的考勤(int 教学轮转编号)
        {
            var 教学轮转 = await Db.GetModelByIdSpAsync<v_教学轮转>(教学轮转编号);
            var 教学考勤情况列表 = await Db.GetListSpAsync<v_教学考勤情况, 教学考勤情况Filter>(new 教学考勤情况Filter()
            {
                教学轮转编号 = 教学轮转编号
            });

            return new { 教学轮转, 教学考勤情况列表 };
        }

        /// <summary>
        /// id是轮转id
        /// 考勤日期指哪一天的考勤.必须在该轮转的开始结束日期之内;
        /// TODO:这里是否应该加上对打考勤的人的判断??还是应该放到别处???
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改教学考勤情况([FromBody]PredefindedIdList<教学考勤情况> data)
        {
            var 教学轮转 = await Db.GetModelByIdSpAsync<教学轮转>(data.Id);
            if (data.List.Any(i => i.考勤日期 < 教学轮转.实际入科日期 || i.考勤日期 > 教学轮转.计划出科日期))
            {
                throw new Exception("考勤日期不能超出该轮转的计划开始/结束日期范围");
            }

            if (data.List.GroupBy(i => i.考勤日期).Any(j => j.Count() > 1))
            {
                throw new Exception("不能对同一天多次打考勤");
            }
            await Db.Merge(data.Id, data.List);
        }

        [HttpGet]
        async public Task<object> 获取某教学学员档案([Required] int 学员编号)
        {
            #region 2019-8-5 之前的
            //var 培训情况 = await Db.GetModelByIdSpAsync<v_教学学员培训情况>(学员编号);

            //var 轮转 = await Db.GetListSpAsync<v_教学轮转, v_教学轮转Filter>(
            //    new v_教学轮转Filter() { 学员编号 = 学员编号 },
            //    orderStr: nameof(教学轮转.计划入科日期),
            //    orderType: true);

            //var 更换带教老师 = await Db.GetListSpAsync<v_tfn_教学更换带教老师, v_tfn_教学更换带教老师Filter>(
            //    new v_tfn_教学更换带教老师Filter() { 学员编号 = 学员编号 },
            //$"tfn_教学更换带教老师('{CurrentUser.人员类型}',{CurrentUser.编号})");

            //var 补轮转 = await Db.GetListSpAsync<v_教学补轮转, v_教学补轮转Filter>(new v_教学补轮转Filter() { 学员编号 = 学员编号 });

            //var 学员编号列表 = new List<int>() { 学员编号 };
            //var 考勤统计 = await Db.QuerySpAsync<sp_教学考勤统计, v_sp_教学考勤统计>(new sp_教学考勤统计()
            //{
            //    学员编号列表 = 学员编号列表.ToPredefindedKeyFieldsList().ToDataTable(),
            //    开始日期 = 培训情况.计划开始培训日期??DateTime.Now,
            //    结束日期 = 培训情况.计划结束培训日期??DateTime.Now
            //});

            //var 出科申请 = await Db.GetListSpAsync<v_tfn_教学出科申请, v_tfn_教学出科申请Filter>
            //    (new v_tfn_教学出科申请Filter() { 学员编号 = 学员编号 },
            //    $"tfn_教学出科申请('{CurrentUser.人员类型}',{CurrentUser.编号})");

            //var 请假申请 = await Db.GetListSpAsync<v_tfn_教学请假申请, v_tfn_教学请假申请Filter>
            //    (new v_tfn_教学请假申请Filter() { 学员编号 = 学员编号 },
            //    $"tfn_教学请假申请('{CurrentUser.人员类型}',{CurrentUser.编号})");

            //var 考试成绩 = await Db.GetListSpAsync<v_tfn_教学考试成绩, v_tfn_教学考试成绩Filter>
            //   (new v_tfn_教学考试成绩Filter() { 学员编号 = 学员编号 },
            //   $"tfn_教学考试成绩('{CurrentUser.人员类型}',{CurrentUser.编号})");

            //var 医疗差错及事故记录 = await Db.GetListSpAsync<v_tfn_教学医疗差错及事故记录, v_tfn_教学医疗差错及事故记录Filter>
            //    (new v_tfn_教学医疗差错及事故记录Filter() { 学员编号 = 学员编号 },
            //    $"tfn_教学医疗差错及事故记录('{CurrentUser.人员类型}',{CurrentUser.编号})");

            //var 管床病人 = await Db.GetListSpAsync<v_tfn_教学管床病人, v_tfn_教学管床病人Filter>
            //     (new v_tfn_教学管床病人Filter() { 学员编号 = 学员编号 },
            //    $"tfn_教学管床病人('{CurrentUser.人员类型}',{CurrentUser.编号})");

            //var 轮转手册 = await Db.GetListSpAsync<v_tfn_教学轮转手册申请, v_tfn_教学轮转手册申请Filter>
            //    (new v_tfn_教学轮转手册申请Filter() { 学员编号 = 学员编号 },
            //    $"tfn_教学轮转手册申请('{CurrentUser.人员类型}',{CurrentUser.编号})");


            ////这里没有给出活动信息,而是该学员的活动反馈
            //var 教学活动反馈 =await Db.GetListSpAsync<v_教学活动反馈, v_教学活动反馈Filter>(new v_教学活动反馈Filter() { 学员编号 = 学员编号 });

            //var 结业申请 = await Db.GetListSpAsync<v_tfn_教学结业申请, v_tfn_教学结业申请Filter>
            //    (new v_tfn_教学结业申请Filter() { 学员编号 = 学员编号 },
            //    $"tfn_教学结业申请('{CurrentUser.人员类型}',{CurrentUser.编号})");

            //var 退培申请 = await Db.GetListSpAsync<v_tfn_教学退培申请, v_tfn_教学退培申请Filter>
            //    (new v_tfn_教学退培申请Filter() { 学员编号 = 学员编号 },
            //    $"tfn_教学退培申请('{CurrentUser.人员类型}',{CurrentUser.编号})");

            //return new {
            //    培训情况,
            //    轮转,
            //    //下面的都应该挂载到具体的轮转里面
            //    更换带教老师,
            //    补轮转,
            //    考勤统计,
            //    出科申请,
            //    请假申请,
            //    考试成绩,
            //    医疗差错及事故记录,
            //    管床病人,
            //    轮转手册,

            //    教学活动反馈,
            //    结业申请,
            //    退培申请
            //};
            #endregion
            return await 教学学员.获取某教学学员档案(Db, 学员编号);
        }
    }
}