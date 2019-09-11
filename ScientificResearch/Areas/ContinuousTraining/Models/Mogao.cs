using ScientificResearch.Infrastucture;
using MyLib;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public partial class 继教慕课
    {
        async static public Task<object> 获取某慕课活动内容详情(
            int 活动内容编号, 
            string accessKey, 
            string secretKey, 
            string domain, 
            IDbConnection db, 
            IDbTransaction transaction = null)
        {
            var 基本信息 = await db.GetModelByIdSpAsync<v_继教慕课>(活动内容编号, transaction: transaction);

            //v_继教慕课 的 慕课素材路径,是在这里计算出来的;
            基本信息.慕课素材路径 = MyQiniu.GetPrivateUrl(accessKey, secretKey, domain,基本信息.慕课素材名称);

            var 参与情况 = await db.GetListSpAsync<v_继教慕课参与情况, 继教慕课参与情况Filter>(
                new 继教慕课参与情况Filter()
                {
                    慕课编号 = 活动内容编号
                }, transaction: transaction);
            return new
            {
                基本信息,
                参与情况
            };
        }
    }

    public class 继教活动Filter
    {
        [Required(ErrorMessage = "请提供文件件编号")]
        public int 文件夹编号 { get; set; }

        public int? 培训计划编号 { get; set; }

        public string Like培训计划名称 { get; set; }

        public int? 培训计划年份 { get; set; }

        public int? 项目分类编号 { get; set; }

        public string Like项目分类名称 { get; set; }

        public string Like名称 { get; set; }

        /// <summary>
        /// 对于一个活动来说,状态有:未发布,未开始,进行中,已结束,
        /// 其中后面三个都属于"已发布"的一个状态,
        /// 状态直接写死;
        /// </summary>
        public string 状态 { get; set; }
    }

    public class 继教活动内容Filter
    {
        public int? 活动编号 { get; set; }
    }

    public class 继教活动可参与人Filter
    {
        public int? 活动编号 { get; set; }
    }

    public class 继教慕课参与情况Filter
    {
        public int? 慕课编号 { get; set; }
    }

    public class 继教课后练习参与情况Filter
    {
        public int? 课后练习编号 { get; set; }
    }

    public class 继教签到参与情况Filter
    {
        public int? 签到编号 { get; set; }
    }

    public class 继教考试批次Filter
    {
        public int? 考试编号 { get; set; }
    }

    public class 继教考试批次可参与人Filter
    {
        public int? 考试编号 { get; set; }
    }

    public class 继教理论考试参与情况Filter
    {
        public int? 考试编号 { get; set; }
    }

    public class 继教操作考试参与情况Filter
    {
        public int? 考试编号 { get; set; }
    }
}
