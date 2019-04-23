using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

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
        async public Task<object> 获取部门列表(v_教学科室Filter filter)
        {
            return await Db.GetListSpAsync<v_教学科室, v_教学科室Filter>(filter);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="科室编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某科室的教学带教老师(int 科室编号)
        {
            var filter = new v_教学带教老师Filter() { 教学科室编号 = 科室编号 };
            return await Db.GetListSpAsync<v_教学带教老师, v_教学带教老师Filter>(filter);
        }

        /// <summary>
        /// 不会和部门一起更新.
        /// 先有部门在左侧菜单,然后再增改教学科室的信息;
        /// 由于历史原因,sp_部门_增改 的参数写为了"tt_部门",且没有返回;所以这里的Merge[部门]完全不符合要求;
        /// 这里写试试vs里面的事务
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 增改教学科室([FromBody] 教学科室 data)
        {
            Task<教学科室> myTran(SqlConnection dbForTransaction, SqlTransaction transaction) =>
                dbForTransaction.Merge<教学科室>(data, transaction);

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
            foreach (var item in data.List)
            {
                item.教学科室编号 = data.Id;
            }

            return await Db.Merge(data.Id,data.List);
        }
    }
}