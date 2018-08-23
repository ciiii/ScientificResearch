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
    public class ExpenseController : BaseController
    {
        public int 报销流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:报销");
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

        public int 参加会议流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:参加会议");
            }
        }

        /// <summary>
        /// 针对每个纵向项目,目前总的报销情况,一个项目一行
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<PagingResult<v3_项目经费报销_纵向>> 分页获取纵向项目经费合计报销列表(Paging paging, 纵向项目立项Filter filter) =>
            await Db.GetPagingListSpAsync<v3_项目经费报销_纵向, 纵向项目立项Filter>(paging, filter);

        [HttpGet]
        async public Task<PagingResult<v3_项目经费报销_横向>> 分页获取横向项目经费合计报销列表(Paging paging, 横向项目Filter filter) =>
            await Db.GetPagingListSpAsync<v3_项目经费报销_横向, 横向项目Filter>(paging, filter);

        [HttpGet]
        async public Task<PagingResult<v3_参加会议报销>> 分页获取参加会议合计报销列表(Paging paging, 参加会议Filter filter) =>
            await Db.GetPagingListSpAsync<v3_参加会议报销, 参加会议Filter>(paging, filter);

        /// <summary>
        /// 针对某个纵向项目的多个报销;一个报销一行
        /// </summary>
        /// <param name="纵向项目立项编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某纵向项目经费报销列表(int 纵向项目立项编号)
        {
            return await 获取经费报销列表(纵向项目立项编号, 纵向项目立项流程模板编号);
        }

        [HttpGet]
        async public Task<object> 获取某横向项目经费报销列表(int 横向项目编号)
        {
            return await 获取经费报销列表(横向项目编号, 横向项目申请流程模板编号);
        }

        [HttpGet]
        async public Task<object> 获取某参加会议报销列表(int 参加会议编号)
        {
            return await 获取经费报销列表(参加会议编号, 参加会议流程模板编号);
        }

        private async Task<object> 获取经费报销列表(int 项目编号, int 流程模板编号)
        {
            return await Db.GetListSpAsync<object, 报销Filter>(
                            new 报销Filter()
                            {
                                流程模板编号 = 流程模板编号,
                                项目编号 = 项目编号
                            },
                        $"tfn_报销({CurrentUser.编号},{报销流程模板编号})");
        }

        /// <summary>
        /// 根据报销编号搜索报销可以用这个
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取所有报销列表(Paging paging, 报销Filter filter)
        {
            return await Db.GetPagingListSpAsync<object, 报销Filter>(
                paging,
                           filter,
                       $"tfn_报销({CurrentUser.编号},{报销流程模板编号})");
        }

        /// <summary>
        /// 查看某个报销下具体每个项目的列表,一个报销下每个项目一行;
        /// 查看或修改某报销详情时用
        /// </summary>
        /// <param name="报销编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某报销详情(int 报销编号)
        {
            //项目信息+报销基本信息
            var 报销基本信息 = await Db.GetModelByIdSpAsync<v2_报销>(报销编号);

            //报销详情列表
            var 本次报销项目列表 = await Db.GetListSpAsync<object>($"tfn_某报销所属项目预算已报销详情以及本次报销金额({报销编号})");

            //审核记录
            var 报销审核记录 = await MyWorkFlowBusiness.获取某流程的步骤(报销流程模板编号, 报销编号);

            return new { 报销基本信息, 本次报销项目列表, 报销审核记录 };
        }

        /// <summary>
        /// 针对某个纵向项目,查看其所有报销按支出类型+内容分类统计得到的汇总表;
        /// 只在新增纵向项目报销时候用
        /// </summary>
        /// <param name="纵向项目立项编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<IEnumerable<v1_预算已报销详情>> 获取某纵向项目预算已报销详情(int 纵向项目立项编号)
        {
            return await 获取项目预算已报销详情(纵向项目立项编号, 纵向项目立项流程模板编号);
        }

        /// <summary>
        /// 针对某个横向项目,查看其所有报销按支出类型+内容分类统计得到的汇总表;
        /// 只在新增横向项目报销时候用
        /// </summary>
        /// <param name="横向项目编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<IEnumerable<v1_预算已报销详情>> 获取某横向项目预算已报销详情(int 横向项目编号)
        {
            return await 获取项目预算已报销详情(横向项目编号, 横向项目申请流程模板编号);
        }

        /// <summary>
        /// 针对某个参加会议,查看其所有报销按支出类型+内容分类统计得到的汇总表
        /// 只在新增参加会议报销时候用
        /// </summary>
        /// <param name="参加会议编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<IEnumerable<v1_预算已报销详情>> 获取某参加会议预算已报销详情(int 参加会议编号)
        {
            return await 获取项目预算已报销详情(参加会议编号, 参加会议流程模板编号);
        }

        private async Task<IEnumerable<v1_预算已报销详情>> 获取项目预算已报销详情(int 项目编号, int 流程模板编号)
        {
            var 该项目预算已报销列表 = await Db.GetListSpAsync<v1_预算已报销详情, 报销Filter>(
                            new 报销Filter()
                            {
                                流程模板编号 = 流程模板编号,
                                项目编号 = 项目编号
                            });
            //这里得到的"编号"是预算编号,考虑到此处是给新增时候用,所以统一设为0;
            foreach (var item in 该项目预算已报销列表)
            {
                item.编号 = 0;
            }
            return 该项目预算已报销列表;
        }

        /// <summary>
        /// 基本资料中的报销金额不用写,后台根据报销详情自己算
        /// 基本资料中的流程模板编号不用写,后台自取;
        /// 注意model.基本资料中的项目编号要提供好;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增纵向项目经费报销([FromBody]报销增改 model)
        {
            await 新增有预算的经费报销(model, 纵向项目立项流程模板编号);
        }

        [HttpPost]
        async public Task 新增横向项目经费报销([FromBody]报销增改 model)
        {
            await 新增有预算的经费报销(model, 横向项目申请流程模板编号);
        }

        private async Task 新增有预算的经费报销(报销增改 model, int 流程模板编号)
        {
            //var valid = await 验证报销费用没有超过预算(model.基本资料.项目编号, 流程模板编号, model.报销详情列表);
            //if (!valid)
            //{
            //    throw new Exception("报销金额超过预算");
            //}

            await 新增经费报销(model, 流程模板编号);
        }

        /// <summary>
        /// 没有预算,
        /// .基本资料中的项目编号要提供,就是相应的参加会议的编号;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增参加会议报销([FromBody]报销增改 model)
        {
            await 新增有预算的经费报销(model, 参加会议流程模板编号);
        }

        //TODO:申请时间已经被废弃了.但是数据库里只是将字段设为了可空;
        private async Task 新增经费报销(报销增改 model, int 流程模板编号)
        {
            model.基本资料.报销金额 = model.报销详情列表.Sum(i => i.报销金额);

            if (model.基本资料.报销金额 <= 0)
            {
                throw new Exception("报销金额错误");
            }

            model.基本资料.流程模板编号 = 流程模板编号;

            await MyWorkFlowBusiness.发起流程(
                            报销流程模板编号,
                            new sp_报销_增改()
                            {
                                tt = model.基本资料.ToDataTable(),
                                tt_报销详情 = model.报销详情列表.ToDataTable()
                            },
                            CurrentUser.编号,
                            model.IsHold);
        }

        //同一项目中的没有终止的报销,其所有细则中,按支出分类+支出内容分类统计,不能超过该项目相同支出分类+支出内容的预算费用;
        //async private Task<bool> 验证报销费用没有超过预算(int 项目编号, int 流程模板编号, IEnumerable<报销详情> 报销详情列表)
        //{
        //    //2018-7-16 根据老板反馈,不需要验证这个,可以超出;
        //    return true;

        //    //var 项目预算已报销详情 = await 获取项目预算已报销详情(项目编号, 流程模板编号);

        //    //if (项目预算已报销详情.Any(i =>
        //    //{
        //    //    var model = 报销详情列表.Where(j => (j.项目支出类型 == i.项目支出类型 && j.项目支出内容 == i.项目支出内容)).FirstOrDefault();

        //    //    //如果报销金额超过了可报销金额,则有错;返回真:有错的数据
        //    //    return (i.经费 - i.已报销金额 < model.报销金额);
        //    //}))
        //    //{
        //    //    //有错误数据
        //    //    return false;
        //    //}
        //    //else
        //    //{
        //    //    return true;
        //    //}
        //}

        /// <summary>
        /// 比如横纵项目经费报销
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 完善有预算的经费报销([FromBody]完成步骤<报销增改> model)
        {
            //var valid = await 验证报销费用没有超过预算(model.附加数据.基本资料.项目编号, model.附加数据.基本资料.流程模板编号, model.附加数据.报销详情列表);
            //if (!valid)
            //{
            //    throw new Exception("报销金额超过预算");
            //}
            await 完善经费报销(model);
        }

        /// <summary>
        /// 比如参加会议的报销
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 完善没有预算的经费报销([FromBody]完成步骤<报销增改> model)
        {
            await 完善经费报销(model);
        }

        private async Task 完善经费报销(完成步骤<报销增改> model)
        {
            model.附加数据.基本资料.报销金额 = model.附加数据.报销详情列表.Sum(i => i.报销金额);

            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_报销_增改()
                {
                    tt = model.附加数据.基本资料.ToDataTable(),
                    tt_报销详情 = model.附加数据.报销详情列表.ToDataTable()
                },
                model.附加数据.IsHold);
        }

        [HttpPost]
        async public Task<object> 上传相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/报销/相关文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }
    }
}