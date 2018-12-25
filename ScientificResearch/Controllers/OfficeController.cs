using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

using MyLib;
using Microsoft.Extensions.Configuration;
using System.Data;


namespace ScientificResearch.Controllers
{
    public class OfficeController : BaseController
    {
        /// <summary>
        /// 接收者类型:
        /// 0 所有人 该情况下, 接收者编号也 = 0;
        /// 10 -人员;
        /// 20 -部门;
        /// 30 -角色;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增通知公告([FromBody]通知公告增改 model)
        {
            model.基本资料.发送人编号 = CurrentUser.编号;
            if (model.基本资料.关闭时间 <= DateTime.Now)
            {
                throw new Exception("关闭时间不能是过去的时间");
            }

            if (model.基本资料.编号 != 0 && model.基本资料.发送人编号 != CurrentUser.编号)
            {
                throw new Exception("只能修改自己发布的通知公告");
            }

            await Db.ExecuteSpAsync(new sp_通知公告_增改()
            {
                tt = model.基本资料.ToDataTable(),
                tt_通知公告接收条件 = model.通知公告接收条件列表.ToDataTable()
            });
        }

        [HttpPost]
        async public Task 启禁通知公告([FromBody]通知公告启禁 model)
        {
            if (model.发送人编号 != CurrentUser.编号)
            {
                throw new Exception("只能启用或禁用自己发布的通知公告");
            }

            await Db.ExecuteSpAsync(new sp_通知公告_启禁()
            {
                编号 = model.编号,
                是否启用 = model.是否启用
            });
        }

        [HttpGet]
        async public Task<object> 分页获取通知公告(Paging paging, 通知公告Filter filter)
        {
            return await Db.GetPagingListSpAsync<v2_通知公告_列表, 通知公告Filter>(paging, filter);
        }

        /// <summary>
        /// 如果要获取必读且未读的通知公告,使用条件"是否必读=true 且 是否已接收=false"
        /// </summary>
        /// <param name="人员编号"></param>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取某人员可查看的通知公告(int 人员编号, Paging paging, 某人员可查看的通知公告Filter filter)
        {
            return await Db.GetPagingListSpAsync<object, 某人员可查看的通知公告Filter>(paging, filter, $"tfn_某人员可查看的通知公告({人员编号})");
        }


        [HttpGet]
        async public Task<object> 获取通知公告详情(int 编号, bool 是否已接收)
        {
            var model = await Db.GetModelByIdSpAsync<v2_通知公告>(编号);
            //if (!是否已接收)
            //{
                await Db.ExecuteSpAsync(new sp_通知公告_接收()
                {
                    通知公告编号 = 编号,
                    接收人编号 = CurrentUser.编号
                });
            //}

            var list = await Db.GetListSpAsync<v1_通知公告接收条件, 通知公告接收条件Filter>(new 通知公告接收条件Filter() { 通知公告编号 = 编号 });

            return new
            {
                通知公告 = model,
                接收条件 = list
            };
        }

        [HttpPost]
        async public Task<object> 上传通知公告文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/办公/通知公告文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传通知公告图片()
        {
            var file = Request.Form.Files.FirstOrDefault();
            if(file == null)
            {
                throw new Exception("没有上传文件");
            }

            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/办公/通知公告图片",
                Config.GetValue<int>("uploadFileMaxSize"));

            var obj = new
            {
                state = "SUCCESS",
                url = filesNameList.FirstOrDefault(),
                //title = "new.png",
                //original = file.FileName,
                //type = ".png",
                //size = 1000
            };

            var objString = Newtonsoft.Json.JsonConvert.SerializeObject(obj);

            return Content(objString, "text/html");

            //return filesNameList;
        }

        [HttpPost]
        async public Task 增改下载([FromBody]下载中心 model)
        {
            model.上传人编号 = CurrentUser.编号;

            //if (model.编号 != 0 && model.上传人编号 != CurrentUser.编号)
            //{
            //    throw new Exception("只能修改自己上传的下载文件");
            //}

            await Db.ExecuteSpAsync(new sp_下载中心_增改()
            {
                tt = model.ToDataTable()
            });
        }

        [HttpPost]
        async public Task<object> 上传下载文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/下载中心",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task 启禁下载([FromBody]下载中心启禁 model)
        {
            //if (model.上传人编号 != CurrentUser.编号)
            //{
            //    throw new Exception("只能启用或禁用自己上传的下载文件");
            //}

            await Db.ExecuteSpAsync(new sp_下载中心_启禁()
            {
                编号 = model.编号,
                是否启用 = model.是否启用
            });
        }

        /// <summary>
        /// 首页查看有下载中心时用
        /// 分页获取某人员可查看的下载中心,由于所有信息都包含了,所以没有获取详情的接口了
        /// </summary>
        /// <param name="人员编号"></param>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取可查看的下载中心(Paging paging, 下载中心Filter filter)
        {
            filter.是否启用 = true;
            return await Db.GetPagingListSpAsync<v2_下载中心, 下载中心Filter>(paging, filter);
        }

        /// <summary>
        /// 管理下载中心时用
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取下载中心(Paging paging, 下载中心Filter filter)
        {
            return await Db.GetPagingListSpAsync<v2_下载中心, 下载中心Filter>(paging, filter);
        }

        private enum 成果类型
        {
            论文 = 1, 著作 = 2, 专利 = 3, 获奖 = 4
        }

        [HttpGet]
        async public Task<object> 获取科研详情(int 当前登录人编号)
        {
            //var 当前登录人编号 = currentUser.编号;

            var r1 = await Db.GetModelByIdSpAsync<v1_人员_带部门名>(当前登录人编号);

            var 纵向项目总览filter = new 纵向项目总览Filter() { 发起人编号 = 当前登录人编号 };
            var r2 = await Db.GetListSpAsync<v4_纵向项目总览, 纵向项目总览Filter>(纵向项目总览filter);

            var 横向项目filter = new 横向项目Filter() { 发起人编号 = 当前登录人编号 };
            var r3 = await Db.GetListSpAsync<v4_横向项目总览, 横向项目Filter>(横向项目filter);

            var 成果总览filter = new 成果总览Filter() { 发起人编号 = 当前登录人编号 };
            var r4 = await Db.GetListSpAsync<v4_成果总览, 成果总览Filter>(成果总览filter);

            return new
            {
                个人资料 = r1,
                纵向项目总览 = r2,
                横向项目总览 = r3,
                成果总览 = r4
            };
        }

        [HttpGet]
        async public Task<object> 获取待办流程(Paging paging, 流程Filter filter)
        {
            filter.是否可处理 = true;
            return await Db.GetPagingListSpAsync<object, 流程Filter>(
                paging,
                filter,
                $"tfn_待办事宜(NULL,NULL,{CurrentUser.编号})",
                "流程编号");
        }

    }


}