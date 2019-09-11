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
    public partial class 继教签到
    {
        async static public Task<object> 获取某签到活动内容详情(int 活动内容编号, IDbConnection db, IDbTransaction transaction = null)
        {
            var 基本信息 = await db.GetModelByIdSpAsync<v_继教签到参与情况>(活动内容编号, transaction: transaction);
            var 参与情况 = await db.GetListSpAsync<v_继教签到参与情况, 继教签到参与情况Filter>(
                new 继教签到参与情况Filter()
                {
                    签到编号 = 活动内容编号
                }, transaction: transaction);
            return new
            {
                基本信息,
                参与情况
            };
        }
    }
            
}
