using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using MyLib;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    public class StatisticalController : TeachingManagementBaseController
    {
        [HttpGet]
        public object 获取教学学员培训状态列表()
        {
            return Enum.GetNames(typeof(教学学员培训状态));
        }

        /// <summary>
        /// 搜索条件里面的状态暂时不要用;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取学员招录统计(教学学员培训情况Filter filter)
        {
            var 按状态统计 = await Db.QuerySpAsync<sp_分类统计数量, object>(
                new sp_分类统计数量()
                {
                    tableName = nameof(v_教学学员培训情况),
                    whereStr = SqlWhereMapper.toWhere(filter),
                    groupStr = nameof(v_教学学员培训情况.状态)
                });

            var 按培训年界统计所有学员 = await Db.QuerySpAsync<sp_分类统计数量, object>(
                new sp_分类统计数量()
                {
                    tableName = nameof(v_教学学员培训情况),
                    whereStr = SqlWhereMapper.toWhere(filter),
                    groupStr = nameof(v_教学学员培训情况.学员培训年界)
                });

            var tempFilter = MyObject.CreateDeepCopy(filter);
            tempFilter.状态 = 教学学员培训状态.结业.ToString();
            var 按培训年界统计结业学员 = await Db.QuerySpAsync<sp_分类统计数量, object>(
                new sp_分类统计数量()
                {
                    tableName = nameof(v_教学学员培训情况),
                    whereStr = SqlWhereMapper.toWhere(tempFilter),
                    groupStr = nameof(v_教学学员培训情况.学员培训年界)
                });

            var 按专业名称统计 = await Db.QuerySpAsync<sp_分类统计数量, object>(
               new sp_分类统计数量()
               {
                   tableName = nameof(v_教学学员培训情况),
                   whereStr = SqlWhereMapper.toWhere(filter),
                   groupStr = nameof(v_教学学员培训情况.专业名称)
               });

            var 按送培方式统计 = await Db.QuerySpAsync<sp_分类统计数量, object>(
               new sp_分类统计数量()
               {
                   tableName = nameof(v_教学学员培训情况),
                   whereStr = SqlWhereMapper.toWhere(filter),
                   groupStr = nameof(v_教学学员培训情况.送培方式)
               });


            var 按学历统计 = await Db.QuerySpAsync<sp_分类统计数量, object>(
               new sp_分类统计数量()
               {
                   tableName = nameof(v_教学学员培训情况),
                   whereStr = SqlWhereMapper.toWhere(filter),
                   groupStr = nameof(v_教学学员培训情况.最高学历)
               });

            return new
            {
                按状态统计,
                按培训年界统计所有学员,
                按培训年界统计结业学员,
                按专业名称统计,
                按送培方式统计,
                按学历统计
            };
        }

        /// <summary>
        /// 即对轮转和轮转中的任务的统计
        /// 条件里面的状态暂时不要用;时间范围条件比较常用;
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取学员培训统计(v_教学轮转Filter filter)
        {
            var 按状态统计轮转 = await Db.QuerySpAsync<sp_分类统计数量, object>(
               new sp_分类统计数量()
               {
                   tableName = nameof(v_教学轮转),
                   whereStr = SqlWhereMapper.toWhere(filter),
                   groupStr = nameof(v_教学轮转.状态)
               });

            var 按本院科室统计轮转 =await Db.QuerySpAsync<sp_分类统计数量, object>(
               new sp_分类统计数量()
               {
                   tableName = nameof(v_教学轮转),
                   whereStr = SqlWhereMapper.toWhere(filter),
                   groupStr = nameof(v_教学轮转.本院科室名称)
               });

            //按本院科室统计的已出科轮转;
            filter.状态 = 教学轮转状态.已出科.ToString();
            var 按本院科室统计已出科轮转 = await Db.QuerySpAsync<sp_分类统计数量, object>(
               new sp_分类统计数量()
               {
                   tableName = nameof(v_教学轮转),
                   whereStr = SqlWhereMapper.toWhere(filter),
                   groupStr = nameof(v_教学轮转.本院科室名称)
               });

            //按本院科室统计的在科轮转
            filter.状态 = 教学轮转状态.在科.ToString();
            var 按本院科室统计在科轮转 = await Db.QuerySpAsync<sp_分类统计数量, object>(
                new sp_分类统计数量
                {
                    tableName = nameof(v_教学轮转),
                    whereStr = SqlWhereMapper.toWhere(filter),
                    groupStr = nameof(v_教学轮转.本院科室名称)
                });

            //按本院科室统计的未入科轮转
            filter.状态 = 教学轮转状态.未入科.ToString();
            var 按本院科室统计未入科轮转 = await Db.QuerySpAsync<sp_分类统计数量, object>(
                new sp_分类统计数量
                {
                    tableName = nameof(v_教学轮转),
                    whereStr = SqlWhereMapper.toWhere(filter),
                    groupStr = nameof(v_教学轮转.本院科室名称)
                });

            return new
            {
                按状态统计轮转,
                按本院科室统计轮转,
                按本院科室统计已出科轮转,
                按本院科室统计在科轮转,
                按本院科室统计未入科轮转
            };
        }
    }
}