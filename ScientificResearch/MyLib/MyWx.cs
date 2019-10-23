using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Dynamic;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
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


        #region wxjsapi临时票据,需要进一步整理
        async public static Task<object> GetWxTickect(string appId, string appSecret,string url)
        {
            var access_token = await GetAccessToken(appId, appSecret);
            var tickect = await GetTickect(access_token);
            var timestamp = CreatenTimestamp();
            var nonceStr = CreatenNonce_str();
            var signature = GetSignature(tickect, nonceStr, timestamp, url);

            return new
            {
                appId,
                tickect,
                timestamp,
                nonceStr,
                signature
            };
        }

        // <summary>
        /// 获取jsapi_ticket
        /// jsapi_ticket是公众号用于调用微信JS接口的临时票据。
        /// 正常情况下，jsapi_ticket的有效期为7200秒，通过access_token来获取。
        /// 由于获取jsapi_ticket的api调用次数非常有限，频繁刷新jsapi_ticket会导致api调用受限，影响自身业务，开发者必须在自己的服务全局缓存jsapi_ticket 。
        ///本代码来自开源微信SDK项目：https://github.com/night-king/weixinSDK
        /// </summary>
        /// <param name="access_token">BasicAPI获取的access_token,也可以通过TokenHelper获取</param>
        /// <returns></returns>
        async public static Task<string> GetTickect(string access_token)
        {
            var url = string.Format("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token={0}&type=jsapi", access_token);

            //var jsTicket = DynamicJson.Parse(result.Content.ReadAsStringAsync().Result);
            //return jsTicket;

            var result = await MyHttpLib.MyGetAsync<JsApiTicket>(url);
            return result.ticket;
        }

        private static string[] strs = new string[]
                                {
                                  "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
                                  "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
                                };
        /// <summary>
        /// 创建随机字符串
        ///本代码来自开源微信SDK项目：https://github.com/night-king/weixinSDK
        /// </summary>
        /// <returns></returns>
        public static string CreatenNonce_str()
        {
            Random r = new Random();
            var sb = new StringBuilder();
            var length = strs.Length;
            for (int i = 0; i < 15; i++)
            {
                sb.Append(strs[r.Next(length - 1)]);
            }
            return sb.ToString();
        }

        /// <summary>
        /// 创建时间戳
        ///本代码来自开源微信SDK项目：https://github.com/night-king/weixinSDK
        /// </summary>
        /// <returns></returns>
        public static long CreatenTimestamp()
        {
            return (DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000;
        }

        /// <summary>
        /// 签名算法
        ///本代码来自开源微信SDK项目：https://github.com/night-king/weixinSDK
        /// </summary>
        /// <param name="jsapi_ticket">jsapi_ticket</param>
        /// <param name="noncestr">随机字符串(必须与wx.config中的nonceStr相同)</param>
        /// <param name="timestamp">时间戳(必须与wx.config中的timestamp相同)</param>
        /// <param name="url">当前网页的URL，不包含#及其后面部分(必须是调用JS接口页面的完整URL)</param>
        /// <returns></returns>
        public static string GetSignature(string jsapi_ticket, string noncestr, long timestamp, string url)
        {
            var string1Builder = new StringBuilder();
            string1Builder.Append("jsapi_ticket=").Append(jsapi_ticket).Append("&")
                          .Append("noncestr=").Append(noncestr).Append("&")
                          .Append("timestamp=").Append(timestamp).Append("&")
                          .Append("url=").Append(url.IndexOf("#") >= 0 ? url.Substring(0, url.IndexOf("#")) : url);
            var string1 = string1Builder.ToString();
            return SHA1(string1).ToLower();
            //return SHA1(string1).ToLower();
        }

        /// <summary>
        /// SHA1 加密，返回大写字符串
        /// </summary>
        /// <param name="content">需要加密字符串</param>
        /// <returns>返回40位UTF8 大写</returns>
        public static string SHA1(string content)
        {
            return SHA1(content, Encoding.UTF8);
        }
        /// <summary>
        /// SHA1 加密，返回大写字符串
        /// </summary>
        /// <param name="content">需要加密字符串</param>
        /// <param name="encode">指定加密编码</param>
        /// <returns>返回40位大写字符串</returns>
        public static string SHA1(string content, Encoding encode)
        {
            try
            {
                SHA1 sha1 = new SHA1CryptoServiceProvider();
                byte[] bytes_in = encode.GetBytes(content);
                byte[] bytes_out = sha1.ComputeHash(bytes_in);
                sha1.Dispose();
                string result = BitConverter.ToString(bytes_out);
                result = result.Replace("-", "");
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("SHA1加密出错：" + ex.Message);
            }
        }

        #endregion
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



    public class JsApiTicket
    {
        public int errcode { get; set; }
        public string errmsg { get; set; }
        public string ticket { get; set; }
        public int expires_in { get; set; }
    }

}
