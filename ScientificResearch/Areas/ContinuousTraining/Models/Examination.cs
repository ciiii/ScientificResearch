﻿using ScientificResearch.Infrastucture;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 增改继教课后练习
    {
        public 继教活动内容 活动内容 { get; set; }
        public 继教课后练习 课后练习 { get; set; }
        public IEnumerable<继教课后练习试题> 试题列表 { get; set; }
    }

    public class 增改继教理论考试
    {
        public 继教活动内容 活动内容 { get; set; }
        public 继教理论考试 理论考试 { get; set; }
        public IEnumerable<增改继教考试批次> 增改继教考试批次 { get; set; }
    }

    public class 增改继教操作考试
    {
        public 继教活动内容 活动内容 { get; set; }
        public 继教操作考试 操作考试 { get; set; }
        public IEnumerable<继教操作考试助教老师> 助教老师列表 { get; set; }
        public IEnumerable<增改继教考试批次> 增改继教考试批次 { get; set; }
    }

    public class 增改继教考试批次
    {
        public 继教考试批次 考试批次 { get; set; }
        public IEnumerable<继教考试批次可参与人> 可参与人 { get; set; }
    }

    public partial class 继教课后练习
    {
        async public static Task<object> 获取某课后练习活动内容详情(int 活动内容编号, IDbConnection db, IDbTransaction transaction = null)
        {
            var 基本信息 = await db.GetModelByIdSpAsync<v_继教课后练习>(活动内容编号, transaction: transaction);
            var 参与情况 = await db.GetListSpAsync<v_继教课后练习参与情况, 继教课后练习参与情况Filter>(
                new 继教课后练习参与情况Filter()
                {
                    课后练习编号 = 活动内容编号
                }, transaction: transaction);
            return new
            {
                基本信息,
                参与情况
            };

        }

        /// <summary>
        /// 应该在控制器放到一个事务.
        /// </summary>
        /// <param name="data"></param>
        /// <param name="db"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async static public Task 增改继教课后练习(
            增改继教课后练习 data,
            IDbConnection db,
            IDbTransaction transaction = null)
        {
            data.活动内容.类型 = 活动内容类型.继教课后练习.ToString();
            data.活动内容 = await 继教活动内容.增改继教活动内容(data.活动内容, db, transaction);

            data.课后练习.编号 = data.活动内容.编号;
            data.课后练习 = await db.Merge(data.课后练习, transaction: transaction);

            await db.Merge(data.课后练习.编号, data.试题列表, transaction: transaction);
        }
    }


    public partial class 继教理论考试
    {
        async static public Task<object> 获取某理论考试活动内容详情(int 活动内容编号, IDbConnection db, IDbTransaction transaction = null)
        {
            var 基本信息 = await db.GetModelByIdSpAsync<v_继教理论考试>(活动内容编号, transaction: transaction);
            var 批次 = await db.GetListSpAsync<继教考试批次, 继教考试批次Filter>(new 继教考试批次Filter()
            {
                考试编号 = 活动内容编号
            }, transaction: transaction);
            var 可参与人 = await db.GetListSpAsync<v_继教考试批次可参与人, 继教考试批次可参与人Filter>(new 继教考试批次可参与人Filter()
            {
                考试编号 = 活动内容编号
            }, transaction: transaction);
            var 参与情况 = await db.GetListSpAsync<v_继教理论考试参与情况, 继教理论考试参与情况Filter>(
                new 继教理论考试参与情况Filter()
                {
                    考试编号 = 活动内容编号
                }, transaction: transaction);

            return new
            {
                基本信息,
                批次 = from item in 批次
                     select new
                     {
                         该批次信息 = item,
                         该批次可参与人 = from item2 in 可参与人 where item.编号 == item2.考试批次编号 select item2
                     },
                参与情况
            };
        }

        async static public Task 增改继教理论考试(
            增改继教理论考试 data,
            IDbConnection db,
            IDbTransaction transaction = null)
        {
            //验证一下
            继教考试批次.验证考试批次(data.增改继教考试批次, data.活动内容.开始时间, data.活动内容.结束时间);

            data.活动内容.类型 = 活动内容类型.继教理论考试.ToString();
            data.活动内容 = await 继教活动内容.增改继教活动内容(data.活动内容, db, transaction);

            data.理论考试.编号 = data.活动内容.编号;
            data.理论考试 = await db.Merge(data.理论考试, transaction: transaction);

            foreach (var item in data.增改继教考试批次)
            {
                var 考试批次 = item.考试批次;
                考试批次.考试编号 = data.理论考试.编号;

                考试批次 = await db.Merge(考试批次, transaction: transaction);

                await db.Merge(考试批次.编号, item.可参与人, transaction: transaction);
            }
        }

    }



    public partial class 继教操作考试
    {
        async static public Task<object> 获取某操作考试活动内容详情(int 活动内容编号, IDbConnection db, IDbTransaction transaction = null)
        {
            var 基本信息 = await db.GetModelByIdSpAsync<v_继教操作考试>(活动内容编号, transaction: transaction);

            var 助教老师 = await db.GetListSpAsync<v_继教操作考试助教老师, 继教操作考试助教老师Filter>(
                new 继教操作考试助教老师Filter()
                {
                    操作考试编号 = 活动内容编号
                });

            var 批次 = await db.GetListSpAsync<继教考试批次, 继教考试批次Filter>(new 继教考试批次Filter()
            {
                考试编号 = 活动内容编号
            }, transaction: transaction);

            var 可参与人 = await db.GetListSpAsync<v_继教考试批次可参与人, 继教考试批次可参与人Filter>(new 继教考试批次可参与人Filter()
            {
                考试编号 = 活动内容编号
            }, transaction: transaction);

            var 参与情况 = await db.GetListSpAsync<v_继教操作考试参与情况, 继教操作考试参与情况Filter>(
                new 继教操作考试参与情况Filter()
                {
                    考试编号 = 活动内容编号
                }, transaction: transaction);

            return new
            {
                基本信息,
                助教老师,
                批次 = from item in 批次
                     select new
                     {
                         该批次信息 = item,
                         该批次可参与人 = from item2 in 可参与人 where item.编号 == item2.考试批次编号 select item2
                     },
                参与情况
            };
        }

        async static public Task 增改继教操作考试(
            增改继教操作考试 data,
            IDbConnection db,
            IDbTransaction transaction = null)
        {
            //验证一下
            继教考试批次.验证考试批次(data.增改继教考试批次, data.活动内容.开始时间, data.活动内容.结束时间);

            data.活动内容.类型 = 活动内容类型.继教操作考试.ToString();
            data.活动内容 = await 继教活动内容.增改继教活动内容(data.活动内容, db, transaction);

            data.操作考试.编号 = data.活动内容.编号;
            data.操作考试 = await db.Merge(data.操作考试, transaction: transaction);

            await db.Merge(data.操作考试.编号, data.助教老师列表, transaction: transaction);

            foreach (var item in data.增改继教考试批次)
            {
                var 考试批次 = item.考试批次;
                考试批次.考试编号 = data.操作考试.编号;

                考试批次 = await db.Merge(考试批次, transaction: transaction);

                await db.Merge(考试批次.编号, item.可参与人, transaction: transaction);
            }
        }
    }

    public partial class 继教考试批次
    {
        public static void 验证考试批次(IEnumerable<增改继教考试批次> 增改考试批次列表, DateTime? 活动内容开始时间, DateTime? 活动内容结束时间)
        {
            //批次总不能一个都没有吧
            if (增改考试批次列表.Count() == 0)
            {
                throw new Exception("至少应有一次考试批次");
            }

            //考试时间总不能批次的超出考试的吧
            if (增改考试批次列表.Any(i =>
                i.考试批次.考试开始时间 < 活动内容开始时间 ||
                i.考试批次.考试结束时间 > 活动内容结束时间))
            {
                throw new Exception("考试批次的开始结束时间,不能超出考试的开始结束时间");
            }

            //批次排序值不能重复吧
            if (增改考试批次列表.Select(i => i.考试批次.排序值).Distinct().Count() != 增改考试批次列表.Count())
            {
                throw new Exception("考试批次的排序不能重复");
            }

            //批次的开始结束时间,活动内容的开始结束时间,总需要结束时间>开始时间吧?这个暂时没管,他要相同或者反过来目前随便;

            //批次的开始结束时间总要按顺序来吧?至少不能重复吧?利用排序值来区分彼此
            //排序值小于当前批次的批次,其开始结束时间需要小于当前批次的开始时间;
            if (!增改考试批次列表.All(i =>
                    增改考试批次列表.Where(j =>
                        j.考试批次.排序值 < i.考试批次.排序值).All(k =>
                            k.考试批次.考试开始时间 <= i.考试批次.考试开始时间 && k.考试批次.考试结束时间 <= i.考试批次.考试开始时间)))
            {
                throw new Exception("考试批次的开始结束时间,与排序不符");
            }

            if (!增改考试批次列表.All(i =>
                增改考试批次列表.Where(j =>
                    j.考试批次.排序值 > i.考试批次.排序值).All(k =>
                        k.考试批次.考试开始时间 >= i.考试批次.考试结束时间 && k.考试批次.考试结束时间 >= i.考试批次.考试结束时间)))
            {
                throw new Exception("考试批次的开始结束时间,与排序不符");
            }
        }
    }

    public class 继教操作考试助教老师Filter
    {
        public int? 操作考试编号 { get; set; }
    }


    #region 试题管理

    public class 增改试题
    {
        public 继教试题 试题 { get; set; }
        public IEnumerable<继教试题标签> 试题标签 { get; set; }
        public IEnumerable<继教试题备选答案> 试题备选答案 { get; set; }
        public IEnumerable<继教试题正确答案> 试题正确答案 { get; set; }
    }

    public partial class 继教试题
    {
        async public static Task 增改继教试题(
            IEnumerable<增改试题> data, 
            IDbConnection db,
            IDbTransaction transaction = null)
        {
            foreach (var item in data)
            {
                //这里是可以验证一下正确答案的数量是否符合试题类型的;

                var 试题 = await db.Merge(item.试题, transaction: transaction);

                await db.Merge(试题.编号, item.试题标签, transaction: transaction);
                await db.Merge(试题.编号, item.试题备选答案, transaction: transaction);
                await db.Merge(试题.编号, item.试题正确答案, transaction: transaction);

            }
        }
    }

    public class 继教试题Filter
    {
        [Required(ErrorMessage ="请提供文件夹编号")]
        public int 文件夹编号 { get; set; }
        public int? 类型编号 { get; set; }
        public string Like题干 { get; set; }
        public string 难易度 { get; set; }
        public int? Begin答题次数 { get; set; }
        public int? End答题次数 { get; set; }
        public int? Begin正确答题次数 { get; set; }
        public int? End正确答题次数 { get; set; }
        public int? Begin答题正确率 { get; set; }
        public int? End答题正确率 { get; set; }
    }

    public class 继教试题标签Filter
    {
        public string WhereIn试题编号 { get; set; }
        public int? 试题编号 { get; set; }
    }

    public class 继教试题备选答案Filter
    {
        public string WhereIn试题编号 { get; set; }
        public int? 试题编号 { get; set; }
    }

    public class 继教试题正确答案Filter
    {
        public string WhereIn试题编号 { get; set; }
        public int? 试题编号 { get; set; }
    }

    #endregion
}