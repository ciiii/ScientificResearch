using System;
using System.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using ScientificResearch.Infrastucture;
using System.Threading.Tasks;
using System.Collections.Generic;
using MyLib;
using System.Linq;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 教学学员[类]
    /// </summary>
    public partial class 教学学员
    {
        /// <summary>
        /// 2019-8-5 原来还要传入个"人员类型",但如果只是看一个学员的,可以固定为"教学学员"
        /// </summary>
        /// <param name="Db"></param>
        /// <param name="学员编号"></param>
        /// <returns></returns>
        async public static Task<object> 获取某教学学员档案(IDbConnection Db, int 学员编号)
        {
            var 人员类型 = nameof(教学学员);

            var 基本信息 = await Db.GetModelByIdSpAsync<v_教学学员>(学员编号);

            var 培训情况 = await Db.GetModelByIdSpAsync<v_教学学员培训情况>(学员编号);

            var 轮转 = await Db.GetListSpAsync<v_教学轮转_任务完成情况, v_教学轮转Filter>(
                new v_教学轮转Filter() { 学员编号 = 学员编号 },
                orderStr: nameof(教学轮转.计划入科日期),
                orderType: true);

            var 更换带教老师 = await Db.GetListSpAsync<v_tfn_教学更换带教老师, v_tfn_教学更换带教老师Filter>(
                new v_tfn_教学更换带教老师Filter() { 学员编号 = 学员编号 },
            $"tfn_教学更换带教老师('{人员类型}',{学员编号})");

            var 补轮转 = await Db.GetListSpAsync<v_教学补轮转, v_教学补轮转Filter>(new v_教学补轮转Filter() { 学员编号 = 学员编号 });

            var 学员编号列表 = new List<int>() { 学员编号 };
            var 考勤统计 = await Db.QuerySpAsync<sp_教学考勤统计, v_sp_教学考勤统计>(new sp_教学考勤统计()
            {
                学员编号列表 = 学员编号列表.ToPredefindedKeyFieldsList().ToDataTable(),
                开始日期 = 培训情况.计划开始培训日期 ?? DateTime.Now,
                结束日期 = 培训情况.计划结束培训日期 ?? DateTime.Now
            });

            var 出科申请 = await Db.GetListSpAsync<v_tfn_教学出科申请, v_tfn_教学出科申请Filter>
                (new v_tfn_教学出科申请Filter() { 学员编号 = 学员编号 },
                $"tfn_教学出科申请('{人员类型}',{学员编号})");

            var 请假申请 = await Db.GetListSpAsync<v_tfn_教学请假申请, v_tfn_教学请假申请Filter>
                (new v_tfn_教学请假申请Filter() { 学员编号 = 学员编号 },
                $"tfn_教学请假申请('{人员类型}',{学员编号})");

            var 考试成绩 = await Db.GetListSpAsync<v_tfn_教学考试成绩, v_tfn_教学考试成绩Filter>
               (new v_tfn_教学考试成绩Filter() { 学员编号 = 学员编号 },
               $"tfn_教学考试成绩('{人员类型}',{学员编号})");

            var 医疗差错及事故记录 = await Db.GetListSpAsync<v_tfn_教学医疗差错及事故记录, v_tfn_教学医疗差错及事故记录Filter>
                (new v_tfn_教学医疗差错及事故记录Filter() { 学员编号 = 学员编号 },
                $"tfn_教学医疗差错及事故记录('{人员类型}',{学员编号})");

            var 管床病人 = await Db.GetListSpAsync<v_tfn_教学管床病人, v_tfn_教学管床病人Filter>
                 (new v_tfn_教学管床病人Filter() { 学员编号 = 学员编号 },
                $"tfn_教学管床病人('{人员类型}',{学员编号})");

            var 轮转手册 = await Db.GetListSpAsync<v_tfn_教学轮转手册申请, v_tfn_教学轮转手册申请Filter>
                (new v_tfn_教学轮转手册申请Filter() { 学员编号 = 学员编号 },
                $"tfn_教学轮转手册申请('{人员类型}',{学员编号})");


            //这里没有给出活动信息,而是该学员的活动反馈
            var 教学活动反馈 = await Db.GetListSpAsync<v_教学活动反馈, v_教学活动反馈Filter>(new v_教学活动反馈Filter() { 学员编号 = 学员编号 });

            var 结业申请 = await Db.GetListSpAsync<v_tfn_教学结业申请, v_tfn_教学结业申请Filter>
                (new v_tfn_教学结业申请Filter() { 学员编号 = 学员编号 },
                $"tfn_教学结业申请('{人员类型}',{学员编号})");

            var 退培申请 = await Db.GetListSpAsync<v_tfn_教学退培申请, v_tfn_教学退培申请Filter>
                (new v_tfn_教学退培申请Filter() { 学员编号 = 学员编号 },
                $"tfn_教学退培申请('{人员类型}',{学员编号})");

            //return new
            //{
            //    基本信息,
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
            return new
            {
                基本信息,
                培训情况,

                轮转 = from item in 轮转 select new {
                    轮转基本信息 = item,
                    更换带教老师 = 更换带教老师.Where(i=>i.教学轮转编号 == item.编号),
                    补轮转 = 补轮转.Where(i => i.教学轮转编号 == item.编号),
                    出科申请 = 出科申请.Where(i => i.教学轮转编号 == item.编号),
                    请假申请 = 请假申请.Where(i => i.教学轮转编号 == item.编号),
                    考试成绩 = 考试成绩.Where(i=>i.编号 == item.编号).FirstOrDefault(),
                    医疗差错及事故记录 = 医疗差错及事故记录.Where(i=>i.教学轮转编号 == item.编号),
                    管床病人 = 管床病人.Where(i=>i.教学轮转编号 == item.编号),
                    轮转手册 = 轮转手册.Where(i=>i.教学轮转编号 == item.编号)
                },

                考勤统计,

                教学活动反馈,
                结业申请,
                退培申请
            };
        }

        /// <summary>
        /// 2019-8-5 来自StatisticalController.cs中的获取学员培训任务统计
        /// TODO: 应该统一用这个;
        /// 本方法本来应该集成到v_教学轮转任务,进一步体现到v_教学轮转,但目前不宜影响v_教学轮转这个核心视图;
        /// 所以这里先单独调用;
        /// </summary>
        /// <param name="Db"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        async public static Task<object> 获取学员培训任务统计(IDbConnection Db, v_教学轮转Filter filter)
        {
            //var v教学轮转 = await Db.GetListSpAsync<v_教学轮转, v_教学轮转Filter>(filter);
            //var 教学轮转编号列表 = v教学轮转.Select(i => i.编号);

            var 培训任务统计 = await Db.QueryFirstSpAsync<sp_教学统计轮转任务数量, v_sp_分类统计轮转任务数量>
                (new sp_教学统计轮转任务数量()
                {
                    strWnere = SqlWhereMapper.toWhere(filter)
                    //教学轮转编号列表 = 教学轮转编号列表.ToPredefindedKeyFieldsList().ToDataTable()
                });
            return 培训任务统计;
        }
    }
}