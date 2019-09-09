using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.ContinuousTraining.Controllers
{
    public class BaseInfoController : ContinuousTrainingBaseController
    {
        /// <summary>
        /// 字典相关的接口,都使用ScientificResearch-baseinfo中相关的接口,教学管理不再单独提供;
        /// 涉及的字典分类有:学历;职称;学科;民族
        /// </summary>
        /// <param name="分类"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某类字典(string 分类)
        {
            return await Task.FromResult(Content("请使用ScientificResearch-baseinfo中相关的接口"));
        }

        /// <summary>
        /// 能级不应该被修改;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取继教能级()
        {
            return await Db.GetListSpAsync<继教能级>(orderType: true);
        }

        /// <summary>
        /// 慕课设置,考试设置,签到设置,这些都放到一起的
        /// 应该是用json串来存储,这里还是用了表.....
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取继教设置()
        {
            return (await Db.GetListSpAsync<继教设置>()).FirstOrDefault();
        }

        [HttpPost]
        async public Task 增改继教设置([FromBody] 继教设置 data)
        {
            await Db.Merge(data);
        }

        [HttpGet]
        async public Task<object> 分页获取继教培训计划(Paging paging, 继教培训计划Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_继教培训计划, 继教培训计划Filter>(paging, filter);
        }

        [HttpPost]
        async public Task 增改继教培训计划([FromBody]继教培训计划 data)
        {
            await Db.Merge(data);
        }

        /// <summary>
        /// 培训计划是可以随便删除的,活动属于哪个培训计划也不是必填的;
        /// </summary>
        /// <param name="编号列表"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 删除继教培训计划([FromBody]IEnumerable<int> 编号列表) =>
            await Db_Manage.Delete<继教培训计划>(编号列表);

        /// <summary>
        /// 前端从父编号=0开始组织树结构,中间有断层的数据就不管他
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取继教活动项目分类()
        {
            return await Db.GetListSpAsync<v_继教活动项目分类>();
        }

        [HttpPost]
        async public Task 增改继教活动项目分类([FromBody]继教活动项目分类 data)
        {
            await Db.Merge(data);
        }

        /// <summary>
        /// 继教活动项目分类的删除:只要有关联活动,就不能删除;
        /// </summary>
        /// <param name="编号列表"></param>
        /// <returns></returns>
        /// 
        [HttpPost]
        async public Task 删除继教活动项目分类([FromBody]IEnumerable<int> 编号列表)
        {
            var 相关的继教活动项目分类 = await Db.GetListSpAsync<v_继教活动项目分类, 继教活动项目分类Filter>(
                new 继教活动项目分类Filter()
                {
                    WhereIn编号 = 编号列表.ToStringIdWithSpacer()
                });

            if (相关的继教活动项目分类.Any(i => i.未发布活动数量 > 0 || i.未开始活动数量 > 0 || i.进行中活动数量 > 0 || i.已结束活动数量 > 0))
            {
                throw new Exception("将删除的项目分类中,已包含活动,请删除所有已包含活动后再执行此操作.");
            }

            await Db_Manage.Delete<继教培训计划>(编号列表);
        }

    }
}
