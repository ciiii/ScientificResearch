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
using MyLib;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    public class Evaluation360Controller : TeachingManagementBaseController
    {
        /// <summary>
        /// 对应多个页面;
        /// 对于"对学员评价到对科室管理员评价"等等页面,固定搜索条件为
        ///     "1 老师端:NotEqual来源类型 = 0 且 评价人编号=自己的编号 且 目标类型 = 该页面的目标类型" 
        ///     "2 学员端:来源类型 = 0 且 评价人编号=自己的编号 且 目标类型 = 该页面的目标类型"
        /// 对于"评价查询"页面,没有什么需要固定的条件,只是要注意:"来源类型和目标类型就是0代表学员,其他是角色编号"
        /// 对于"对我的评价",固定搜索条件为
        ///     "1 老师端:NotEqual目标类型 = 0 且 被评价人编号=自己的编号"
        ///     "2 学员端:目标类型=0 且 被评价人编号=自己的编号"
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取我做出的评价(Paging paging, v_教学360评价Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学360评价, v_教学360评价Filter>(paging, filter);
        }

        /// <summary>
        /// 只能针对一个教学360评价看其具体的评分
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取评价评分(v_tfn_教学360评价评分Filter filter)
        {
            return await Db.GetListSpAsync<v_tfn_教学360评价评分, v_tfn_教学360评价评分Filter>(filter);
        }

        /// <summary>
        /// 如果=0则没找到
        /// </summary>
        /// <param name="来源类型"></param>
        /// <param name="目标类型"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<int> 获取教学360评价方向编号([Required]int 来源类型, [Required]int 目标类型)
        {
            var v_教学360评价方向 = (await Db.GetListSpAsync<v_教学360评价方向, v_教学360评价方向Filter>
                (new v_教学360评价方向Filter()
                {
                    来源类型 = 来源类型,
                    目标类型 = 目标类型
                })).FirstOrDefault();
            if (v_教学360评价方向 == null) return 0;
            return v_教学360评价方向.编号;
        }

        /// <summary>
        /// 其中的教学360评价方向编号用上面的接口获取
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改360评价([FromBody]PredefindedModelList<教学360评价, 教学360评价评分> data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 教学360评价 = await dbForTransaction.Merge(data.Model, transaction: transaction);
                await dbForTransaction.Merge(教学360评价.编号, data.List, transaction: transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }
    }
}