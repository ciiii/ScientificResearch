using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using MyLib;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.ContinuousTraining.Controllers
{
    /// <summary>
    /// 和组织架构功能对应;
    /// </summary>
    public class OrganizationController : ContinuousTrainingBaseController
    {
        #region 部门
        /// <summary>
        /// 获取全部部门,维护部门时用
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<IEnumerable<v1_部门>> 获取部门列表(部门Filter filter) =>
            await Db.GetListSpAsync<v1_部门, 部门Filter>(filter);

        /// <summary>
        /// 获取启用的部门列表,使用部门时用
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<IEnumerable<v1_部门>> 获取启用的部门列表(部门Filter filter)
        {
            filter.是否启用 = true;
            return await Db.GetListSpAsync<v1_部门, 部门Filter>(filter);
        }

        /// <summary>
        /// 新增部门
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改部门([FromBody]部门 model) =>
            await Db.ExecuteSpAsync(new sp_部门_增改()
            {
                tt_部门 = model.ToDataTable()
            });

        /// <summary>
        /// 启用某部门
        /// </summary>
        /// <param name="编号"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 启用部门([FromBody]int 编号) =>
            await Db.ExecuteSpAsync(new sp_部门_启禁()
            {
                编号 = 编号,
                是否启用 = true
            });

        /// <summary>
        /// 禁用某部门
        /// </summary>
        /// <param name="编号"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 禁用部门([FromBody]int 编号) =>
            await Db.ExecuteSpAsync(new sp_部门_启禁()
            {
                编号 = 编号,
                是否启用 = false
            });
        #endregion

        #region 继教科室
        /// <summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某继教科室信息及助教老师(int 科室编号)
        {
            var filter = new 继教助教老师Filter() { 科室编号 = 科室编号 };

            return new
            {
                继教科室 = await Db.GetModelByIdSpAsync<v_继教科室>(科室编号),
                助教老师 = await Db.GetListSpAsync<v_继教助教老师, 继教助教老师Filter>(filter)
            };

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="科室编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某科室的继教助教老师(int 科室编号)
        {
            var filter = new 继教助教老师Filter() { 科室编号 = 科室编号 };
            return await Db.GetListSpAsync<v_继教助教老师, 继教助教老师Filter>(filter);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改继教科室及助教老师([FromBody] PredefindedModelList<继教科室, 继教助教老师> data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 继教科室 = await dbForTransaction.Merge<继教科室>(data.Model, transaction);

                var 现有的继教科室 = await dbForTransaction.GetListSpAsync<继教科室>(transaction:transaction);

                var 科室管理员角色编号 = (int)继教角色enum.科室管理员;

                var 现有的科室管理员人员角色 = 现有的继教科室.Select(i => i.科室管理员编号).Distinct().Select(i => new 继教人员角色()
                {
                    继教角色编号 = 科室管理员角色编号,
                    人员编号 = i
                });

                //更新"继教人员角色"中的 科室管理员角色 所包含的科室管理员;
                await dbForTransaction.Merge(科室管理员角色编号, 现有的科室管理员人员角色, transaction);

                var 继教助教老师 = await dbForTransaction.Merge(继教科室.编号, data.List, transaction);

                var 现有的继教助教老师 = await dbForTransaction.GetListSpAsync<继教助教老师>(transaction:transaction);

                var 助教老师角色编号 = (int)继教角色enum.助教老师;

                var 现有的助教老师人员角色 = 现有的继教助教老师.Select(i => i.助教老师编号).Distinct().Select(i => new 继教人员角色()
                {
                    继教角色编号 = 助教老师角色编号,
                    人员编号 = i
                });

                //更新"继教人员角色"中的 助教老师角色 所包含的助教老师;
                await dbForTransaction.Merge(助教老师角色编号, 现有的助教老师人员角色, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }
        #endregion

        #region 人员
        /// <summary>
        /// 分页获取继教人员列表,人员管理时候用
        /// 注意,这里面并非所有的都需要,参考原系统做取舍
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<PagingResult<v_继教人员_带部门名>> 分页获取人员列表(Paging paging, 继教人员Filter filter) =>
            await Db.GetPagingListSpAsync<v_继教人员_带部门名, 继教人员Filter>(paging, filter);

        [HttpGet]
        async public Task<v_继教人员_带部门名> 获取某人员详情(int 人员编号) =>
            await Db.GetModelByIdSpAsync<v_继教人员_带部门名>(人员编号);

        /// <summary>
        /// 注意,这里面并非所有的都需要,参考原系统做取舍
        /// </summary>
        /// <returns></returns>
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
            var 能级 = await Db.GetListSpAsync<继教能级>();

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
                技术职称分类,
                能级
            };
        }

        /// <summary>
        /// 增改人员,包括了人员的基本信息和继教人员的信息;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改人员([FromBody]增改继教人员 model)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 人员 = await dbForTransaction.Merge(model.人员, transaction);
                model.继教人员.编号 = 人员.编号;
                await dbForTransaction.Merge(model.继教人员, transaction);

            }
            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 这里是复制科研里面相关功能,然后增加了一个能级属性.以后要统一 
        /// 模板在 upload/继教/组织结构/导入继教人员模板.xlsx
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        async public Task 导入继教人员()
        {
            IEnumerable<继教人员导入> result = await 提取人员信息(Request.Form.Files);
            await Db.ExecuteSpAsync(new sp_继教人员_导入() { tt = result.ToDataTable() });
        }

        private async Task<IEnumerable<继教人员导入>> 提取人员信息(IFormFileCollection files)
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                           files,
                           Env.WebRootPath,
                           "upload/继教/组织结构",
                           Config.GetValue<int>("uploadFileMaxSize"));

            var result = MyXls.Import<继教人员导入>(MyPath.Combine(Env.WebRootPath, filesNameList[0]));

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

        #endregion
    }
}