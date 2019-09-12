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
    public enum 活动状态
    {
        未发布, 未开始, 进行中, 已结束
    }

    /// <summary>
    /// "继教文件夹类型"是个类似的enum
    /// </summary>
    public enum 活动内容类型
    {
        继教慕课, 继教课后练习, 继教理论考试, 继教操作考试, 继教签到
    }

    public partial class 继教活动
    {
        async static public Task<object> 获取某活动详情(int 活动编号, IDbConnection db, IDbTransaction transaction = null)
        {
            var 活动基本信息 = await db.GetModelByIdSpAsync<v_继教活动>(活动编号, transaction: transaction);
            var 活动内容列表 = await db.GetListSpAsync<v_继教活动内容, 继教活动内容Filter>(
                new 继教活动内容Filter()
                {
                    活动编号 = 活动编号
                }, transaction: transaction);
            var 活动可参与人列表 = await db.GetListSpAsync<v_继教活动可参与人, 继教活动可参与人Filter>(
                new 继教活动可参与人Filter()
                {
                    活动编号 = 活动编号
                }, transaction: transaction);

            return new
            {
                活动基本信息,
                活动内容列表,
                活动可参与人列表
            };
        }

        /// <summary>
        /// 继教活动的基本信息增改
        /// 只能在状态 = 未发布时增改
        /// </summary>
        /// <param name="model"></param>
        /// <param name="db"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async static public Task 增改继教活动(继教活动 model, IDbConnection db, IDbTransaction transaction = null)
        {
            var 数据库中的记录 = await db.GetModelByIdSpAsync<v_继教活动>(model.编号, transaction: transaction);
            //没有在数据库中找到该继教活动(就是说这是insert的情况),或者其状态为"未发布",才可以增改
            if (数据库中的记录 == null || 数据库中的记录.状态 == 活动状态.未发布.ToString())
            {
                //强调当前数据为"未发布"状态;
                model.开始时间 = null;
                model.结束时间 = null;

                await db.Merge(model, transaction: transaction);
            }
            else
            {
                throw new Exception("已发布的活动不能修改");
            }
        }

        
    }

    public partial class 继教活动内容
    {
        /// <summary>
        /// 一般情况下都应该放到具体的活动内容的一个事务性增改中去;
        /// </summary>
        /// <param name=""></param>
        /// <param name="db"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async static public Task<继教活动内容> 增改继教活动内容(继教活动内容 model, IDbConnection db, IDbTransaction transaction = null)
        {
            return await db.Merge(model, transaction: transaction);
        }
    }


}
