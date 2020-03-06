using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using MyLib;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.ContinuousTraining.Controllers
{
    /// <summary>
    /// Mogao是慕课的意思
    /// 并没有一个单独的"活动"controller,而是根据业务体现,融入到了
    /// </summary>
    public class MogaoController : ContinuousTrainingBaseController
    {
        #region 获取慕课活动/活动内容
        /// <summary>
        /// 必填条件:文件夹编号,
        /// 该文件夹必须是"继教慕课"类型的,这个在后台没有验证了..
        /// 虽然是可以验证,但对于别的类型来说,取该文件夹下的"活动",也没有错.
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取某文件夹下的慕课活动(Paging paging, 继教活动Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_继教活动, 继教活动Filter>(paging, filter);
        }

        /// <summary>
        /// 其实对于别的类型的活动,也是一样的;
        /// 包括某个活动的基本信息,活动内容列表,活动可参与人列表;
        /// 统计数据那些,单独去取;
        /// </summary>
        /// <param name="活动编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某慕课活动详情(int 活动编号)
        {
            return await 继教活动.获取某活动详情(活动编号, Db);
        }

        /// <summary>
        /// 返回的基本信息里面的"慕课素材路径",是计算出来的私有路径,可用来直接下载/查看
        /// </summary>
        /// <param name="活动内容编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某慕课活动内容详情(int 活动内容编号)
        {
            return await 继教慕课.获取某慕课活动内容详情(
                活动内容编号,
                Config.GetValue<string>("七牛:AccessKey"),
                Config.GetValue<string>("七牛:SecretKey"),
                Config.GetValue<string>("七牛:Domain"),
                Db);
        }

        [HttpGet]
        async public Task<object> 获取某课后练习活动内容详情(int 活动内容编号)
        {
            return await 继教课后练习.获取某课后练习活动内容详情(活动内容编号, Db);
        }

        /// <summary>
        /// 注意,这里返回数据的第二部分:"参与情况",是签到流水账,而不是按某个参与人统计出的通过/不通过签到的数据
        /// 通过/不通过的数据要从"tfn_继教签到参与情况"拿才对
        /// </summary>
        /// <param name="活动内容编号"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取某签到活动内容详情(int 活动内容编号)
        {
            return await 继教签到.获取某签到活动内容详情(活动内容编号, Db);
        }

        [HttpGet]
        async public Task<object> 获取某理论考试活动内容详情(int 活动内容编号)
        {
            return await 继教理论考试.获取某理论考试活动内容详情(活动内容编号, Db);
        }

        [HttpGet]
        async public Task<object> 获取某操作考试活动内容详情(int 活动内容编号)
        {
            return await 继教操作考试.获取某操作考试活动内容详情(活动内容编号, Db);
        }

        [HttpGet]
        async public Task<object> 获取某自测活动内容详情(int 活动内容编号)
        {
            return await Db.GetModelByIdSpAsync<v_继教自测>(活动内容编号);
        }

        /// <summary>
        /// 考试编号 必须填,活动内容编号就是考试编号/或者叫自测编号;
        /// </summary>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 分页获取某自测活动内容参与情况(Paging paging, 继教理论考试参与情况Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_继教理论考试参与情况, 继教理论考试参与情况Filter>(paging, filter);
        }

        #endregion

        #region 增改慕课活动/活动内容

        [HttpPost]
        async public Task<object> 上传活动封面()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/继培/活动/封面",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        /// <summary>
        /// 继教活动的基本信息增改
        /// 只能在状态 = 未发布时增改
        /// 开始/结束时间一定为null
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<int> 增改继教活动基本信息([FromBody]继教活动 data)
        {
            data.建立人 = CurrentUser.编号;
            var 活动 = await 继教活动.增改继教活动(data, Db);
            return 活动.编号;

        }

        /// <summary>
        /// 仅修改获取到的活动内容列表中的"排序值",然后原样返回;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 调整活动内容顺序([FromBody]IEnumerable<继教活动内容> data)
        {
            await Db.Merge(data);
        }

        /// <summary>
        /// 只有未发布的活动才可以发布
        /// 开始时间必须小于结束时间
        /// 当前时间必须小于结束时间
        /// 必须要有活动内容
        /// 如果有考试,由于考试时分批次指定了参与人,所以考试的参与人必须被包含在活动的可参与人中;
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 发布继教活动([FromBody]发布继教活动 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                //await 继教活动.发布继教活动(data, dbForTransaction, transaction);
                await 继教活动.发布继教活动(
                    data,
                    CurrentUser.DbKey,
                    Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestappId" : "WechatSetting:appId"),
                    Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestappSecret" : "WechatSetting:appSecret"),
                    Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestTemplate_id" : "WechatSetting:template_id_appointment"),
                    CurrentUser.部门名称,
                    dbForTransaction,
                    transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        //async public Task<object> 分页获取某继教活动的参与情况

        /// <summary>
        /// 同时更新"继教活动内容","继教慕课"
        /// 第一个第二个分别是"继教活动内容","继教慕课"
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改继教慕课活动内容([FromBody]增改继教慕课 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教慕课.增改继教慕课(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 增改继教课后练习需要同时更新三部分内容:
        /// 1 继教活动内容
        /// 2 继教课后练习
        /// 3 继教课后练习试题
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改继教课后练习活动内容([FromBody]增改继教课后练习 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教课后练习.增改继教课后练习(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        /// <summary>
        /// 增改继教理论考试需要同时更新这么几个东东
        /// 1 继教活动内容
        /// 2 继教理论考试,也是理论考试的基本信息
        /// 3 继教考试批次,一个理论考试可能会有1-N个批次
        /// 4 每个批次对应的多个可参与人
        /// 
        /// 各个时间应该验证一下
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 增改继教理论考试活动内容([FromBody]增改继教理论考试 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教理论考试.增改继教理论考试(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 增改继教操作考试活动内容([FromBody]增改继教操作考试 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教操作考试.增改继教操作考试(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 增改继教签到活动内容([FromBody]增改继教签到 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教签到.增改继教签到(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        [HttpPost]
        async public Task 增改继教自测活动内容([FromBody]增改继教自测 data)
        {
            async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
            {
                await 继教理论考试.增改继教自测(data, dbForTransaction, transaction);
            }

            await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        }

        ///// <summary>
        ///// 理论考试和操作考试的批次删除都在这里;
        ///// 没有特别的业务,就不用写到model里面了
        ///// </summary>
        ///// <param name="编号列表"></param>
        ///// <returns></returns>
        //[HttpPost]
        //async public Task 删除继教考试批次([FromBody]IEnumerable<int> 编号列表)
        //{
        //    await Db.Delete<继教考试批次>(编号列表);
        //}

        [HttpPost]
        async public Task 删除继教活动内容([FromBody]IEnumerable<int> 编号列表)
        {
            await Db.Delete<继教活动内容>(编号列表);
        }

        [HttpPost]
        async public Task 设置继教活动学分([FromBody]设置继教活动学分 data)
        {
            var model = await Db.GetModelByIdSpAsync<继教活动>(data.活动编号);
            model.学分 = data.学分;
            await 继教活动.增改继教活动(model, Db);
        }
        #endregion

        #region 慕课素材

        [HttpGet]
        async public Task<object> 分页获取素材(Paging paging, 继教慕课素材Filter filter)
        {
            var result = await Db.GetPagingListSpAsync<v_继教慕课素材, 继教慕课素材Filter>(paging, filter);
            foreach (var item in result.list)
            {
                item.路径 = MyQiniu.GetPrivateUrl(
                    Config.GetValue<string>("七牛:AccessKey"),
                Config.GetValue<string>("七牛:SecretKey"),
                Config.GetValue<string>("七牛:Domain"), item.路径);
            }

            return result;
        }

        /// <summary>
        /// 已有重复的文件名,会上传失败;
        /// </summary>
        /// <param name="id">素材id,新增时填0</param>
        /// <param name="fileName">文件名,可以不提供</param>
        /// <returns></returns>
        [HttpGet]
        public object 获取上传文件到七牛云所需的token()
        {
            return 继教慕课.获取某素材的上传token(
                Config.GetValue<string>("七牛:AccessKey"),
                Config.GetValue<string>("七牛:SecretKey"),
                Config.GetValue<string>("七牛:Bucket"), null);
        }

        [HttpPost]
        async public Task 增改素材([FromBody]继教慕课素材 data)
        {
            await Db.Merge(data);
        }

        [HttpPost]
        async public Task 删除素材([FromBody]IEnumerable<int> 编号列表)
        {
            var 要删除的素材视图 = await Db.GetListSpAsync<v_继教慕课素材, 继教慕课素材Filter>(
                new 继教慕课素材Filter()
                {
                    WhereIn编号 = 编号列表.ToStringIdWithSpacer()
                });

            if (要删除的素材视图.Any(i => i.是否被引用 == true))
            {
                throw new Exception("被引用的素材不能被删除");
            }

            await Db.Delete<继教慕课素材>(编号列表);
        }
        #endregion

        #region 活动层面的统计,相对于512的"活动统计"
        [HttpGet]
        async public Task<object> 分页获取某活动的通过情况统计(Paging paging, int 活动编号, 某活动的通过情况统计Filter filter)
        {
            return await Db.GetPagingListSpAsync<v_tfn_继教某活动的通过情况统计, 某活动的通过情况统计Filter>(
                paging,
                filter,
                $"tfn_继教某活动的通过情况统计({活动编号})"
                );
        }

        [HttpGet]
        async public Task<object> 获取某活动按科室统计通过人数(int 活动编号)
        {
            return await Db.GetListSpAsync<v_tfn_继教某活动按科室统计通过人数>($"tfn_继教某活动按科室统计通过人数({活动编号})");
        }
        #endregion
    }
}
