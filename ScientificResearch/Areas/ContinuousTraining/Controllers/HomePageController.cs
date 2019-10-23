using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using MyLib;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.ContinuousTraining.Controllers
{
    public class HomePageController : ContinuousTrainingBaseController
    {

        /// <summary>
        /// 已有重复的文件名,会上传失败;
        /// 登录的时候获取一次即可,不需要每次要上传的时候来获取;
        /// </summary>
        /// <param name="id">素材id,新增时填0</param>
        /// <param name="fileName">文件名</param>
        /// <returns></returns>
        [HttpGet]
        public object 获取上传文件到七牛云所需的token()
        {
            return 继教慕课.获取某素材的上传token(
                Config.GetValue<string>("七牛:AccessKey"),
                Config.GetValue<string>("七牛:SecretKey"),
                Config.GetValue<string>("七牛:Domain"), null);
        }

        /// <summary>
        /// 获取教学管理pc端的功能菜单;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取继教权限菜单()
        {
            var filter = new 继教人员权限Filter() { 人员编号 = CurrentUser.编号 };

            var permission = await Db.GetListSpAsync<v_继教人员的权限, 继教人员权限Filter>(filter, orderStr: nameof(v_继教人员的权限.排序值), orderType: true);
            //处理一下中文
            //foreach (var item in permission)
            //{
            //    item.路径 = string.Join("?", (item.路径 ?? "").Split("?").Select(j => Uri.EscapeUriString(j)));
            //}

            var rPermission = RecursivePermission(permission, 0);

            return rPermission;
        }

        /// <summary>
        /// 权限分层次
        /// </summary>
        /// <param name="permission"></param>
        /// <param name="topId"></param>
        /// <returns></returns>
        private object RecursivePermission(IEnumerable<v_继教人员的权限> permission, int topId)
        {
            return from item in permission
                   where item.上级编号 == topId
                   select new
                   {
                       菜单 = item,
                       子级菜单 = RecursivePermission(permission, item.编号)
                   };
        }

        /// <summary>
        /// 获取教学管理微信端的功能菜单;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取继教微信端权限菜单()
        {
            var filter = new 继教微信端人员权限Filter() { 人员编号 = CurrentUser.编号 };

            var permission = await Db.GetListSpAsync<v_继教人员微信的权限, 继教微信端人员权限Filter>
                (filter, orderStr: nameof(v_继教人员微信的权限.排序值), orderType: true);
            //处理一下中文
            //foreach (var item in permission)
            //{
            //    item.路径 = string.Join("?", (item.路径 ?? "").Split("?").Select(j => Uri.EscapeUriString(j)));
            //}

            var rPermission = RecursivePermission(permission, 0);

            return rPermission;
        }

        /// <summary>
        /// 权限分层次
        /// </summary>
        /// <param name="permission"></param>
        /// <param name="topId"></param>
        /// <returns></returns>
        private object RecursivePermission(IEnumerable<v_继教人员微信的权限> permission, int topId)
        {
            return from item in permission
                   where item.上级编号 == topId
                   select new
                   {
                       菜单 = item,
                       子级菜单 = RecursivePermission(permission, item.编号)
                   };
        }

        /// <summary>
        /// 获取微信jsapi的临时票据
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> GetWxJsApiTickect(string url)
        {
            var appId = Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestappId" : "WechatSetting:appId");
            var appSecret = Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestappSecret" : "WechatSetting:appSecret");

            return await MyWx.GetWxTickect(appId, appSecret, url);
        }
    }
}
