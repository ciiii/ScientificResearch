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
using System.IO;
using Microsoft.AspNetCore.Http;

namespace ScientificResearch.Controllers
{
    public class PeopleController : ScientificResearchBaseController
    {
        private int 专家角色组编号
        {
            get
            {
                return Config.GetValue<int>("系统角色组编号:专家");
            }
        }

        private int 科研人员角色组编号
        {
            get
            {
                return Config.GetValue<int>("系统角色组编号:科研人员");
            }
        }

        private int 学术任职流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:学术任职");
            }
        }

        /// <summary>
        /// 分页获取人员列表,人员管理时候用
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<PagingResult<v1_人员_带部门名>> 分页获取人员列表(Paging paging, 人员Filter filter) =>
            await Db.GetPagingListSpAsync<v1_人员_带部门名, 人员Filter>(paging, filter);

        [HttpGet]
        async public Task<v1_人员_带部门名> 获取某人员详情(int 人员编号) =>
            await Db.GetModelByIdSpAsync<v1_人员_带部门名>(人员编号);

        [HttpGet]
        async public Task<object> 获取人员详情辅助数据()
        {
            var 民族 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "民族" }, tbName: "字典", tbFields: "值");
            var 政治面貌 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "政治面貌" }, tbName: "字典", tbFields: "值");
            var 人员类别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "人员类别" }, tbName: "字典", tbFields: "值");
            var 人员类型 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "人员类型" }, tbName: "字典", tbFields: "值");
            var 岗位名称 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "岗位名称" }, tbName: "字典", tbFields: "值");
            var 岗位类型 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "岗位类型" }, tbName: "字典", tbFields: "值");
            var 岗位性质 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "岗位性质" }, tbName: "字典", tbFields: "值");
            var 学历 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "学历" }, tbName: "字典", tbFields: "值");
            var 学位 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "学位" }, tbName: "字典", tbFields: "值");
            var 学科门类 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "学科门类" }, tbName: "字典", tbFields: "值");
            var 学制 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "学制" }, tbName: "字典", tbFields: "值");
            var 所学专业 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "所学专业" }, tbName: "字典", tbFields: "值");
            var 学习形式 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "学习形式" }, tbName: "字典", tbFields: "值");
            var 学历性质 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "学历性质" }, tbName: "字典", tbFields: "值");
            var 个人身份 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "个人身份" }, tbName: "字典", tbFields: "值");
            var 职位 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "职位" }, tbName: "字典", tbFields: "值");
            var 职位级别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "职位级别" }, tbName: "字典", tbFields: "值");
            var 专业技术级别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "专业技术级别" }, tbName: "字典", tbFields: "值");
            var 技术职称分类 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "技术职称分类" }, tbName: "字典", tbFields: "值");

            return new
            {
                民族,
                政治面貌,
                人员类别,
                人员类型,
                岗位名称,
                岗位类型,
                岗位性质,
                学历,
                学位,
                学科门类,
                学制,
                所学专业,
                学习形式,
                学历性质,
                个人身份,
                职位,
                职位级别,
                专业技术级别,
                技术职称分类
            };
        }

        /// <summary>
        /// 分页获取启用状态的人员列表,使用人员时候用
        /// 这个可能应该缩减一下返回的字段.
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<PagingResult<v1_人员_带部门名>> 分页获取启用的人员列表(Paging paging, 人员Filter filter)
        {
            filter.是否启用 = true;
            return await Db.GetPagingListSpAsync<v1_人员_带部门名, 人员Filter>(paging, filter);
        }


        /// <summary>
        /// 获取所有人员列表,应该用不到
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<IEnumerable<v1_人员_带部门名>> 获取所有人员列表(人员Filter filter) =>
            await Db.GetListSpAsync<v1_人员_带部门名, 人员Filter>(filter);

        /// <summary>
        /// 增改人员
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改人员([FromBody]人员 model) =>
            await Db.ExecuteSpAsync(new sp_人员_增改() { tt = model.ToDataTable() });

        [HttpPost]
        async public Task 导入人员()
        {
            IEnumerable<人员导入> result = await 提取人员信息(Request.Form.Files);
            await Db.ExecuteSpAsync(new sp_人员_导入() { tt = result.ToDataTable() });
        }

        private async Task<IEnumerable<人员导入>> 提取人员信息(IFormFileCollection files)
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                           files,
                           Env.WebRootPath,
                           "upload/基础信息/导入人员",
                           Config.GetValue<int>("uploadFileMaxSize"));

            var result = MyXls.Import<人员导入>(MyPath.Combine(Env.WebRootPath, filesNameList[0]));
            //var result = MyXls.Import<人员导入>(Path.Combine(Env.WebRootPath, filesNameList[0]));

            //var f = "C:\\Users\\Administrator\\Desktop\\导入人员模板.xlsx";
            //var result = MyXls.Import<人员导入>(f);

            //工号|密码|姓名|部门名称都空的删掉
            result = result.Where(i => !string.IsNullOrWhiteSpace(i.工号) ||
                                       !string.IsNullOrWhiteSpace(i.密码) ||
                                       !string.IsNullOrWhiteSpace(i.姓名) ||
                                       !string.IsNullOrWhiteSpace(i.部门名称));

            TryValidateModel(result);
            return result;
        }

        /// <summary>
        /// 启用人员
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 启用人员([FromBody]int id) =>
            await Db.ExecuteSpAsync(new sp_人员_启禁() { 编号 = id, 是否启用 = true });

        /// <summary>
        /// 禁用人员
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 禁用人员([FromBody]int id) =>
            await Db.ExecuteSpAsync(new sp_人员_启禁() { 编号 = id, 是否启用 = false });

        #region 专家人才
        /// <summary>
        /// 分页获取专家
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<PagingResult<v1_人员_带部门名>> 分页获取专家(Paging paging, 人员Filter filter)
        {
            return await Db.GetPagingListSpAsync<v1_人员_带部门名, 人员Filter>(paging, filter, $"tfn_角色中的人员({专家角色组编号})");
        }

        [HttpGet]
        async public Task<PagingResult<v1_人员_带部门名>> 分页获取不是专家的人员(Paging paging, 人员Filter filter) =>
            await Db.GetPagingListSpAsync<v1_人员_带部门名, 人员Filter>(paging, filter, $"tfn_角色中没有的人员({专家角色组编号})");

        /// <summary>
        /// 从现有人员增加专家
        /// </summary>
        /// <param name="编号列表"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 从现有人员增加专家([FromBody]IEnumerable<int> 编号列表)
        {
            await Db.ExecuteSpAsync(new sp_角色中的人员_增()
            {
                角色编号 = 专家角色组编号,
                人员编号 = 编号列表.ToPredefindedKeyFieldsList().ToDataTable()
            });
        }

        /// <summary>
        /// 新增专家
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增专家([FromBody]人员 model) =>
            await Db.ExecuteSpAsync(new sp_角色中的人员_新增人员同时到角色()
            {
                角色编号 = 专家角色组编号,
                tt = model.ToDataTable()
            });

        [HttpPost]
        async public Task 删除专家([FromBody]IEnumerable<int> 编号列表) =>
            await Db.ExecuteSpAsync(new sp_角色中的人员_删()
            {
                角色编号 = 专家角色组编号,
                人员编号 = 编号列表.ToPredefindedKeyFieldsList().ToDataTable()
            });
        #endregion

        #region 科研人员
        [HttpGet]
        async public Task<PagingResult<v1_人员_带部门名>> 分页获取科研人员(Paging paging, 人员Filter filter)
        {
            return await Db.GetPagingListSpAsync<v1_人员_带部门名, 人员Filter>(paging, filter, $"tfn_角色中的人员({科研人员角色组编号})");
        }

        [HttpGet]
        async public Task<PagingResult<v1_人员_带部门名>> 分页获取非科研人员(Paging paging, 人员Filter filter) =>
            await Db.GetPagingListSpAsync<v1_人员_带部门名, 人员Filter>(paging, filter, $"tfn_角色中没有的人员({科研人员角色组编号})");

        [HttpPost]
        async public Task 从现有人员增加科研人员([FromBody]IEnumerable<int> 编号列表)
        {
            await Db.ExecuteSpAsync(new sp_角色中的人员_增()
            {
                角色编号 = 科研人员角色组编号,
                人员编号 = 编号列表.ToPredefindedKeyFieldsList().ToDataTable()
            });
        }

        [HttpPost]
        async public Task 新增科研人员([FromBody]人员 model) =>
           await Db.ExecuteSpAsync(new sp_角色中的人员_新增人员同时到角色()
           {
               角色编号 = 科研人员角色组编号,
               tt = model.ToDataTable()
           });

        [HttpPost]
        async public Task 删除科研人员([FromBody]IEnumerable<int> 编号列表) =>
           await Db.ExecuteSpAsync(
               new sp_角色中的人员_删()
               {
                   角色编号 = 科研人员角色组编号,
                   人员编号 = 编号列表.ToPredefindedKeyFieldsList().ToDataTable()
               });
        #endregion

        #region 学术任职

        [HttpPost]
        async public Task 新增学术任职([FromBody]任职增改 model)
        {
            model.基本资料.任职人员编号 = CurrentUser.编号;
            await MyWorkFlowBusiness.发起流程(
                学术任职流程模板编号,
                new sp_任职_增改()
                {
                    tt = model.基本资料.ToDataTable()
                },
                CurrentUser.编号,
                model.IsHold);
        }

        [HttpPost]
        async public Task 完善学术任职([FromBody]完成步骤<任职增改> model) =>
            await MyWorkFlowBusiness.完成步骤(
                model.ToSimple(), CurrentUser.编号,
                new sp_任职_增改()
                {
                    tt = model.附加数据.基本资料.ToDataTable()
                },
                model.附加数据.IsHold);

        [HttpPost]
        async public Task<object> 上传学术任职相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/组织架构/学术任职",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 分页获取我的学术任职(Paging paging, 任职Filter filter)
        {
            filter.任职人员编号 = CurrentUser.编号;
            return await Db.GetPagingListSpAsync<object, 任职Filter>(
                  paging,
                  filter,
                  $"tfn_任职({CurrentUser.编号},{学术任职流程模板编号})");
        }

        [HttpGet]
        async public Task<object> 分页获取学术任职(Paging paging, 任职Filter filter) =>
            await Db.GetPagingListSpAsync<object, 任职Filter>(
                paging,
                filter,
                $"tfn_任职({CurrentUser.编号},{学术任职流程模板编号})");

        [HttpGet]
        async public Task<object> 获取学术任职详情(int 任职编号)
        {
            var r1 = await Db.GetModelByIdSpAsync<v2_任职>(任职编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_步骤({学术任职流程模板编号},{任职编号})", orderType: true);
            return new { 学术任职详情 = r1, 审核情况 = r2 };
        }

        #endregion

    }
}