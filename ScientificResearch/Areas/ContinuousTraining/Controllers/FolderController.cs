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
    public class FolderController : ContinuousTrainingBaseController
    {
        /// <summary>
        /// 继教文件夹类型,是定死的,有下面几种
        /// 继教慕课, 继教理论考试, 继教操作考试, 继教签到, 继教慕课素材, 继教试题, 继教试卷, 继教评分表
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取登录人可用的文件夹(继教文件夹Filter filter)
        {
            var 文件夹信息 = await Db.GetListSpAsync<v_tfn_继教某人可查看的文件夹, 继教文件夹Filter>
                (filter,
                $"tfn_继教某人可查看的文件夹('{CurrentUser.人员类型}',{CurrentUser.编号})",
                orderStr: nameof(v_tfn_继教某人可查看的文件夹.排序值),
                orderType: true);

            var 文件夹可使用人 = await Db.GetListSpAsync<v_继教文件夹可使用人, 继教文件夹可使用人Filter>
                (new 继教文件夹可使用人Filter() { WhereIn文件夹编号 = 文件夹信息.Select(i => i.编号).ToStringIdWithSpacer() });

            return from item in 文件夹信息
                   select new
                   {
                       文件夹信息 = item,
                       文件夹可使用人 = from item2 in 文件夹可使用人 where item2.文件夹编号 == item.编号 select item2
                   };
        }

        /// <summary>
        /// 父文件夹编号不等于0时,父文件夹必须归属当前登录人;
        /// 该文件夹编号等于0时,后台填写"归属人类型"和"归属人编号"
        /// 该文件夹编号不等于0时,该文件夹必须归属当前登录人;
        /// 继教文件夹可使用人类型:人员, 继教角色, 部门,如果可使用人编号=0,则表示该类型的所有人;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改某个文件夹([FromBody]PredefindedModelList<继教文件夹, 继教文件夹可使用人> data)
        {
            if (data.Model.父编号 != 0)
            {
                var 父文件夹 = await Db.GetModelByIdSpAsync<继教文件夹>(data.Model.父编号);
                if (父文件夹 == null || 父文件夹.归属人类型 != CurrentUser.人员类型 || 父文件夹.归属人编号 != CurrentUser.编号)
                {
                    throw new Exception("正在修改的文件夹归属错误");
                }
            }

            var 数据库中的该文件夹信息 = await Db.GetModelByIdSpAsync<继教文件夹>(data.Model.编号);

            if (数据库中的该文件夹信息 != null &&
                (数据库中的该文件夹信息?.归属人类型 != CurrentUser.人员类型 || 数据库中的该文件夹信息?.归属人编号 != CurrentUser.编号))
            {
                throw new Exception("不能修改的归属于别人的文件夹");
            }
            else
            {
                data.Model.归属人类型 = CurrentUser.人员类型;
                data.Model.归属人编号 = CurrentUser.编号;
            }

            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                var 文件夹 = await dbForTransaction.Merge<继教文件夹>(data.Model, transaction);
                await dbForTransaction.Merge(文件夹.编号, data.List, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }
    }
}
