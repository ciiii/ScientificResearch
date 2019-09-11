using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.ContinuousTraining.Controllers
{
    /// <summary>
    /// Mogao是慕课的意思
    /// 并没有一个单独的"活动"controller,而是根据业务体现,融入到了
    /// </summary>
    public class MogaoController : ContinuousTrainingBaseController
    {
        /// <summary>
        /// 必填条件:文件夹编号,
        /// 该文件夹必须是"继教慕课"类型的,这个在后台没有验证了..
        /// 虽然是可以验证,但对于别的类型来说,取该文件夹下的"活动",也没有错.
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        async public Task<object> 分页获取某文件夹下的慕课活动(Paging paging, 继教活动Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_继教活动, 继教活动Filter>(paging, filter);
        }

        /// <summary>
        /// 其实对于别的类型的活动,也是一样的;
        /// 包括某个活动的基本信息,活动内容列表,活动可参与人列表;
        /// 统计数据那些,单独去取;
        /// </summary>
        /// <param name="活动编号"></param>
        /// <returns></returns>
        async public Task<object> 获取某慕课活动详情(int 活动编号)
        {
            return await 继教活动.获取某活动详情(活动编号, Db);
        }

        /// <summary>
        /// 返回的基本信息里面的"慕课素材路径",是计算出来的私有路径,可用来直接下载/查看
        /// </summary>
        /// <param name="活动内容编号"></param>
        /// <returns></returns>
        async public Task<object> 获取某慕课活动内容详情(int 活动内容编号)
        {
            return await 继教慕课.获取某慕课活动内容详情(
                活动内容编号,
                Config.GetValue<string>("七牛:AccessKey"),
                Config.GetValue<string>("七牛:SecretKey"), 
                Config.GetValue<string>("七牛:Domain"),
                Db);
        }

        async public Task<object> 获取某课后练习活动内容详情(int 活动内容编号)
        {
            return await 继教课后练习.获取某课后练习活动内容详情(活动内容编号, Db);
        }

        /// <summary>
        /// 注意,这里返回数据的第二部分:"参与情况",是签到流水账,而不是按某个参与人统计出的通过/不通过签到的数据
        /// 通过/不通过的数据要从"tfn_继教签到参与情况"拿才对
        /// </summary>
        /// <param name="活动内容编号"></param>
        /// <returns></returns>
        async public Task<object> 获取某签到活动内容详情(int 活动内容编号)
        {
            return await 继教签到.获取某签到活动内容详情(活动内容编号, Db);
        }

        async public Task<object> 获取某理论考试活动内容详情(int 活动内容编号)
        {
            return await 继教理论考试.获取某理论考试活动内容详情(活动内容编号, Db);
        }

        async public Task<object> 获取某操作考试活动内容详情(int 活动内容编号)
        {
            return await 继教操作考试.获取某操作考试活动内容详情(活动内容编号, Db);
        }
    }
}
