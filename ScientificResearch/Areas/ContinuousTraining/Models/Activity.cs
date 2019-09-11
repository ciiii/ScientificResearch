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

    public partial class 继教活动
    {
        async static public Task<object> 获取某活动详情(int 活动编号, IDbConnection db, IDbTransaction transaction = null)
        {
            var 活动基本信息 = await db.GetModelByIdSpAsync<v_继教活动>(活动编号,transaction: transaction);
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
    }

}
