using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{


    /// <summary>
    /// 和科研办公功能对应
    /// </summary>
    public class OfficeController : TeachingManagementBaseController
    {
        /// <summary>
        /// 注意,这个是教学通知公告的管理,而不是首页上的"我可以看到的通知公告"
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取教学通知公告(Paging paging, 教学通知公告Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学通知公告_列表, 教学通知公告Filter>(paging, filter);
        }

        /// <summary>
        /// 管理时查看教学通知公告详情并不会设置"已接收"
        /// </summary>
        /// <param name="编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取教学通知公告详情(int 编号)
        {
            var model = await Db.GetModelByIdSpAsync<v_教学通知公告>(编号);

            var list = await Db.GetListSpAsync<v_教学通知公告接收条件, 教学通知公告接收条件Filter>(new 教学通知公告接收条件Filter() { 教学通知公告编号 = 编号 });

            return new
            {
                通知公告 = model,
                接收条件 = list
            };
        }

        /// <summary>
        /// 接收者类型,即PersonType:人员,教学学员,部门,教学角色
        /// 接受者编号,=0表示该接收者类型的所有人,=某个编号则表示具体的某个接受者类型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改教学通知公告([FromBody]PredefindedModelList<教学通知公告, 教学通知公告接收条件> data)
        {
            data.Model.发送人编号 = CurrentUser.编号;

            if (data.Model.关闭时间 <= DateTime.Now)
            {
                throw new Exception("关闭时间不能是过去的时间");
            }

            if (data.Model.编号 != 0 && data.Model.发送人编号 != CurrentUser.编号)
            {
                throw new Exception("只能修改自己发布的通知公告");
            }


            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {

                var 教学通知公告基本信息 = await dbForTransaction.Merge(data.Model, transaction);
                await dbForTransaction.Merge(教学通知公告基本信息.编号, data.List, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);

        }

        [HttpPost]
        async public Task<object> 上传教学通知公告文件或图片()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/教学/办公/通知公告文件和图片",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task 启用教学通知公告([FromBody]IEnumerable<int> data) => await Db.Enable<教学通知公告>(data);

        [HttpPost]
        async public Task 禁用教学通知公告([FromBody]IEnumerable<int> data) => await Db.Disable<教学通知公告>(data);

        /// <summary>
        /// 修改密码,这个应该放到一个独立的area去;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task ChangePassword([FromBody]ChangePassword model) =>
            await Db.ExecuteSpAsync(new sp_人员_修改密码()
            {
                工号 = CurrentUser.工号,
                旧密码 = model.旧密码,
                新密码 = model.新密码
            });


    }
}