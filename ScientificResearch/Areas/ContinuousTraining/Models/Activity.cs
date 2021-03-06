﻿using MyLib;
using ScientificResearch.Infrastucture;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public enum 活动状态
    {
        未发布, 未开始, 进行中, 已结束
    }

    /// <summary>
    /// "继教文件夹类型"是个类似的enum
    /// </summary>
    public enum 活动内容类型
    {
        继教慕课, 继教课后练习, 继教理论考试, 继教操作考试, 继教签到, 继教自测
    }

    public class 继教活动可参与人OpenId_Filter
    {
        public string DbKey { get; set; }
        public int 活动编号 { get; set; }
    }

    public partial class 继教活动
    {
        #region Pc管理端
        /// <summary>
        /// 好像只有“获取某慕课活动详情”在用这个，是不是改个名字更好
        /// </summary>
        /// <param name="活动编号"></param>
        /// <param name="db"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async static public Task<object> 获取某活动详情(int 活动编号, IDbConnection db, IDbTransaction transaction = null)
        {
            var 活动基本信息 = await db.GetModelByIdSpAsync<v_继教活动>(活动编号, transaction: transaction);
            var 活动内容列表 = await db.GetListSpAsync<v_继教活动内容, 继教活动内容Filter>(
                new 继教活动内容Filter()
                {
                    活动编号 = 活动编号
                },
                orderStr: nameof(v_继教活动内容.排序值),
                orderType: true,
                transaction: transaction);
            var 活动可参与人列表 = await db.GetListSpAsync<v_继教活动可参与人, 继教活动可参与人Filter>(
                new 继教活动可参与人Filter()
                {
                    活动编号 = 活动编号
                }, transaction: transaction);

            return new
            {
                活动基本信息,
                活动内容列表,
                活动可参与人列表
            };
        }

        /// <summary>
        /// 继教活动的基本信息增改
        /// 只能在状态 = 未发布时增改
        /// </summary>
        /// <param name="model"></param>
        /// <param name="db"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async static public Task<继教活动> 增改继教活动(继教活动 model, IDbConnection db, IDbTransaction transaction = null)
        {
            var 数据库中的记录 = await db.GetModelByIdSpAsync<v_继教活动>(model.编号, transaction: transaction);
            //没有在数据库中找到该继教活动(就是说这是insert的情况),或者其状态为"未发布",才可以增改
            if (数据库中的记录 == null || 数据库中的记录.状态 == 活动状态.未发布.ToString())
            {
                //强调当前数据为"未发布"状态;
                model.开始时间 = null;
                model.结束时间 = null;

                return await db.Merge(model, transaction: transaction);
            }
            else
            {
                //throw new Exception("已发布的活动不能修改");
                //2019-11-6 改为在已发布状态下,可以修改
                //下一句虽然可以和上面的合并,但这里为了强调这一次的修改,暂不合并;
                return await db.Merge(model, transaction: transaction);
            }
        }
        /// <summary>
        /// 只有未发布的活动才可以发布
        /// 必须要有活动内容
        /// 如果有考试,由于考试时分批次指定了参与人,所以考试的参与人必须被包含在活动的可参与人中;
        /// </summary>
        /// <param name="data"></param>
        /// <param name="db"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async static public Task 发布继教活动(
            发布继教活动 data, 
            string dbKey, 
            string appId,
            string appSecret,
            string template_id,
            string 发送部门名称, 
            IDbConnection db, 
            IDbTransaction transaction = null)
        {
            var 活动视图 = await db.GetModelByIdSpAsync<v_继教活动>(data.活动编号, transaction: transaction);

            //2019-11-6 改为在已发布状态下,可以再次发布.也就是注释了下面一个判断;
            //if (活动视图.状态 != 活动状态.未发布.ToString())
            //{
            //    throw new Exception("只有未发布的活动才可以发布");
            //}

            if (data.开始时间 >= data.结束时间)
            {
                throw new Exception("结束时间必须大于开始时间");
            }

            if (DateTime.Now >= data.结束时间)
            {
                throw new Exception("结束时间必须大于当前时间");
            }

            var 活动内容列表 = await db.GetListSpAsync<继教活动内容, 继教活动内容Filter>(
                new 继教活动内容Filter()
                {
                    活动编号 = data.活动编号
                }, transaction: transaction);
            if (活动内容列表.Count() <= 0)
            {
                throw new Exception("至少包含一个活动内容才能发布");
            }

            var 考试可参与人列表 = await db.GetListSpAsync<v_继教考试批次可参与人, 继教考试批次可参与人Filter>(
                new 继教考试批次可参与人Filter()
                {
                    活动编号 = data.活动编号
                }, transaction: transaction);

            if (!考试可参与人列表.All(i => data.活动可参与人.Any(j => j.可参与人类型 == i.可参与人类型 && j.可参与人编号 == i.可参与人编号)))
            {
                throw new Exception("活动中考试的可参与人,必须包含在活动可参与人中");
            }

            var 活动 = MyLib.Tool.ModelToModel<v_继教活动, 继教活动>(活动视图);
            活动.开始时间 = data.开始时间;
            活动.结束时间 = data.结束时间;
            await db.Merge(活动, transaction: transaction);

            await db.Merge(data.活动编号, data.活动可参与人, transaction: transaction);

            //群发微信模板消息
            await 发送微信模板消息(
                db, 
                dbKey, 
                data.活动编号, 
                appId, 
                appSecret, 
                template_id, 
                活动.名称, 
                data.开始时间.ToString(), 
                data.结束时间.ToString(), 
                data.地点,
                发送部门名称,transaction);
        }

        async static Task 发送微信模板消息(
            IDbConnection db,
            string dbKey,
            int 活动编号,
            string appId,
            string appSecret,
            string template_id,
            string 活动名称,
            string 开始时间,
            string 结束时间,
            string 地点,
            //string 地点,
            string 发送部门名称, IDbTransaction transaction = null)
        {
            //var appId = Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestappId" : "WechatSetting:appId");
            //var appSecret = Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestappSecret" : "WechatSetting:appSecret");

            var openIdList = await db.GetListSpAsync<v_继教活动可参与人OpenId, 继教活动可参与人OpenId_Filter>(
                new 继教活动可参与人OpenId_Filter()
                {
                    DbKey = dbKey,
                    活动编号 = 活动编号
                },transaction: transaction);

            foreach (var item in openIdList)
            {
                var myMessage = new MyWxTemplate()
                {
                    //touser = Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestOpenId" : "WechatSetting:openId"),
                    touser = item.OpenId,
                    //url = "www.baidu.com",
                    //template_id = Config.GetValue<string>(Env.IsDevelopment() ==
                    //true ? "WechatSetting:TestTemplate_id" : "WechatSetting:template_id_appointment"),
                    template_id = template_id,
                    data = new MyWxData()
                    {
                        first = new MyWxFirst() { value = "您好，您有新的待参与的项目！" },
                        keyword1 = new MyWxKeynote() { value = 活动名称 },
                        keyword2 = new MyWxKeynote() { value = 开始时间 },
                        keyword3 = new MyWxKeynote() { value = 结束时间 },
                        keyword4 = new MyWxKeynote() { value = 地点 },
                        keyword5 = new MyWxKeynote() { value = 发送部门名称 },
                        remark = new MyWxRemark() { value = "请准时参与！" }
                    }
                };

                MyWx.SentMessage(appId, appSecret, myMessage);
            }
        }


        #endregion

        #region 微信端参与者
        async static public Task<object> 获取某人可参与的活动详情(int 活动编号, string 人员类型, int 人员编号, IDbConnection db, IDbTransaction transaction = null)
        {
            var 活动基本信息 = await db.GetModelByIdSpAsync<v_tfn_继教某人可参与的活动>(
                活动编号,
                tableName: $"tfn_继教某人可参与的活动('{人员类型}',{人员编号})",
                transaction: transaction);

            var 活动内容列表 = await db.GetListSpAsync<v_tfn_继教某人可参与的活动内容>(
                tbName: $"tfn_继教某人可参与的活动内容('{活动编号}','{人员类型}',{人员编号})",
                orderStr: nameof(v_继教活动内容.排序值),
                orderType: true,
                transaction: transaction);

            return new
            {
                活动基本信息,
                活动内容列表
            };
        }
        #endregion
    }

    public class 发布继教活动
    {
        public int 活动编号 { get; set; }
        public DateTime 开始时间 { get; set; }
        public DateTime 结束时间 { get; set; }
        public string 地点 { get; set; }
        public IEnumerable<继教活动可参与人> 活动可参与人 { get; set; }

    }

    public partial class 继教活动内容
    {
        /// <summary>
        /// 一般情况下都应该放到具体的活动内容的一个事务性增改中去;
        /// </summary>
        /// <param name=""></param>
        /// <param name="db"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async static public Task<继教活动内容> 增改继教活动内容(继教活动内容 model, IDbConnection db, IDbTransaction transaction = null)
        {
            return await db.Merge(model, transaction: transaction);
        }
    }


}
