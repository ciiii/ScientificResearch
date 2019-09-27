using ScientificResearch.Infrastucture;
using MyLib;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Qiniu.Util;
using Qiniu.IO.Model;

namespace ScientificResearch.Models
{
    public class 增改继教慕课
    {
        public 继教活动内容 活动内容 { get; set; }
        public 继教慕课 慕课 { get; set; }
    }


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
            基本信息.慕课素材路径 = MyQiniu.GetPrivateUrl(accessKey, secretKey, domain, 基本信息.慕课素材名称);

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

        static public string 获取某素材的上传token(
            string accessKey,
            string secretKey,
            string bucket,
            string fileName)
        {
            Mac mac = new Mac(accessKey, secretKey);

            PutPolicy putPolicy = new PutPolicy();
            // 如果需要设置为"覆盖"上传(如果云端已有同名文件则覆盖)，请使用 SCOPE = "BUCKET:KEY"
            //putPolicy.Scope = bucket + ":" + fileName;
            putPolicy.Scope = bucket;
            // 上传策略有效期(对应于生成的凭证的有效期)          
            putPolicy.SetExpires(3600*24);
            // 上传到云端多少天后自动删除该文件，如果不设置（即保持默认默认）则不删除
            //putPolicy.DeleteAfterDays = 1;
            // 生成上传凭证，参见
            // https://developer.qiniu.com/kodo/manual/upload-token            
            string jstr = putPolicy.ToJsonString();
            string token = Auth.CreateUploadToken(mac, jstr);

            return token;
        }

        /// <summary>
        /// 应该在控制器放到一个事务.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="db"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async static public Task 增改继教慕课(
            增改继教慕课 data, 
            IDbConnection db, 
            IDbTransaction transaction = null)
        {
            data.活动内容.类型 = 活动内容类型.继教慕课.ToString();
            data.活动内容 = await 继教活动内容.增改继教活动内容(data.活动内容,db,transaction);
            data.慕课.编号 = data.活动内容.编号;
            data.慕课 = await db.Merge(data.慕课,transaction:transaction);
        }
    }

    public class 设置继教活动学分
    {
        public int 活动编号 { get; set; }
        public int 学分 { get; set; }
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
        public string WhereNotIn编号 { get; set; }
        public string WhereIn考试编号 { get; set; }
    }

    public class 继教考试批次可参与人Filter
    {
        public int? 活动编号 { get; set; }
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

    public class 继教慕课素材Filter
    {
        [Required(ErrorMessage ="请提供文件件编号")]
        public int 文件夹编号 { get; set; }

        public string Like名称 { get; set; }
    }
}
