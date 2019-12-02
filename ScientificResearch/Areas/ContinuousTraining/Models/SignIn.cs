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

    public class 继教签到活动Filter 
    {
        public string Like名称 { get; set; }
        [Required(ErrorMessage = "请提供文件夹编号")]
        public int? 文件夹编号 { get; set; }

    }

    public class 增改继教签到
    {
        public 继教活动内容 活动内容 { get; set; }
        public IEnumerable<继教签到规定> 继教签到规定列表 { get; set; }
    }

    public class 增改继教签到活动 : 增改继教签到
    {
        public int 文件夹编号 { get; set; }
        public int 学分 { get; set; }
    }

    public partial class 继教签到
    {
        async static public Task<object> 获取某签到活动详情(int 活动内容编号, IDbConnection db, IDbTransaction transaction = null)
        {
            return await 获取某签到活动或活动内容详情<v_继教签到活动>(活动内容编号, db, transaction);
        }

        async static public Task<object> 获取某签到活动内容详情(int 活动内容编号, IDbConnection db, IDbTransaction transaction = null)
        {
            return await 获取某签到活动或活动内容详情<v_继教签到>(活动内容编号, db, transaction);
        }

        private static async Task<object> 获取某签到活动或活动内容详情<T>(int 活动内容编号, IDbConnection db, IDbTransaction transaction)
        {
            var 基本信息 = await db.GetModelByIdSpAsync<T>(活动内容编号, transaction: transaction);
            var 签到规定 = await db.GetListSpAsync<继教签到规定, 继教签到规定Filter>(new 继教签到规定Filter()
            {
                签到编号 = 活动内容编号
            }, transaction: transaction);

            var 参与情况 = await db.GetListSpAsync<v_tfn_继教签到参与情况, 继教签到参与情况Filter>(
                new 继教签到参与情况Filter()
                {
                    签到编号 = 活动内容编号
                },
                tbName: $"tfn_继教签到参与情况({活动内容编号})",
                transaction: transaction);
            return new
            {
                基本信息,
                签到规定,
                参与情况
            };
        }

        async static public Task 增改继教签到(
            增改继教签到 data,
            IDbConnection db,
            IDbTransaction transaction = null)
        {
            var ls = data.继教签到规定列表.ToList();

            //验证一下,签到规定的时间范围不能重复;
            for (int i = 0, c = ls.Count(); i < c; i++)
            {
                for (int j = 0; j < c; j++)
                {
                    //如果j是i,或者j是i之前的,不管.只有j>i的情况才去判断
                    if (j > i)
                    {
                        if (MyLib.Tool.CheckDate(
                            (DateTime)ls[i].签到开始时间,
                            (DateTime)ls[i].签到结束时间,
                            (DateTime)ls[j].签到开始时间,
                            (DateTime)ls[j].签到结束时间))
                        {
                            throw new Exception("签到规定的签到时间范围不能重复");
                        }
                    }
                }
            }

            data.活动内容.类型 = 活动内容类型.继教签到.ToString();
            data.活动内容 = await 继教活动内容.增改继教活动内容(data.活动内容, db, transaction);

            var 继教签到 = new 继教签到();
            继教签到.编号 = data.活动内容.编号;
            继教签到 = await db.Merge(继教签到, transaction: transaction);

            await db.Merge(继教签到.编号, data.继教签到规定列表, transaction: transaction);

        }

    }

}
