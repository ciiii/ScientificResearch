using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

namespace ScientificResearch.Areas.TeachingManagement.Controllers
{
    public class TestController : TeachingManagementBaseController
    {
        /// <summary>
        /// Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyLlp5PlkI0iOiLnrqHnkIblkZgiLCLlt6Xlj7ciOiIwMDAxIiwi57yW5Y-3IjoiMiIsIumDqOmXqOe8luWPtyI6IjEwMDI0Iiwi6YOo6Zeo5ZCN56ewIjoi5L-h5oGv5aSEIiwiRGJLZXkiOiJTY2llbnRpZmljUmVzZWFyY2hfVGVzdCIsImlzcyI6Im1lZDEwMC5jb20iLCJhdWQiOiJtZWQxMDAuY29tIn0.W9E3C7qtbq1mi8lLoflyVvhOeQmLgR_AFucEAbSer9U
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        async public Task<object> Index() => await Task.FromResult<string>("OK");

        [AllowAnonymous]
        [HttpPost]
        public object testUpload(Microsoft.AspNetCore.Http.IFormFileCollection files)
        {
            return files;
        }

        [AllowAnonymous]
        [HttpGet]
        /// <summary>
        /// 根据code取openid,接着取该openid绑定的用户信息;
        /// OAuthScope.snsapi_base方式回调
        /// </summary>
        /// <param name="code"></param>
        /// <param name="state"></param>
        /// <param name="returnUrl">用户最初尝试进入的页面</param>
        /// <returns></returns>
        async public Task<object> BaseCallback(string code, string state, string returnUrl)
        {
            try
            {
                if (string.IsNullOrEmpty(code))
                {
                    HttpContext.Response.StatusCode = 401;
                    return Content("您拒绝了授权！");

                }

                var ApiMpHost = "https://api.weixin.qq.com";
                var appId = "wx5e45aca8fcb270f1";
                var appSecret = "581523b77f235c216243008e5742b1fc";
                var grantType = "authorization_code";

                //通过，用code换取access_token

                var url = string.Format($"{ApiMpHost}/sns/oauth2/access_token?appid={appId}&secret={appSecret}&code={code}&grant_type={grantType}");

                var result = await MyLib.MyHttpLib.MyGetAsync<OAuthAccessTokenResult>(url);

                if (result.errcode != 0)
                {
                    return Content("错误：" + result.errmsg);
                }

                return result.openid;

            }
            catch (Exception ex)
            {
                HttpContext.Response.StatusCode = 401;
                return Content("发生错误：" + ex.ToString());
            }
        }

        [HttpPost]
        async public Task<object> 测试merge人员OpenId([FromBody]人员OpenId model) =>
            await Db.Merge(model);
    }
}