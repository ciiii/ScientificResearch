using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    public class TeachingManagementController : TeachingManagementBaseController
    {
        /// <summary>
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
            return await Db.GetPagingListSpAsync<v_教学学员培训情况, 教学学员培训情况Filter>(paging, filter, $"tfn_我的学员({CurrentUser.编号})");
        }

        /// <summary>
        /// 注意:Null报到时间 = true是所有未报到的学员; = false 是所有已报到的学员;
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
                (new 教学本院科室Filter() { 教学本院策略编号 = data.教学本院策略编号 }, orderStr: nameof(v_教学本院科室.排序值), orderType: true)).ToList();
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

            //循环每个学员
            var 学员轮转安排列表 = new List<v_教学轮转>();
            for (int i = 0, length = data.学员编号列表.Count(); i < length; i++)
            {
                //当前学员的index/可重复数的商,再对"存放策略组合的列表"的数量取商取余,余对应元素对总周期*商,就是该学员对应的策略组合

                var 该学员在第几个完整轮转 = i / 一个完整轮转容纳人数; // 下标以0开始

                //对应的策略
                var 对应的策略 = 存放策略组合的列表[i / 最小的最大学员人数];

                //该学员最初的开始结束日期, 要考虑该学员在第几个完整轮转
                var 开始日期 = ((DateTime)data.计划开始培训日期).AddDays(一个完整轮转的总时长 * 该学员在第几个完整轮转 * 7);
                var 结束日期 = ((DateTime)data.计划开始培训日期).AddDays(一个完整轮转的总时长 * 该学员在第几个完整轮转 * 7 - 1);

                var 学员信息 = (await Db.GetListSpAsync<v_教学学员, 教学学员Filter>(new 教学学员Filter() {
                    WhereIn编号 = data.学员编号列表.ToStringIdWithSpacer()
                })).ToList();

                for (int j = 0, lengthj = 对应的策略.Count(); j < lengthj; j++)
                {
                    var 当下的科室 = 对应的策略[j];
                    结束日期 = 结束日期.AddDays(当下的科室.培训时长 * 7);
                    var 学员轮转安排 = new v_教学轮转()
                    {
                        编号 = 0,
                        学员编号 = data.学员编号列表[i],
                        学员姓名 = 学员信息.Find(k=>k.编号 == data.学员编号列表[i]).姓名,
                        计划入科日期 = 开始日期,
                        计划出科日期 = 结束日期,
                        本院科室编号 = 当下的科室.本院科室编号,
                        本院科室名称 = 当下的科室.本院科室名称,
                        科室管理员编号 = 当下的科室.科室管理员编号,
                        科室管理员姓名 = 当下的科室.科室管理员姓名,
                        最低管床数量 = 当下的科室.最低管床数量,
                        最低全程管理数量 = (int)当下的科室.最低全程管理数量
                    };
                    //递增该学员的开始结束日期;
                    开始日期 = 开始日期.AddDays(当下的科室.培训时长 * 7 );    
                    //结束日期 = 结束日期.AddDays(1);

                    学员轮转安排列表.Add(学员轮转安排);
                }
                
            }
            //这个策略组合不能马上存库,而是要返给前台,让用户确认甚至修改后再保存;

            //data.学员编号列表.ToList().
            return 学员轮转安排列表;
        }

        /// <summary>
        /// 这个还有其他很多事情要处理
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改教学轮转([FromBody]IEnumerable<教学轮转> data) =>
            await Db.Merge(data);
    }
}