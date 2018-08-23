using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

using Dapper;
using MyLib;
using Microsoft.Extensions.Configuration;
using System.IO;
using System.Data;

namespace ScientificResearch.Controllers
{
    public class IncomingController : BaseController
    {
        //public int 项目经费到账流程模板编号
        //{
        //    get
        //    {
        //        return Config.GetValue<int>("流程模板编号:项目经费到账");
        //    }
        //}

        public int 纵向项目经费到账流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:纵向项目经费到账");
            }
        }
        public int 横向项目经费到账流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:横向项目经费到账");
            }
        }
        public int 纵向项目立项流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:纵向项目立项");
            }
        }

        public int 横向项目申请流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:横向项目申请");
            }
        }

        [HttpGet]
        async public Task<PagingResult<v3_项目经费到账_纵向>> 分页获取纵向项目经费合计到账列表(Paging paging, 纵向项目立项Filter filter)
        {
            return await Db.GetPagingListSpAsync<v3_项目经费到账_纵向, 纵向项目立项Filter>(paging, filter);
        }

        [HttpGet]
        async public Task<PagingResult<v3_项目经费到账_横向>> 分页获取横向项目经费合计到账列表(Paging paging, 横向项目Filter filter)
        {
            return await Db.GetPagingListSpAsync<v3_项目经费到账_横向, 横向项目Filter>(paging, filter);
        }

       

        [HttpGet]
        async public Task<object> 获取某纵向项目经费到账列表(int 纵向项目立项编号)
        {
            return await Db.GetListSpAsync<object, 项目经费到账Filter>(
                new 项目经费到账Filter()
                {
                    流程模板编号 = 纵向项目立项流程模板编号,
                    项目编号 = 纵向项目立项编号
                },
            $"tfn_项目经费到账_纵向({CurrentUser.编号})");
        }

        [HttpGet]
        async public Task<object> 获取某横向项目经费到账列表(int 横向项目编号)
        {
            return await Db.GetListSpAsync<object, 项目经费到账Filter>(
                new 项目经费到账Filter()
                {
                    流程模板编号 = 横向项目申请流程模板编号,
                    项目编号 = 横向项目编号
                },
                $"tfn_项目经费到账_横向({CurrentUser.编号})");
        }

        [HttpPost]
        async public Task 新增纵向项目经费到账([FromBody]纵向项目经费到账增改 model)
        {
            if (model.基本资料.到账金额 <= 0)
            {
                throw new Exception("请填写正确的到账金额");
            }

            var entity = new 项目经费到账();
            Tool.ModelToModel( model.基本资料, entity);
            entity.流程模板编号 = 纵向项目立项流程模板编号;

            await MyWorkFlowBusiness.发起流程(
                            纵向项目经费到账流程模板编号,
                            new sp_项目经费到账_增改()
                            {
                                tt = entity.ToDataTable()
                            },
                            CurrentUser.编号,
                            model.IsHold);
        }


        [HttpPost]
        async public Task 新增横向项目经费到账([FromBody]横向项目经费到账增改 model)
        {
            if (model.基本资料.到账金额 <= 0)
            {
                throw new Exception("请填写正确的到账金额");
            }

            var entity = new 项目经费到账();
            Tool.ModelToModel( model.基本资料, entity);
            entity.流程模板编号 = 横向项目申请流程模板编号;

            await MyWorkFlowBusiness.发起流程(
                            横向项目经费到账流程模板编号,
                            new sp_项目经费到账_增改()
                            {
                                tt = entity.ToDataTable()
                            },
                            CurrentUser.编号,
                            model.IsHold);
        }

        [HttpPost]
        async public Task 完善纵向项目经费到账([FromBody]完成步骤<纵向项目经费到账增改> model)
        {
            if (model.附加数据.基本资料.到账金额 <= 0)
            {
                throw new Exception("请填写正确的到账金额");
            }

            var entity = new 项目经费到账();
            Tool.ModelToModel( model.附加数据.基本资料, entity);
            entity.流程模板编号 = 纵向项目立项流程模板编号;

            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_项目经费到账_增改()
                {
                    tt = entity.ToDataTable()
                },
                model.附加数据.IsHold);
        }

        [HttpPost]
        async public Task 完善横向项目经费到账([FromBody]完成步骤<横向项目经费到账增改> model)
        {
            if (model.附加数据.基本资料.到账金额 <= 0)
            {
                throw new Exception("请填写正确的到账金额");
            }

            var entity = new 项目经费到账();
            Tool.ModelToModel(model.附加数据.基本资料, entity);
            entity.流程模板编号 = 横向项目申请流程模板编号;

            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_项目经费到账_增改()
                {
                    tt = entity.ToDataTable()
                },
                model.附加数据.IsHold);
        }

        [HttpPost]
        async public Task<object> 上传到账凭证()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/项目经费到账/到账凭证",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 获取纵向项目到账详情(int 纵向项目到账编号)
        {
            var 纵向项目到账详情 = await Db.GetModelByIdSpAsync<v2_项目经费到账_纵向>(纵向项目到账编号);
            if (纵向项目到账详情 == null) throw new Exception($"没有找到编号为{纵向项目到账编号}的纵向项目到账");


            var 纵向项目立项编号 = 纵向项目到账详情.项目编号;

            var 纵向项目立项详情 = await Db.GetModelByIdSpAsync<v3_项目经费到账_纵向>(纵向项目立项编号);

            var 纵向项目到账审核记录 = await MyWorkFlowBusiness.获取某流程的步骤(纵向项目经费到账流程模板编号, 纵向项目到账编号);
            return new
            {
                纵向项目立项详情,
                纵向项目到账详情,
                纵向项目到账审核记录
            };
        }

        [HttpGet]
        async public Task<object> 获取横向项目到账详情(int 横向项目到账编号)
        {
            var 横向项目到账详情 = await Db.GetModelByIdSpAsync<v2_项目经费到账_横向>(横向项目到账编号);

            if (横向项目到账详情 == null) throw new Exception($"没有找到编号为{横向项目到账编号}的横向项目到账");

            var 横向项目立项编号 = 横向项目到账详情.项目编号;

            var 横向项目立项详情 = await Db.GetModelByIdSpAsync<v3_项目经费到账_横向>(横向项目立项编号);

            var 横向项目到账审核记录 = await MyWorkFlowBusiness.获取某流程的步骤(横向项目经费到账流程模板编号, 横向项目到账编号);
            return new
            {
                横向项目立项详情,
                横向项目到账详情,
                横向项目到账审核记录
            };
        }

        [HttpGet]
        async public Task<object> 分页获取纵向项目到账列表(Paging paging, 项目经费到账Filter filter)
        {
            return await Db.GetPagingListSpAsync<object, 项目经费到账Filter>(paging, filter, $"tfn_项目经费到账_纵向({CurrentUser.编号})");
        }

        [HttpGet]
        async public Task<object> 分页获取横向项目到账列表(Paging paging, 项目经费到账Filter filter)
        {
            return await Db.GetPagingListSpAsync<object, 项目经费到账Filter>(paging, filter, $"tfn_项目经费到账_横向({CurrentUser.编号})");
        }
    }
}