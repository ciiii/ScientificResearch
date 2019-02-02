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
    public class YProjectController : ScientificResearchBaseController
    {
        public enum 纵向项目分类
        {
            科研项目 = 1, 重点学科 = 2, 人才培养 = 3
        }

        #region 纵向项目申报
        public int 纵向项目申报流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:纵向项目申报");
            }
        }

        [HttpGet]
        async public Task<object> 获取纵向项目申报辅助数据()
        {
            var 学科门类 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "学科门类" }, tbName: "字典", tbFields: "值");
            var 学科类型 = await Db.GetListSpAsync<v1_学科, 学科Filter>(new 学科Filter() { 上级编号 = 0 });
            return new
            {
                学科门类,
                学科类型
            };
        }

        /// <summary>
        /// 新增科研项目申报
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增科研项目申报([FromBody]纵向项目申报增改 model)
        {
            model.基本资料.分类 = (int)纵向项目分类.科研项目;
            await 发起一个纵向项目申报流程(model);
        }

        [HttpPost]
        async public Task 新增重点学科申报([FromBody]纵向项目申报增改 model)
        {
            model.基本资料.分类 = (int)纵向项目分类.重点学科;
            await 发起一个纵向项目申报流程(model);
        }

        [HttpPost]
        async public Task 新增人才培养申报([FromBody]纵向项目申报增改 model)
        {
            model.基本资料.分类 = (int)纵向项目分类.人才培养;
            await 发起一个纵向项目申报流程(model);
        }

        private async Task 发起一个纵向项目申报流程(纵向项目申报增改 model)
        {
            //固定申报人为当前登录人,这句是否有点多余?
            //model.基本资料.申报人编号 = CurrentUser.编号;
            model.基本资料.是否立项 = false;
            await MyWorkFlowBusiness.发起流程(
                            纵向项目申报流程模板编号,
                            new sp_纵向项目申报_增改()
                            {
                                流程模板编号 = 纵向项目申报流程模板编号,
                                tt = model.基本资料.ToDataTable(),
                                tt_项目参与人 = model.参与人列表.ToDataTable()
                            },
                            CurrentUser.编号,//发起人,感觉应该叫该流程对应的项目的负责人;当步骤角色=0时,是这个家伙来执行对应的步骤;
                            model.IsHold);
        }

        [HttpPost]
        async public Task 完善纵向项目申报资料([FromBody]完成步骤<纵向项目申报增改> model)
        {
            //await 内部完善纵向项目申报资料(model);
            model.附加数据.基本资料.是否立项 = false;
            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_纵向项目申报_增改()
                {
                    流程模板编号 = 纵向项目申报流程模板编号,
                    tt = model.附加数据.基本资料.ToDataTable(),
                    tt_项目参与人 = model.附加数据.参与人列表.ToDataTable()
                },
                model.附加数据.IsHold
                );
        }

        /// <summary>
        /// 附加数据中的专家评分,只需要传其中的评分项和评分
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 专家评审([FromBody]完成步骤<IEnumerable<专家评分>> model)
        {
            await MyWorkFlowBusiness.专家评审(model, CurrentUser.编号);
        }

        [HttpPost]
        async public Task<object> 上传伦理批文()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/纵向项目/伦理批文",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传项目申报书()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/纵向项目/项目申报书",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 分页获取科研项目申报(Paging paging, 纵向项目申报Filter filter)
        {
            filter.分类 = (int)纵向项目分类.科研项目;
            return await 分页获取纵向项目申报(paging, filter);
        }

        [HttpGet]
        async public Task<object> 分页获取人才培养申报(Paging paging, 纵向项目申报Filter filter)
        {
            filter.分类 = (int)纵向项目分类.人才培养;
            return await 分页获取纵向项目申报(paging, filter);
        }

        [HttpGet]
        async public Task<object> 分页获取重点学科申报(Paging paging, 纵向项目申报Filter filter)
        {
            filter.分类 = (int)纵向项目分类.重点学科;
            return await 分页获取纵向项目申报(paging, filter);
        }

        private async Task<object> 分页获取纵向项目申报(Paging paging, 纵向项目申报Filter filter) =>
            await Db.GetPagingListSpAsync<object, 纵向项目申报Filter>(
                paging,
                filter,
                $"tfn_纵向项目申报({CurrentUser.编号},{纵向项目申报流程模板编号})");

        [HttpGet]
        async public Task<object> 获取纵向项目申报详情(int 纵向项目申报编号)
        {
            //var r1 = await Db.GetListSpAsync<v2_纵向项目申报_详情, 纵向项目申报Filter>(new 纵向项目申报Filter() { 编号 = 纵向项目申报编号 });
            var r1 = await Db.GetModelByIdSpAsync<v2_纵向项目申报_详情>(纵向项目申报编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_项目参与人({纵向项目申报流程模板编号},{纵向项目申报编号})");
            var r3 = await Db.GetListSpAsync<object>($"tfn_专家评分({纵向项目申报流程模板编号},{纵向项目申报编号})");
            var r4 = await MyWorkFlowBusiness.获取某流程的步骤(纵向项目申报流程模板编号, 纵向项目申报编号);
            
            return new
            {
                申报基本信息 = r1,
                参与人信息 = r2,
                专家评审记录 = r3,
                审核记录 = r4
            };
        }
        #endregion

        #region 纵向项目申报立项

        /// <summary>
        /// 获取纵向项目立项辅助数据,申报立项也一样用
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取纵向项目立项辅助数据()
        {
            var 学科门类 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "学科门类" }, tbName: "字典", tbFields: "值");
            var 学科类型 = await Db.GetListSpAsync<string, 学科Filter>(new 学科Filter() { 上级编号 = 0 }, tbName: "学科", tbFields: "名称");
            var 研究类型 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "研究类别" }, tbName: "字典", tbFields: "值");
            var 国民经济行业 = await Db.GetListSpAsync<国民行业代码, 国民行业代码Filter>(new 国民行业代码Filter() { 上级编号 = 0 });
            var 社会经济目标 = await Db.GetListSpAsync<字典, 字典Filter>(new 字典Filter() { 分类 = "社会经济目标分类" });
            var 合作形式 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "合作形式" }, tbName: "字典", tbFields: "值");
            var 经费模版 = await Db.GetListSpAsync<经费模版, 经费模版Filter>();
            return new
            {
                学科门类,
                学科类型,
                研究类型,
                国民经济行业,
                社会经济目标,
                合作形式
            };
        }

        /// <summary>
        /// 分页获取可立项的科研项目申报
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取可立项的科研项目申报(Paging paging, 纵向项目申报Filter filter)
        {
            filter.分类 = (int)纵向项目分类.科研项目;
            return await 分页获取可立项的纵向项目申报(paging, filter);
        }

        [HttpGet]
        async public Task<object> 分页获取可立项的重点学科申报(Paging paging, 纵向项目申报Filter filter)
        {
            filter.分类 = (int)纵向项目分类.重点学科;
            return await 分页获取可立项的纵向项目申报(paging, filter);
        }

        [HttpGet]
        async public Task<object> 分页获取可立项的人才培养申报(Paging paging, 纵向项目申报Filter filter)
        {
            filter.分类 = (int)纵向项目分类.人才培养;
            return await 分页获取可立项的纵向项目申报(paging, filter);
        }

        private async Task<object> 分页获取可立项的纵向项目申报(Paging paging, 纵向项目申报Filter filter)
        {
            filter.是否立项 = false;
            filter.状态 = 1;
            return await Db.GetPagingListSpAsync<object, 纵向项目申报Filter>(
                 paging,
                 filter,
                 $"tfn_纵向项目申报({CurrentUser.编号},{纵向项目申报流程模板编号})");
        }

        /// <summary>
        /// 打开一个新增立项时,先通过已有的申报来获取可用的立项资料;
        /// 编号,分类,负责人不动,也不应有input可以去动;
        /// </summary>
        /// <param name="纵向项目申报编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 通过申报详情获取可用的纵向项目立项详情(int 纵向项目申报编号)
        {
            //var r1 = await Db.GetListSpAsync<v2_纵向项目申报_详情, 纵向项目申报Filter>(new 纵向项目申报Filter() { 编号 = 纵向项目申报编号 });
            //var r1Result = r1.FirstOrDefault();

            var r1Result = await Db.GetModelByIdSpAsync<v2_纵向项目申报_详情>(纵向项目申报编号);
            if (r1Result == null)
            {
                throw new Exception("没有找到相应的纵向项目申报");
            }
            var r1Change = new v2_纵向项目立项_详情()
            {
                编号 = r1Result.编号,       //will used by 新增纵向项目申报立项 and reset to 0
                分类 = r1Result.分类,
                项目中文名称 = r1Result.项目名称,
                负责人编号 = r1Result.申报人编号,
                负责人姓名 = r1Result.姓名,
                负责人工号 = r1Result.工号,
                负责人部门编号 = r1Result.部门编号,
                负责人部门名称 = r1Result.部门名称,
                计划开始日期 = r1Result.计划开始日期,
                计划完成日期 = r1Result.计划完成日期,
                登记日期 = DateTime.Now,
                批准日期 = DateTime.Now,
                批准经费 = r1Result.申请经费,
                项目等级 = r1Result.项目等级,
                学科门类 = r1Result.学科门类,
                学科类型 = r1Result.学科类型,
                项目类型 = r1Result.项目类型,
                项目级别 = r1Result.项目级别,
                项目来源单位 = r1Result.项目来源单位,
                项目类别 = r1Result.项目类别,
                是否需要伦理评审 = r1Result.是否需要伦理评审,
                是否需要伦理批文 = r1Result.是否需要伦理批文,
                伦理批文编号 = r1Result.伦理批文编号,
                伦理批文路径 = r1Result.伦理批文路径
            };

            var r2 = await Db.GetListSpAsync<object>($"tfn_项目参与人({纵向项目申报流程模板编号},{纵向项目申报编号})");

            return new { 立项基本信息 = r1Change, 参与人信息 = r2 };
        }

        [HttpPost]
        async public Task 新增纵向项目申报立项([FromBody]纵向项目立项增改 model)
        {
            var 来源纵向项目申报编号 = model.基本资料.编号;
            model.基本资料.编号 = 0;
            await 发起一个纵向项目立项流程(model);
            await Db.ExecuteSpAsync(
                new sp_纵向项目申报_设为已立项()
                {
                    项目申报编号 = 来源纵向项目申报编号
                });

        }
        #endregion

        #region 纵向项目立项
        public int 纵向项目立项流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:纵向项目立项");
            }
        }

        [HttpPost]
        async public Task 新增科研项目立项([FromBody]纵向项目立项增改 model)
        {
            model.基本资料.分类 = (int)纵向项目分类.科研项目;
            await 发起一个纵向项目立项流程(model);
        }

        [HttpPost]
        async public Task 新增重点学科立项([FromBody]纵向项目立项增改 model)
        {
            model.基本资料.分类 = (int)纵向项目分类.重点学科;
            await 发起一个纵向项目立项流程(model);
        }

        [HttpPost]
        async public Task 新增人才培养立项([FromBody]纵向项目立项增改 model)
        {
            model.基本资料.分类 = (int)纵向项目分类.人才培养;
            await 发起一个纵向项目立项流程(model);
        }

        /// <summary>
        /// 立项流程的发起人,或者应该叫"该流程对应的项目的负责人"
        /// 有一个步骤是需要这个人来确认资料的;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        private async Task 发起一个纵向项目立项流程(纵向项目立项增改 model)
        {
            //TODO:财务信息里面的预算信息,应该给一个默认模板,同时模板必选,这样就不会让预算信息缺失,最后报销都报不了
            //同样的问题在横向和参与里面都存在;
            if (!验证纵向项目立项增改数据(model))
            {
                throw new Exception("批准经费或配套经费与预算金额不符");
            }

            model.基本资料.登记人编号 = CurrentUser.编号;
            await MyWorkFlowBusiness.发起流程(
                纵向项目立项流程模板编号,
                new sp_纵向项目立项_增改()
                {
                    流程模板编号 = 纵向项目立项流程模板编号,
                    tt = model.基本资料.ToDataTable(),
                    tt_项目参与人 = model.参与人列表.ToDataTable(),
                    tt_项目经费预算 = model.经费预算列表.ToDataTable(),
                    tt_项目计划 = model.计划列表.ToDataTable(),
                    tt_项目预期成果 = model.预期成果列表.ToDataTable()
                },
                CurrentUser.编号,
                model.IsHold,
                model.基本资料.负责人编号
                );
        }

        [HttpPost]
        async public Task 完善纵向项目立项资料([FromBody]完成步骤<纵向项目立项增改> model)
        {
            if (!验证纵向项目立项增改数据(model.附加数据))
            {
                throw new Exception("批准经费或配套经费与预算金额不符");
            }

            await MyWorkFlowBusiness.完成步骤(
                  model.ToSimple(), CurrentUser.编号,
                  new sp_纵向项目立项_增改()
                  {
                      流程模板编号 = 纵向项目立项流程模板编号,
                      tt = model.附加数据.基本资料.ToDataTable(),
                      tt_项目参与人 = model.附加数据.参与人列表.ToDataTable(),
                      tt_项目经费预算 = model.附加数据.经费预算列表.ToDataTable(),
                      tt_项目计划 = model.附加数据.计划列表.ToDataTable(),
                      tt_项目预期成果 = model.附加数据.预期成果列表.ToDataTable()
                  }, model.附加数据.IsHold);
        }

        private bool 验证纵向项目立项增改数据(纵向项目立项增改 model)
        {
            return model.基本资料.批准经费 == model.经费预算列表.Sum(i => i.批准经费) &&
                   model.基本资料.配套经费 == model.经费预算列表.Sum(i => i.配套经费)
                   ? true : false;
        }

        [HttpPost]
        async public Task<object> 上传立项文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/纵向项目/立项文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 分页获取科研项目立项(Paging paging, 纵向项目立项Filter filter)
        {
            filter.分类 = (int)纵向项目分类.科研项目;
            return await 分页获取纵向项目立项列表(paging, filter);
        }

        [HttpGet]
        async public Task<object> 分页获取人才培养立项(Paging paging, 纵向项目立项Filter filter)
        {
            filter.分类 = (int)纵向项目分类.人才培养;
            return await 分页获取纵向项目立项列表(paging, filter);
        }

        [HttpGet]
        async public Task<object> 分页获取重点学科立项(Paging paging, 纵向项目立项Filter filter)
        {
            filter.分类 = (int)纵向项目分类.重点学科;
            return await 分页获取纵向项目立项列表(paging, filter);
        }

        /// <summary>
        /// 科研项目,人才培养,重点学科,这三个的都合并到一起了;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取纵向项目立项(Paging paging, 纵向项目立项Filter filter)
        {
            return await 分页获取纵向项目立项列表(paging, filter);
        }

        private async Task<object> 分页获取纵向项目立项列表(Paging paging, 纵向项目立项Filter filter) =>
            await Db.GetPagingListSpAsync<object, 纵向项目立项Filter>(
                paging,
                filter,
                $"tfn_纵向项目立项({CurrentUser.编号},{纵向项目立项流程模板编号})");

        [HttpGet]
        async public Task<object> 获取纵向项目立项详情(int 纵向项目立项编号)
        {
            //var r1 = await Db.GetListSpAsync<v2_纵向项目立项_详情, 纵向项目立项Filter>(new 纵向项目立项Filter() { 编号 = 纵向项目立项编号 });
            var r1 = await Db.GetModelByIdSpAsync<v2_纵向项目立项_详情>(纵向项目立项编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_项目参与人({纵向项目立项流程模板编号},{纵向项目立项编号})");
            var r3 = await Db.GetListSpAsync<object>($"tfn_项目经费预算({纵向项目立项流程模板编号},{纵向项目立项编号})");
            var r4 = await Db.GetListSpAsync<object>($"tfn_项目计划({纵向项目立项流程模板编号},{纵向项目立项编号})");
            var r5 = await Db.GetListSpAsync<object>($"tfn_项目预期成果({纵向项目立项流程模板编号},{纵向项目立项编号})");
            var r6 = await MyWorkFlowBusiness.获取某流程的步骤(纵向项目立项流程模板编号, 纵向项目立项编号);
            return new { 立项基本信息 = r1, 参与人信息 = r2, 财务信息 = r3, 项目计划与目标 = r4, 项目预期成果 = r5, 审核记录 = r6 };
        }
        #endregion

        #region 纵向项目中检
        public int 纵向项目中检流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:纵向项目中检");
            }
        }

        /// <summary>
        /// 发起一个纵向项目中检
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增纵向项目中检([FromBody]发起纵向项目中检 model)
        {
            var newModel = new 纵向项目中检() { 纵向项目编号 = model.纵向项目立项编号 };
            await MyWorkFlowBusiness.发起流程(
                纵向项目中检流程模板编号,
                new sp_纵向项目中检_增改()
                {
                    tt = newModel.ToDataTable()
                },
                CurrentUser.编号,
                true,   //有权限的人来发起,但不提交这第一步,补全的事情交给负责人去做;
                model.立项登记人编号 //负责人只有从立项信息里面传来
                );
        }

        [HttpPost]
        async public Task 完善纵向项目中检资料([FromBody]完成步骤<纵向项目中检完善> model) =>
            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_纵向项目中检_增改()
                {
                    tt = model.附加数据.基本资料.ToDataTable()
                }, model.附加数据.IsHold);

        //[HttpPost]
        //async public Task 专家评审纵向项目中检([FromBody]完成步骤<IEnumerable<专家评分>> model)
        //{
        //    await MyWorkFlowBusiness.专家评审(model, CurrentUser.编号, 纵向项目中检流程模板编号);
        //}

        [HttpPost]
        async public Task<object> 上传中检资料()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/纵向项目/中检资料",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 分页获取纵向项目中检(Paging paging, 纵向项目中检Filter filter) =>
            await Db.GetPagingListSpAsync<object, 纵向项目中检Filter>(
                paging,
                filter,
                $"tfn_纵向项目中检({CurrentUser.编号},{纵向项目立项流程模板编号},{纵向项目中检流程模板编号})");

        [HttpGet]
        async public Task<object> 获取纵向项目中检详情(int 纵向项目中检编号)
        {
            var r5 = await Db.GetModelByIdSpAsync<纵向项目中检>(纵向项目中检编号);
            var 纵向项目立项编号 = r5.纵向项目编号;
            //var r1 = await Db.GetListSpAsync<v2_纵向项目立项_详情, 纵向项目立项Filter>(new 纵向项目立项Filter() { 编号 = 纵向项目立项编号 });
            var r1 = await Db.GetModelByIdSpAsync<v2_纵向项目立项_详情>(纵向项目立项编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_项目参与人({纵向项目立项流程模板编号},{纵向项目立项编号})");
            var r3 = await Db.GetListSpAsync<object>($"tfn_项目经费预算({纵向项目立项流程模板编号},{纵向项目立项编号})");
            var r4 = await Db.GetListSpAsync<object>($"tfn_项目计划({纵向项目立项流程模板编号},{纵向项目立项编号})");

            //var r5 = await Db.GetListSpAsync<纵向项目中检, 纵向项目中检Filter>(new 纵向项目中检Filter() { 编号 = 纵向项目中检编号 });
            var r6 = await Db.GetListSpAsync<object>($"tfn_专家评分({纵向项目中检流程模板编号},{纵向项目中检编号})");

            var r7 = await MyWorkFlowBusiness.获取某流程的步骤(纵向项目中检流程模板编号, 纵向项目中检编号);
            return new
            {
                立项基本信息 = r1,
                参与人信息 = r2,
                财务信息 = r3,
                项目计划与目标 = r4,
                项目中检信息 = r5,
                中检专家评审 = r6,
                中检审核记录 = r7
            };

        }
        #endregion

        #region 纵向项目变更
        public int 纵向项目变更流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:纵向项目变更");
            }
        }

        /// <summary>
        /// 注意:前台在调用这个接口之前,要注意"纵向项目编号"和"编号"的赋值
        /// "纵向项目编号"是打开新增页面之前就已知的;
        /// "编号"这里=0;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增纵向项目变更([FromBody]纵向项目变更增改 model) =>
            await MyWorkFlowBusiness.发起流程(
                纵向项目变更流程模板编号,
                new sp_纵向项目变更_增改()
                {
                    tt = model.基本资料.ToDataTable()
                }, CurrentUser.编号,
                model.IsHold);

        [HttpPost]
        async public Task 完善纵向项目变更资料([FromBody] 完成步骤<纵向项目变更增改> model)
        {
            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_纵向项目变更_增改()
                {
                    tt = model.附加数据.基本资料.ToDataTable()
                }, model.附加数据.IsHold);
        }

        /// <summary>
        /// 变更最后一步的审核,调这个接口而不是通用的审核接口;
        /// 此步骤仅当操作结果为通过时,交换被变更的立项资料和将变更的立项资料;
        /// 附加数据填写:纵向项目变更编号
        /// </summary>
        /// <param name="纵向项目变更编号"></param>
        /// <returns></returns>
        [HttpPost]
        //TODO: 金额目前不能乱改???要改的话,就要提供配套金额子项的数据;或者不判断金额=子项之和;
        async public Task 审核并应用纵向项目变更([FromBody]完成步骤<int> model)
        {
            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_纵向项目变更_应用变更()
                {
                    纵向项目变更编号 = model.附加数据
                },
                AdditionalActionsWhenState: 1);
        }

        [HttpGet]
        async public Task<object> 分页获取纵向项目变更(Paging paging, 纵向项目变更Filter filter) =>
           await Db.GetPagingListSpAsync<object, 纵向项目变更Filter>(
               paging,
               filter,
               $"tfn_纵向项目变更({CurrentUser.编号},{纵向项目立项流程模板编号},{纵向项目变更流程模板编号})");

        /// <summary>
        /// 获取纵向项目变更详情,包括变更前后的详情;
        /// 如果成功变更,则变更前=立项,变更后=变更
        ///  否则,则变更前=当前变更,变更后=立项;
        /// </summary>
        /// <param name="纵向项目立项编号"></param>
        /// <param name="纵向项目变更编号"></param>
        /// <param name="状态">当前流程的状态</param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取纵向项目变更详情(int 纵向项目变更编号)
        {
            //TODO:还有好办法吗?
            var 该变更流程 = (await Db.GetListSpAsync<流程, 流程Filter>(new 流程Filter() { 流程模板编号 = 纵向项目变更流程模板编号, 项目编号 = 纵向项目变更编号 })).FirstOrDefault();
            int 状态 = 该变更流程.状态;


            var 变更详情 = await Db.GetModelByIdSpAsync<v2_纵向项目变更_详情>(纵向项目变更编号);
            var 纵向项目立项编号 = 变更详情.纵向项目编号;
            if (变更详情 == null)
            {
                throw new Exception("纵向项目变更详情获取失败");
            }
            var 变更中的立项详情 = 获取变更详情中的立项详情数据(变更详情);

            //如果此变更之后还有成功的变更,则立项详情=最近一次的成功变更中的立项信息
            var 之后的成功变更 = (await Db.GetListSpAsync<v2_纵向项目变更_详情>
                ($"tfn_某纵向项目变更之后的第一次成功变更详情({纵向项目立项编号},{纵向项目变更编号})"));

            v2_纵向项目立项_详情 立项详情 = null;

            // 如果没有之后的成功变更,则立项详情从立项表里面取,否则取最近一次成功变更中的立项信息
            if (之后的成功变更.Count() == 0)
            {
                立项详情 = await Db.GetModelByIdSpAsync<v2_纵向项目立项_详情>(纵向项目立项编号);
            }
            else
            {
                立项详情 = 获取变更详情中的立项详情数据(之后的成功变更.FirstOrDefault());
            }

            //var r4 = await MyWorkFlowBusiness.获取某流程的步骤(纵向项目变更流程模板编号, 纵向项目变更编号);
            return new
            {
                变更详情.编号,
                变更详情.变更内容简介,
                变更详情.变更事由,
                变更详情.变更备注,
                变更详情.变更时间,
                变更前 = 状态 == 1 ? 变更中的立项详情 : 立项详情,
                变更后 = 状态 == 1 ? 立项详情 : 变更中的立项详情,
                审核记录 = await MyWorkFlowBusiness.获取某流程的步骤(纵向项目变更流程模板编号, 纵向项目变更编号)
            };
        }

        private v2_纵向项目立项_详情 获取变更详情中的立项详情数据(v2_纵向项目变更_详情 model)
        {
            var 立项详情 = Tool.ModelToModel<v2_纵向项目立项_详情, v2_纵向项目变更_详情>(model);
            立项详情.编号 = model.纵向项目编号;
            return 立项详情;
        }
        #endregion

        #region 纵向项目结题
        public int 纵向项目结题流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:纵向项目结题");
            }
        }

        /// <summary>
        /// 发起一个纵向项目结题;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增纵向项目结题([FromBody]发起纵向项目结题 model)
        {
            var newModel = new 纵向项目结题() { 纵向项目编号 = model.纵向项目立项编号 };
            await MyWorkFlowBusiness.发起流程(
                纵向项目结题流程模板编号,
                new sp_纵向项目结题_增改()
                {
                    tt = newModel.ToDataTable(),
                    tt_项目参与人 = model.参与人列表.ToDataTable()
                },
                CurrentUser.编号,
                true,
                model.立项发起人编号);
        }

        [HttpPost]
        async public Task 完善纵向项目结题资料([FromBody] 完成步骤<纵向项目结题完善> model) =>
            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_纵向项目结题_增改()
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
                "upload/纵向项目/结题资料",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 分页获取纵向项目结题(Paging paging, 纵向项目结题Filter filter) =>
           await Db.GetPagingListSpAsync<object, 纵向项目结题Filter>(
               paging,
               filter,
               $"tfn_纵向项目结题({CurrentUser.编号},{纵向项目立项流程模板编号},{纵向项目中检流程模板编号},{纵向项目变更流程模板编号},{纵向项目结题流程模板编号})");

        [HttpGet]
        async public Task<object> 获取纵向项目结题详情(int 纵向项目结题编号)
        {
            var r7 = await Db.GetModelByIdSpAsync<纵向项目结题>(纵向项目结题编号);
            var 纵向项目立项编号 = r7.纵向项目编号;
            var r1 = await Db.GetModelByIdSpAsync<v2_纵向项目立项_详情>(纵向项目立项编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_项目参与人({纵向项目立项流程模板编号},{纵向项目立项编号})");
            var r3 = await Db.GetListSpAsync<object>($"tfn_项目经费预算({纵向项目立项流程模板编号},{纵向项目立项编号})");
            var r4 = await Db.GetListSpAsync<object>($"tfn_项目计划({纵向项目立项流程模板编号},{纵向项目立项编号})");

            //var r5 = await Db.GetModelByIdSpAsync<纵向项目中检>(纵向项目中检编号);
            //var r6 = await Db.GetListSpAsync<object>($"tfn_专家评分({纵向项目中检流程模板编号},{纵向项目中检编号})");

            var r71 = await Db.GetListSpAsync<object>($"tfn_项目参与人({纵向项目结题流程模板编号},{纵向项目结题编号})");

            var r8 = await Db.GetListSpAsync<object>($"tfn_专家评分({纵向项目结题流程模板编号},{纵向项目结题编号})");
            var r9 = await MyWorkFlowBusiness.获取某流程的步骤(纵向项目结题流程模板编号, 纵向项目结题编号);
            return new
            {
                立项基本信息 = r1,
                立项参与人信息 = r2,
                财务信息 = r3,
                项目计划与目标 = r4,

                //项目中检信息 = r5,
                //中检专家评审 = r6,

                项目结题信息 = r7,
                结题参与人信息 = r71,
                结题专家评审 = r8,
                结题审核记录 = r9
            };

        }
        #endregion
    }
}