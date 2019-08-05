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

namespace ScientificResearch.Areas.TeachingManagementOfStudent.Controllers
{
    /// <summary>
    /// 教学活动
    /// </summary>
    public class ActivityController : TeachingManagementOfStudentBaseController
    {
        /// <summary>
        /// 
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取我对某个教学活动的评价(
            v_tfn_教学活动评价Filter filter,
            int 教学活动类型编号,
            int 教学活动编号,
            int 教学学员编号)
        {
            filter.是否启用 = true;
            return await Db.GetListSpAsync<v_tfn_教学活动评价, v_tfn_教学活动评价Filter>(
                filter,
                $"tfn_教学活动评价({教学活动类型编号},{教学活动编号},{教学学员编号})");
        }

        /// <summary>
        /// 评价人类型暂时不用管,评价人编号就是自己的编号
        /// 这个应该放到学员端
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改教学活动评价([FromBody] IEnumerable<教学活动评价> data)
        {
            foreach (var item in data)
            {
                item.评价人类型 = "教学学员";
                item.评价人编号 = 1;
            }

            await Db.Merge(data);
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
        
    }
}