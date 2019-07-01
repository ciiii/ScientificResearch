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
    /// <summary>
    /// 教学活动
    /// </summary>
    public class ActivityController : TeachingManagementBaseController
    {
        /// <summary>
        /// 管理时用,会返回所有的教学活动
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取教学活动(Paging paging, v_教学活动Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学活动, v_教学活动Filter>(paging, filter);
        }

        [HttpGet]
        async public Task<object> 获取教学活动详情([Required]int 教学活动编号)
        {
            return new
            {
                教学活动 = await Db.GetModelByIdSpAsync<v_教学活动>(教学活动编号),
                可参与者 = await Db.GetListSpAsync<v_教学活动可参与者, v_教学活动可参与者Filter>(
                    new v_教学活动可参与者Filter()
                    {
                        教学活动编号 = 教学活动编号
                    })
            };
        }

        /// <summary>
        /// 返回某个类型下某个教学活动的评价的统计数据,注意这里不必返回一条一条的详情
        /// 不过仍然需要点开新页面查看
        /// </summary>
        /// <param name="教学活动类型编号"></param>
        /// <param name="教学活动编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某教学活动的评价([Required]int 教学活动类型编号, [Required]int 教学活动编号)
        {
            var filter = new 教学活动评价项目Filter() { 是否启用 = true };
            return await Db.GetListSpAsync<v_tfn_教学活动评价_按项目统计, 教学活动评价项目Filter>
                (filter,
                $"tfn_教学活动评价_按项目统计({教学活动类型编号},{教学活动编号})");
        }

        /// <summary>
        /// 一定记得指定教学活动编号
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取某教学活动的反馈(Paging paging, v_教学活动反馈Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学活动反馈, v_教学活动反馈Filter>(paging, filter);
        }

        [HttpPost]
        async public Task<object> 上传教学活动附件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/教学/教学活动/活动附件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task 增改教学活动([FromBody]PredefindedModelList<教学活动, 教学活动可参与者> data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 教学活动 = await dbForTransaction.Merge(data.Model, transaction: transaction);
                await dbForTransaction.Merge(教学活动.编号, data.List, transaction: transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 这里开始应该是学员端的东东了
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取我的教学活动(Paging paging, v_教学活动Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学活动, v_教学活动Filter>
                (paging, filter, $"tfn_教学某学员可查看的教学活动('{CurrentUser.编号}')");

        }

        [HttpGet]
        async public Task<object> 获取我对某个教学活动的评价(v_tfn_教学活动评价Filter filter)
        {
            filter.是否启用 = true;
            return await Db.GetListSpAsync<v_tfn_教学活动评价, v_tfn_教学活动评价Filter>(filter);
        }

        /// <summary>
        /// 这里教学活动编号和学员编号都需要填;
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取我对某个教学活动的反馈(v_教学活动反馈Filter filter)
        {
            return await Db.GetListSpAsync<v_教学活动反馈, v_教学活动反馈Filter>(filter);
        }

        [HttpPost]
        async public Task<object> 上传教学活动反馈附件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/教学/教学活动/反馈附件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task 增改教学活动反馈([FromBody] 教学活动反馈 data) =>
            await Db.Merge(data);

        /// <summary>
        /// 评价人类型暂时不用管,评价人编号就是自己的编号
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改教学活动评价([FromBody] IEnumerable<教学活动评价> data)
        {
            foreach (var item in data)
            {
                item.评价人类型 = CurrentUser.人员类型;
                item.评价人编号 = CurrentUser.编号;
            }

            await Db.Merge(data);
        }

    }
}