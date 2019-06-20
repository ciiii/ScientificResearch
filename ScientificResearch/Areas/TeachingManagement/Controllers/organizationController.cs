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

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    /// <summary>
    /// 和组织架构功能对应;
    /// </summary>
    public class OrganizationController : TeachingManagementBaseController
    {
        /// <summary>
        /// 部门的基础信息相关的接口,都使用ScientificResearch-baseinfo中相关的接口,教学管理不再单独提供;
        /// 并不是每一个部门都是教学科室,只有"是否教学科室"为真的才是,
        /// 设置某个部门为教学科室,用下面"增改教学科室"的接口;
        /// 获取部门列表比较特殊,需要在部门基础信息的之外,提供科室管理员/最大学员人数/带教老师人数等教学信息;
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取部门带教学科室信息(教学科室Filter filter)
        {
            return await Db.GetListSpAsync<v_教学科室, 教学科室Filter>(filter);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="科室编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某科室的教学带教老师(int 科室编号)
        {
            var filter = new 教学带教老师Filter() { 教学科室编号 = 科室编号 };
            return await Db.GetListSpAsync<v_教学带教老师, 教学带教老师Filter>(filter);
        }

        /// <summary>
        /// 不会和部门一起更新.
        /// 先有部门在左侧菜单,然后再增改教学科室的信息;
        /// 由于历史原因,sp_部门_增改 的参数写为了"tt_部门",且没有返回;所以这里的Merge[部门]完全不符合要求;
        /// 这里写试试vs里面的事务,注意这里是同步的mytran,实际应该是写成异步的.参考"增改教学科室以及带教老师"
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改教学科室([FromBody] 教学科室 data)
        {
            Task<教学科室> myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                return dbForTransaction.Merge<教学科室>(data, transaction);
            }

            return await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data">id表示教学科室编号</param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改某教学科室的带教老师([FromBody] PredefindedIdList<教学带教老师> data)
        {
            return await Db.Merge(data.Id, data.List);
        }

        /// <summary>
        /// 这是上面两个合在一起的接口
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改教学科室以及带教老师([FromBody]PredefindedModelList<教学科室, 教学带教老师> data)
        {
            async Task<object> myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 教学科室 = await dbForTransaction.Merge<教学科室>(data.Model, transaction);
                var 带教老师 = await dbForTransaction.Merge<教学带教老师>(教学科室.编号, data.List, transaction);
                return new
                {
                    教学科室,
                    带教老师
                };
            }

            return await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取教学学员(Paging paging, 教学学员Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_教学学员, 教学学员Filter>(paging, filter, orderType: true);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改教学学员([FromBody]教学学员 data)
        {
            return await Db.Merge(data);
        }

        [HttpPost]
        async public Task<object> 上传教学学员头像()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/教学/组织机构/学员头像",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task 导入教学学员()
        //async public Task 导入教学学员(IFormFileCollection files)
        {
            var files = Request.Form.Files;
            var filesNameList = await MyLib.UploadFile.Upload(
               files,
               Env.WebRootPath,
               "upload/教学/组织机构/导入学员",
               Config.GetValue<int>("uploadFileMaxSize"));

            //可以尝试直接用"教学学员"来导入,不过这里先用原来的方法;至少让属性对应的好一些;
            var inputData = MyXls.Import<学员导入>(MyPath.Combine(Env.WebRootPath, filesNameList[0]));
            ////工号|密码|姓名|部门名称都空的删掉
            //result = result.Where(i => !string.IsNullOrWhiteSpace(i.工号) ||
            //                           !string.IsNullOrWhiteSpace(i.密码) ||
            //                           !string.IsNullOrWhiteSpace(i.姓名) ||
            //                           !string.IsNullOrWhiteSpace(i.部门名称));

            //转为字典更好;
            var 教学学员类型list = await Db.GetListSpAsync<教学学员类型>();
            var 教学学员类型dic = 教学学员类型list.ToDictionary(i => i.名称, i => i.编号);

            var 教学专业list = await Db.GetListSpAsync<教学专业>();
            var 教学专业dic = 教学专业list.ToDictionary(i => i.名称, i => i.编号);

            var data = new List<教学学员>();
            foreach (var item in inputData)
            {
                //学员类型名称不对的话,默认给学员类型编号 = 0;
                //item.学员类型编号 = 教学学员类型list.Where(i => i.名称 == item.学员类型名称).FirstOrDefault()?.编号??0;
                //如果学员类型名称不对怎么办?
                item.学员类型编号 = 教学学员类型dic.ContainsKey(item.学员类型名称 ?? "") ? 教学学员类型dic[item.学员类型名称] : 1;
                item.专业编号 = 教学专业dic.ContainsKey(item.专业名称 ?? "") ? 教学专业dic[item.专业名称] : 1;
                data.Add(MyLib.Tool.ModelToModel< 学员导入, 教学学员>(item));
            }

            TryValidateModel(data);

            await Db.ExecuteSpAsync(new sp_教学学员_导入() { tt = data.AsEnumerable().ToDataTable() });
        }
    }
}