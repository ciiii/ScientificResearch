using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MyLib;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Controllers
{
    public class StatisticalController : BaseController
    {
        [HttpGet]
        async public Task<object> 获取论文成果统计(论文成果统计Filter filter)
        {
            var where = SqlWhereMapper.toWhere(filter);
            return await Db.QuerySpAsync<sp_论文成果统计, object>(new sp_论文成果统计()
            {
                where = where
            });
        }

        [HttpGet]
        async public Task<object> 获取获奖成果统计(获奖成果统计Filter filter)
        {
            var where = SqlWhereMapper.toWhere(filter);
            return await Db.QuerySpAsync<sp_获奖成果统计, object>(new sp_获奖成果统计()
            {
                where = where
            });
        }

        [HttpGet]
        async public Task<object> 获取著作成果统计(著作成果统计Filter filter)
        {
            var where = SqlWhereMapper.toWhere(filter);
            return await Db.QuerySpAsync<sp_著作成果统计, object>(new sp_著作成果统计()
            {
                where = where
            });
        }

        [HttpGet]
        async public Task<object> 获取专利成果统计(专利成果统计Filter filter)
        {
            var where = SqlWhereMapper.toWhere(filter);
            return await Db.QuerySpAsync<sp_专利成果统计, object>(new sp_专利成果统计()
            {
                where = where
            });
        }

        [HttpGet]
        async public Task<object> 获取按部门统计所有成果(所有成果统计Filter filter)
        {
            var where = SqlWhereMapper.toWhere(filter);
            return await Db.QuerySpAsync<sp_按指定字段统计成果, object>(new sp_按指定字段统计成果()
            {
                字段名 = "部门名称",
                字段显示名 = "部门",
                where = where
            });
        }

        [HttpGet]
        async public Task<object> 获取按职务统计所有成果(所有成果统计Filter filter)
        {
            var where = SqlWhereMapper.toWhere(filter);
            return await Db.QuerySpAsync<sp_按指定字段统计成果, object>(new sp_按指定字段统计成果()
            {
                字段名 = "职务名称",
                字段显示名 = "职务",
                where = where
            });
        }

        [HttpGet]
        async public Task<object> 获取按专业技术级别统计所有成果(所有成果统计Filter filter)
        {
            var where = SqlWhereMapper.toWhere(filter);
            return await Db.QuerySpAsync<sp_按指定字段统计成果, object>(new sp_按指定字段统计成果()
            {
                字段名 = "专业技术级别",
                字段显示名 = "专业技术级别",
                where = where
            });
        }

        [HttpGet]
        async public Task<object> 获取按岗位类型统计所有成果(所有成果统计Filter filter)
        {
            var where = SqlWhereMapper.toWhere(filter);
            return await Db.QuerySpAsync<sp_按指定字段统计成果, object>(new sp_按指定字段统计成果()
            {
                字段名 = "岗位类型",
                字段显示名 = "岗位类型",
                where = where
            });
        }

        [HttpGet]
        async public Task<object> 获取按学历统计所有成果(所有成果统计Filter filter)
        {
            var where = SqlWhereMapper.toWhere(filter);
            return await Db.QuerySpAsync<sp_按指定字段统计成果, object>(new sp_按指定字段统计成果()
            {
                字段名 = "学历",
                字段显示名 = "学历",
                where = where
            });
        }

        [HttpGet]
        async public Task<object> 获取横向项目经费统计()
        {
            return await Db.GetListSpAsync<v4_横向项目经费统计>(keyFields: "项目负责人部门名称");
        }

        [HttpGet]
        async public Task<PagingResult<v4_横向项目汇总>> 获取横向项目汇总(Paging paging)
        {
            return await Db.GetPagingListSpAsync<v4_横向项目汇总>(paging);
        }

        [HttpGet]
        async public Task<object> 获取纵向项目经费统计()
        {
            return await Db.GetListSpAsync<v4_纵向项目经费统计>(keyFields: "负责人部门名称");
        }

        [HttpGet]
        async public Task<PagingResult<v4_纵向项目汇总>> 获取纵向项目汇总(Paging paging)
        {
            return await Db.GetPagingListSpAsync<v4_纵向项目汇总>(paging);
        }

        [HttpGet]
        async public Task<object> 获取按部门对学历统计人员()
        {
            return await Db.QuerySpAsync<sp_按部门对指定字段统计人员, object>(
                new sp_按部门对指定字段统计人员() { 字段名 = "学历" });
        }

        [HttpGet]
        async public Task<object> 获取按部门对学科门类统计人员()
        {
            return await Db.QuerySpAsync<sp_按部门对指定字段统计人员, object>(
                new sp_按部门对指定字段统计人员() { 字段名 = "学科门类" });
        }

        [HttpGet]
        async public Task<object> 获取按部门对专业技术级别统计人员()
        {
            return await Db.QuerySpAsync<sp_按部门对指定字段统计人员, object>(
                new sp_按部门对指定字段统计人员() { 字段名 = "专业技术级别" });
        }

        [HttpGet]
        async public Task<object> 获取按部门对岗位类型统计人员()
        {
            return await Db.QuerySpAsync<sp_按部门对指定字段统计人员, object>(
                new sp_按部门对指定字段统计人员() { 字段名 = "岗位类型" });
        }
    }
}
