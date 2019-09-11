using ScientificResearch.Infrastucture;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
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
    }

    public partial class 继教操作考试
    {
        async static public Task<object> 获取某操作考试活动内容详情(int 活动内容编号, IDbConnection db, IDbTransaction transaction = null)
        {
            var 基本信息 = await db.GetModelByIdSpAsync<v_继教操作考试>(活动内容编号, transaction: transaction);
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
                批次 = from item in 批次
                     select new
                     {
                         该批次信息 = item,
                         该批次可参与人 = from item2 in 可参与人 where item.编号 == item2.考试批次编号 select item2
                     },
                参与情况
            };
        }
    }

}
