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
    public class BaseInfoController : TeachingManagementBaseController
    {
        /// <summary>
        /// 不会和部门一起更新.
        /// 先有部门在左侧菜单,然后再增改教学科室的信息;
        /// 由于历史原因,sp_部门_增改 的参数写为了"tt_部门",且没有返回;所以这里的Merge<部门>完全不符合要求;
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
    }
}