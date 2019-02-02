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
    public class XProjectController : ScientificResearchBaseController
    {
        #region 横向项目申请
        public int 横向项目申请流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:横向项目申请");
            }
        }

        [HttpGet]
        async public Task<object> 获取横向项目辅助数据()
        {
            return new
            {
                合同付款方式 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "合同付款方式" }, tbName: "字典", tbFields: "值"),
                合作形式 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "合作形式" }, tbName: "字典", tbFields: "值"),
                研究类别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "研究类别" }, tbName: "字典", tbFields: "值"),
                技术领域 = await Db.GetListSpAsync<技术领域, 技术领域Filter>(new 技术领域Filter() { 上级编号 = 0 }),
                合同类型 = await Db.GetListSpAsync<字典, 字典Filter>(new 字典Filter() { 分类 = "合同类型大类" }),
                经费模版 = await Db.GetListSpAsync<经费模版, 经费模版Filter>(),
                知识产权 = await Db.GetListSpAsync<字典, 字典Filter>(new 字典Filter() { 分类 = "知识产权分类" }),
                计划来源 = await Db.GetListSpAsync<字典, 字典Filter>(new 字典Filter() { 分类 = "计划来源分类" }),
                社会经济目标 = await Db.GetListSpAsync<字典, 字典Filter>(new 字典Filter() { 分类 = "社会经济目标分类" }),
                国民经济行业 = await Db.GetListSpAsync<国民行业代码, 国民行业代码Filter>(new 国民行业代码Filter() { 上级编号 = 0 }),
                合同买方性质 = await Db.GetListSpAsync<合同买方性质, 合同买方性质Filter>(new 合同买方性质Filter() { 上级编号 = 0 }),
                区域 = await Db.GetListSpAsync<区域, 区域Filter>(new 区域Filter() { 上级编号 = 0 }),

            };
        }

        /// <summary>
        /// 注:横向项目经费预算中的配套经费设为0,没用
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增横向项目申请([FromBody]横向项目申请增改 model)
        {
            if (!验证横向项目申请增改资料(model))
            {
                throw new Exception("经费预算总额与合同金额不符");
            }

            await MyWorkFlowBusiness.发起流程(
                            横向项目申请流程模板编号,
                            new sp_横向项目_增改()
                            {
                                流程模板编号 = 横向项目申请流程模板编号,
                                tt = model.基本资料.ToDataTable(),
                                tt_项目参与人 = model.参与人列表.ToDataTable(),
                                tt_项目经费预算 = model.经费预算列表.ToDataTable()
                            },
                            CurrentUser.编号,
                            model.IsHold);
        }

        /// <summary>
        /// 注:横向项目经费预算中的配套经费设为0,没用
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 完善横向项目申请资料([FromBody]完成步骤<横向项目申请增改> model)
        {
            if (!验证横向项目申请增改资料(model.附加数据))
            {
                throw new Exception("经费预算总额与合同金额不符");
            }

            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_横向项目_增改()
                {
                    流程模板编号 = 横向项目申请流程模板编号,
                    tt = model.附加数据.基本资料.ToDataTable(),
                    tt_项目参与人 = model.附加数据.参与人列表.ToDataTable(),
                    tt_项目经费预算 = model.附加数据.经费预算列表.ToDataTable()
                }, model.附加数据.IsHold);
        }

        private bool 验证横向项目申请增改资料(横向项目申请增改 model)
        {
            return model.基本资料.合同金额 == model.经费预算列表.Sum(i => i.批准经费) ? true : false;
        }

        [HttpPost]
        async public Task<object> 上传合同认定登记承诺书()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/横向项目/合同认定登记承诺书",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传合同文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/横向项目/合同文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;

            //return Content(Newtonsoft.Json.JsonConvert.SerializeObject(filesNameList.FirstOrDefault()),"text/html");
        }

        [HttpGet]
        async public Task<object> 分页获取横向项目(Paging paging, 横向项目Filter filter)
        {
            return await Db.GetPagingListSpAsync<object, 横向项目Filter>(paging, filter, $"tfn_横向项目({CurrentUser.编号},{横向项目申请流程模板编号})");
        }

        [HttpGet]
        async public Task<object> 获取横向项目详情(int 横向项目编号)
        {
            var r1 = await Db.GetModelByIdSpAsync<v2_横向项目_详情>(横向项目编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_项目参与人({横向项目申请流程模板编号},{横向项目编号})");
            var r3 = await Db.GetListSpAsync<object>($"tfn_项目经费预算({横向项目申请流程模板编号},{横向项目编号})");
            var r6 = await MyWorkFlowBusiness.获取某流程的步骤(横向项目申请流程模板编号, 横向项目编号);
            return new { 基本信息 = r1, 参与人信息 = r2, 财务信息 = r3, 审核记录 = r6 };
        }
        #endregion

        #region 横向项目变更
        public int 横向项目变更流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:横向项目变更");
            }
        }

        [HttpPost]
        async public Task 新增横向项目变更([FromBody]横向项目变更增改 model) =>
            await MyWorkFlowBusiness.发起流程(
                横向项目变更流程模板编号,
                new sp_横向项目变更_增改()
                {
                    tt = model.基本资料.ToDataTable()
                },
                CurrentUser.编号,
                model.IsHold);

        [HttpPost]
        async public Task 完善横向项目变更资料([FromBody]完成步骤<横向项目变更增改> model) =>
            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_横向项目变更_增改()
                {
                    tt = model.附加数据.基本资料.ToDataTable()
                }, model.附加数据.IsHold);

        [HttpPost]
        async public Task 审核并应用横向项目变更([FromBody]完成步骤<int> model)
        {
            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_横向项目变更_应用变更()
                {
                    横向项目变更编号 = model.附加数据
                },
                AdditionalActionsWhenState: 1);
        }

        [HttpGet]
        async public Task<object> 分页获取横向项目变更(Paging paging, 横向项目变更Filter filter) =>
            await Db.GetPagingListSpAsync<object, 横向项目变更Filter>(
                paging,
                filter,
                $"tfn_横向项目变更({CurrentUser.编号},{横向项目申请流程模板编号},{横向项目变更流程模板编号})");

        [HttpGet]
        async public Task<object> 获取横向项目变更详情(int 横向项目变更编号)
        {
            var 该变更流程 = (await Db.GetListSpAsync<流程, 流程Filter>(new 流程Filter() { 流程模板编号 = 横向项目变更流程模板编号, 项目编号 = 横向项目变更编号 })).FirstOrDefault();
            int 状态 = 该变更流程.状态;

            var 变更详情 = await Db.GetModelByIdSpAsync<v2_横向项目变更_详情>(横向项目变更编号);
            var 横向项目编号 = 变更详情.横向项目编号;

            if (变更详情 == null)
            {
                throw new Exception("横向项目变更详情获取失败");

            }
            var 变更中的项目详情 = 获取变更详情中的项目详情数据(变更详情);

            var 之后的成功变更 = (await Db.GetListSpAsync<v2_横向项目变更_详情>
               ($"tfn_某横向项目变更之后的第一次成功变更详情({横向项目编号},{横向项目变更编号})"));

            v2_横向项目_详情 项目详情 = null;

            // 如果没有之后的成功变更,则立项详情从立项表里面取,否则取最近一次成功变更中的立项信息
            if (之后的成功变更.Count() == 0)
            {
                项目详情 = await Db.GetModelByIdSpAsync<v2_横向项目_详情>(横向项目编号);
            }
            else
            {
                项目详情 = 获取变更详情中的项目详情数据(之后的成功变更.FirstOrDefault());
            }

            var 审核记录 = await MyWorkFlowBusiness.获取某流程的步骤(横向项目变更流程模板编号, 横向项目变更编号);

            return new
            {
                变更详情.编号,
                变更详情.变更内容简介,
                变更详情.变更事由,
                变更详情.变更备注,
                变更详情.变更时间,
                变更前 = 状态 == 1 ? 变更中的项目详情 : 项目详情,
                变更后 = 状态 == 1 ? 项目详情 : 变更中的项目详情,
                审核记录
            };
        }

        private v2_横向项目_详情 获取变更详情中的项目详情数据(v2_横向项目变更_详情 model)
        {
            var 项目详情 = Tool.ModelToModel<v2_横向项目_详情, v2_横向项目变更_详情>(model);
            项目详情.编号 = model.横向项目编号;
            return 项目详情;
        }
        #endregion

        #region 横向项目结题
        public int 横向项目结题流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:横向项目结题");
            }
        }

        /// <summary>
        /// 发起一个横向项目结题
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增横向项目结题([FromBody]横向项目结题增改 model)
        {
            var newModel = new 横向项目结题() { 横向项目编号 = model.横向项目申请编号 };
            await MyWorkFlowBusiness.发起流程(
                横向项目结题流程模板编号,
                new sp_横向项目结题_增改()
                {
                    tt = newModel.ToDataTable(),
                    tt_项目参与人 = model.参与人列表.ToDataTable()
                },
                CurrentUser.编号,
                true,
                model.申请发起人编号);
        }

        [HttpPost]
        async public Task 完善横向项目结题资料([FromBody]完成步骤<横向项目结题完善> model) =>
            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_横向项目结题_增改()
                {
                    tt = model.附加数据.基本资料.ToDataTable(),
                    tt_项目参与人 = model.附加数据.参与人列表.ToDataTable()
                }, model.附加数据.IsHold);

        [HttpPost]
        async public Task<object> 上传结题资料()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/横向项目/结题资料",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 分页获取横向项目结题(Paging paging, 横向项目结题Filter filter) =>
            await Db.GetPagingListSpAsync<object, 横向项目结题Filter>(
                paging,
                filter,
                $"tfn_横向项目结题({CurrentUser.编号},{横向项目申请流程模板编号},{横向项目变更流程模板编号},{横向项目结题流程模板编号})");

        [HttpGet]
        async public Task<object> 获取横向项目结题详情(int 横向项目结题编号)
        {
            var r4 = await Db.GetModelByIdSpAsync<横向项目结题>(横向项目结题编号);
            var 横向项目申请编号 = r4.横向项目编号;
            var r1 = await Db.GetModelByIdSpAsync<v2_横向项目_详情>(横向项目申请编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_项目参与人({横向项目申请流程模板编号},{横向项目申请编号})");
            var r3 = await Db.GetListSpAsync<object>($"tfn_项目经费预算({横向项目申请流程模板编号},{横向项目申请编号})");
            var r41 = await Db.GetListSpAsync<object>($"tfn_项目参与人({横向项目结题流程模板编号},{横向项目结题编号})");
            var r5 = await MyWorkFlowBusiness.获取某流程的步骤(横向项目结题流程模板编号, 横向项目结题编号);
            return new
            {
                项目信息 = r1,
                参与人信息 = r2,
                财务信息 = r3,
                项目结题信息 = r4,
                结题参与人信息 = r41,
                结题审核记录 = r5
            };
        }
        #endregion
    }
}