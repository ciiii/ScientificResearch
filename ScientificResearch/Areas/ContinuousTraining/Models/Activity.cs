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
                },
                orderStr: nameof(v_继教活动内容.排序值),
                orderType: true,
                transaction: transaction);
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
        async static public Task<继教活动> 增改继教活动(继教活动 model, IDbConnection db, IDbTransaction transaction = null)
        {
            var 数据库中的记录 = await db.GetModelByIdSpAsync<v_继教活动>(model.编号, transaction: transaction);
            //没有在数据库中找到该继教活动(就是说这是insert的情况),或者其状态为"未发布",才可以增改
            if (数据库中的记录 == null || 数据库中的记录.状态 == 活动状态.未发布.ToString())
            {
                //强调当前数据为"未发布"状态;
                model.开始时间 = null;
                model.结束时间 = null;

                return await db.Merge(model, transaction: transaction);
            }
            else
            {
                throw new Exception("已发布的活动不能修改");
            }
        }

        /// <summary>
        /// 只有未发布的活动才可以发布
        /// 必须要有活动内容
        /// 如果有考试,由于考试时分批次指定了参与人,所以考试的参与人必须被包含在活动的可参与人中;
        /// </summary>
        /// <param name="data"></param>
        /// <param name="db"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async static public Task 发布继教活动(发布继教活动 data, IDbConnection db, IDbTransaction transaction = null)
        {
            var 活动视图 = await db.GetModelByIdSpAsync<v_继教活动>(data.活动编号, transaction: transaction);
            if (活动视图.状态 != 活动状态.未发布.ToString())
            {
                throw new Exception("只有未发布的活动才可以发布");
            }

            if (data.开始时间 >= data.结束时间)
            {
                throw new Exception("结束时间必须大于结束时间");
            }

            if (DateTime.Now >= data.结束时间)
            {
                throw new Exception("结束时间必须当前时间");
            }

            var 活动内容列表 = await db.GetListSpAsync<继教活动内容, 继教活动内容Filter>(
                new 继教活动内容Filter()
                {
                    活动编号 = data.活动编号
                }, transaction: transaction);
            if (活动内容列表.Count() <= 0)
            {
                throw new Exception("至少包含一个活动内容才能发布");
            }

            var 考试可参与人列表 = await db.GetListSpAsync<v_继教考试批次可参与人, 继教考试批次可参与人Filter>(
                new 继教考试批次可参与人Filter()
                {
                    活动编号 = data.活动编号
                },transaction:transaction);

            if (!考试可参与人列表.All(i => data.活动可参与人.Any(j => j.可参与人类型 == i.可参与人类型 && j.可参与人编号 == i.可参与人编号)))
            {
                throw new Exception("活动中考试的可参与人,必须包含在活动可参与人中");
            }

            var 活动 = MyLib.Tool.ModelToModel<v_继教活动, 继教活动>(活动视图);
            活动.开始时间 = data.开始时间;
            活动.结束时间 = data.结束时间;
            await db.Merge(活动, transaction: transaction);

            await db.Merge(data.活动编号, data.活动可参与人, transaction: transaction);

        }
    }

    public class 发布继教活动
    {
        public int 活动编号 { get; set; }
        public DateTime 开始时间 { get; set; }
        public DateTime 结束时间 { get; set; }
        public IEnumerable<继教活动可参与人> 活动可参与人 { get; set; }

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
