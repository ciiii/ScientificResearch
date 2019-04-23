using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Dynamic;
using System.Linq;
using System.Threading.Tasks;

namespace MyLib
{
    public static class MyWx
    {
        async public static Task<string> GetOpenId(string code, string appId, string appSecret, string grantType)
        {
            if (string.IsNullOrEmpty(code))
            {
                //HttpContext.Response.StatusCode = 401;
                //return Content("您拒绝了授权！");
                throw new Exception("没有code,用户拒绝了授权");
            }

            var ApiMpHost = "https://api.weixin.qq.com";
            //var appId = Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestappId" : "WechatSetting:appId");
            //var appSecret = Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestappSecret" : "WechatSetting:appSecret");
            //var grantType = Config.GetValue<string>("WechatSetting:grantType");

            //通过，用code换取access_token
            var url = string.Format($"{ApiMpHost}/sns/oauth2/access_token?appid={appId}&secret={appSecret}&code={code}&grant_type={grantType}");

            //try  //try放到外面一层
            //{
            var result = await MyHttpLib.MyGetAsync<MyWxOAuthAccessTokenResult>(url);

            if (result.errcode != 0)
            {
                //return Content("错误：" + result.errmsg);
                throw new Exception(result.errmsg);
            }

            return result.openid;
            //}
            //catch (Exception ex)
            //{
            //    HttpContext.Response.StatusCode = 401;
            //    //throw new Exception("获取OpenId错误");
            //    throw new Exception("发生错误：" + ex.ToString());
            //}
        }

        async public static Task<string> GetAccessToken(string appId,string appSecret)
        {
            var url = $"https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={appId}&secret={appSecret}";
            var result = await MyHttpLib.MyGetAsync<MyWxGetAccessTokenReturn>(url);
            return result.access_token;

        }

        async public static Task<MyWxTemplateResult> SentMessage(string appId, string appSecret,MyWxTemplate template)
        {
            var access_token = await GetAccessToken(appId, appSecret);
            string url = $"https://api.weixin.qq.com/cgi-bin/message/template/send?access_token={access_token}";

            return await MyHttpLib.MyPostAsync<MyWxTemplateResult>(url, template);
        }

    }


    public class MyWxGetAccessTokenReturn
    {
        public string access_token  { get; set; }
        public int expires_in { get; set; }
    }
    /// <summary>
    /// 获取OAuth AccessToken的结果
    /// </summary>
    public class MyWxOAuthAccessTokenResult
    {
        public int errcode { get; set; }
        public string errmsg { get; set; }
        /// <summary>
        /// 接口调用凭证
        /// </summary>
        public string access_token { get; set; }
        /// <summary>
        /// access_token接口调用凭证超时时间，单位（秒）
        /// </summary>
        public int expires_in { get; set; }
        /// <summary>
        /// 用户刷新access_token
        /// </summary>
        public string refresh_token { get; set; }
        /// <summary>
        /// 授权用户唯一标识
        /// </summary>
        public string openid { get; set; }
        /// <summary>
        /// 用户授权的作用域，使用逗号（,）分隔
        /// </summary>
        public string scope { get; set; }
        /// <summary>
        /// 只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。详见：获取用户个人信息（UnionID机制）
        /// </summary>
        public string unionid { get; set; }
    }

    /// <summary>
    /// 模板消息
    /// </summary>
    public class MyWxTemplate
    {
        /// <summary>
        /// 接收消息的openid
        /// </summary>
        public string touser { get; set; }

        /// <summary>
        /// 模板id
        /// </summary>
        public string template_id { get; set; }

        /// <summary>
        /// 点击后指向的url
        /// </summary>
        public string url { get; set; }

        /// <summary>
        /// 消息内容
        /// </summary>
        public MyWxData data { get; set; }
    }

    /// <summary>
    /// 这个应该对应某个具体的模板消息;目前先测试;
    /// </summary>
    public class MyWxData
    {
        public MyWxFirst first { get; set; }
        public MyWxKeynote keyword1 { get; set; }
        public MyWxKeynote keyword2 { get; set; }
        public MyWxKeynote keyword3 { get; set; }
        public MyWxKeynote keyword4 { get; set; }
        public MyWxRemark remark { get; set; }
    }

    /// <summary>
    /// 头部消息
    /// </summary>
    public class MyWxFirst:MyWxRemark    {    }

    /// <summary>
    /// 内容消息
    /// </summary>
    public class MyWxKeynote:MyWxRemark    {    }

    public class MyWxRemark
    {
        public string value { get; set; }
        public string color { get; set; }
    }

    public class MyWxTemplateResult
    {
        public string msgid { get; set; }
        public string errcode { get; set; }
        public string  errmsg { get; set; }
    }
}
