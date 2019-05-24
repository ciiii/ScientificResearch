using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Business;
using Newtonsoft.Json.Linq;
using ScientificResearch.Infrastucture;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using System.Dynamic;
using System.ComponentModel;
using System.IO;
using ScientificResearch.Models;
using MyLib;
using System.Web;
using System.Text;
using System.Net.Http;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    //[Produces("application/json")]
    //[Consumes("application/json", "multipart/form-data")]//此处为新增
    //[Route("[controller]/[action]")]
    [ApiExplorerSettings(GroupName = "test")]
    [AllowAnonymous]
    public class TestController : ScientificResearchBaseController
    {
        /// <summary>
        /// JObject可以从一个json字串中生成,可以动态的往里面读写属性;
        /// 可以转化为json字串,以及T的对象;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object GetJObejctString()
        {
            JObject staff = JObject.Parse(JsonConvert.SerializeObject(new { age = 1, name = "liyang" }));

            var x = staff["age"];
            staff["name"] = "liyang222222222";
            return new { jobject = staff, json = staff.ToString(), obj = staff.ToObject<object>() };

        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object Get通过类名创建类实例()
        {
            Type type = Type.GetType("ScientificResearch.Models.部门");
            //type.Assembly.CreateInstance(type.Name)
            var obj = type.Assembly.CreateInstance(type.FullName);
            //var obj =Convert.ChangeType( type.Assembly.CreateInstance(type.FullName),type);
            //var obj = (ScientificResearch.Models.部门)type.Assembly.CreateInstance("ScientificResearch.Models.部门");

            return obj;
        }

        /// <summary>
        /// 结果是字段和方法都不会被取到;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object GetPropertyinfo会不会取到类的方法()
        {

            var type = typeof(MyClass);
            var pinfos = type.GetProperties();
            var jobj = new JObject();
            foreach (var pinfo in pinfos)
            {
                jobj.Add(new JProperty(pinfo.Name, 1));
            }

            return jobj.ToObject<object>();
        }
        public class MyClass
        {
            public int 字段 = 1;
            public int 属性 { get; set; }
            public int 方法() { return 1; }
        }

        /// <summary>
        /// return int.TryParse("111", out int from) ? (int?)from : null;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object 测试下tryParse的写法()
        {
            return int.TryParse("111", out int from) ? (int?)from : null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object 测试下csharp的可列举数据处理()
        {
            return Enumerable.Range(0, 10).Select(i => new { a = i, b = i + 100 });
        }

        /// <summary>
        /// 重要!!!
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public object 测试表驱动法(int id)
        {
            var action = new 某个表驱动法的类().获取应该做的事情(id);
            return action(id);
        }

        class 某个表驱动法的类
        {
            class 备选项
            {
                public int BeginId { get; set; }
                public Func<int, int> 此备选项做的事情 { get; set; }
            }

            List<备选项> 可用的备选项 => new List<备选项> {
                new 备选项() {
                    BeginId = 1,
                    此备选项做的事情 = a => a
                },
                new 备选项() {
                    BeginId = 10,
                    此备选项做的事情 = a =>a*2
                }
            };

            public Func<int, int> 获取应该做的事情(int id)
            {
                return this.可用的备选项.Where(i => id >= i.BeginId).OrderByDescending(k => k.BeginId).Select(j => j.此备选项做的事情).FirstOrDefault();
            }
        }

        /// <summary>
        /// config.get 和config.getvalue的区别
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object 获取自定义的全局配置数据()
        {
            //var configRoot = HttpContext.RequestServices.GetService<IConfigurationRoot>();
            //return configRoot.GetSection("系统角色组编号").Get<Models.系统角色组编号>();
            //var config = HttpContext.RequestServices.GetService<IConfiguration>();
            //return config.GetSection("系统角色组编号").Get<Models.系统角色组编号>();

            //return HttpContext.RequestServices.GetService<Models.系统角色组编号>();
            var x = 测试获取自定义的全局配置数据.多个数据["键1"];
            return x;
        }

        class Product
        {
            public string Name { get; set; }
            public IEnumerable<int> Children { get; set; }
        }

        /// <summary>
        /// 感觉还米有jobject好用;
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object Tesetdynamic()
        {
            Product p1 = new Product
            {
                Name = "商品名称",
                Children = new List<int>() { 1, 2, 3 }
            };

            dynamic exProd = MyLib.MyDynamic.ConvertToDynamic(p1);
            //下面两个属性都是 在执行期可被扩充出来的
            exProd.Description = "叙述";
            exProd.NewProperty1 = "我是新属性";

            //dynamic和IDictionary<string, object> 最后打出到前端的json其实是一样的.
            //但是他们各自拥有的方法不同,前者可以直接.一个属性出来写,后者就是IDictionary<string, object>咯;
            return new { exProd, exProd2 = (IDictionary<string, object>)exProd, ContainProperty = ((IDictionary<string, object>)exProd).ContainsKey("Name") };
        }

        /// <summary>
        /// x?.字段的写法
        /// </summary>
        /// <param name="x"></param>
        /// <returns></returns>
        [HttpGet]
        public object TestPoint(MyClass x)
        {
            x = null;
            return new { x, x?.字段 };
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object 测试endnote的导入()
        {
            var dt1 = new 论文导入().ToDataTable();

            var fileName = @"C:\Users\Ly\Desktop\新建文本文档.txt";
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
            Encoding encoding = Encoding.GetEncoding("GB2312");
            var sr = new StreamReader(fileName, encoding); // , Encoding.GetEncoding("gb2312")

            var endnote与论文字段对应关系 = Config.GetSection("endnote与论文字段对应关系").Get<IDictionary<string, string>>();

            var listOfObj = new List<List<string>>();

            sr.BaseStream.Seek(0, SeekOrigin.Begin);
            var temp = sr.ReadLine();

            while (temp != null)
            {
                var listOfProp = new List<string>();

                while (!string.IsNullOrWhiteSpace(temp))
                {
                    listOfProp.Add(temp);

                    temp = sr.ReadLine();
                }

                temp = sr.ReadLine();

                listOfObj.Add(listOfProp);
            }

            sr.Close();
            //fs.Close();

            var listOf论文 = new List<论文导入>();
            foreach (var item in listOfObj)
            {
                var new论文 = new 论文导入();

                foreach (var itemProp in item)
                {
                    //TODO:改为reg
                    var keyInProp = itemProp.Substring(1, 1);

                    var key = endnote与论文字段对应关系.ContainsKey(keyInProp) ? endnote与论文字段对应关系[keyInProp] : string.Empty;
                    var value = itemProp.Substring(3);
                    if (new论文.ContainProperty(key))
                    {
                        if (key == "作者")
                        {
                            new论文.作者 += value + ";";
                        }
                        else
                        {
                            new论文.SetValueByPropertyName(key, value);

                        }

                    }
                }
                listOf论文.Add(new论文);
            }

            //return listOf论文;
            return new { x = dt1, y = listOf论文.ToDataTable<论文导入>() };
        }

        /// <summary>
        /// 也是个奇葩写法.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object 测试元组()
        {
            //元组相关的输出|使用变量都不好用var了.
            (string a, string b, string c) = getFullName();
            return new { a, b };
        }
        //这样就是方法,getFullName名后有(),
        //可以作为局部函数放到测试元组方法里面去;
        (string a, string b, string c) getFullName() => ("a1", "b", "c");
        //这样写就是属性,getFullname名后没有()
        //(string a, string b, string c) getFullName => ("a1", "b", "c");
        //这样当然也是方法
        //private (string a, string b, string c) getFullName()
        //{
        //   return ("a", "b", "c");
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 测试获取整个百度页面的html(params object[] param)
        {
            var httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Add("Host", "www.baidu.com");
            httpClient.DefaultRequestHeaders.Add("Connection", "keep-alive");
            httpClient.DefaultRequestHeaders.Add("Cache-Control", "max-age=0");
            httpClient.DefaultRequestHeaders.Add("Upgrade-Insecure-Requests", "1");
            httpClient.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36");
            httpClient.DefaultRequestHeaders.Add("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8");
            httpClient.DefaultRequestHeaders.Add("Referer", "https://www.baidu.com/");
            httpClient.DefaultRequestHeaders.Add("Accept-Encoding", "gzip, deflate, br");
            httpClient.DefaultRequestHeaders.Add("Cookie", "BD_UPN=12314753; ispeed_lsm=2; BAIDUID=6D149D5512AA8DD7F19ACEEB5966E39F:FG=1; PSTM=1555032264; H_PS_PSSID=1457_21096_18560_28769_28722_28557_28835_28585_26350_28603_28625_28605; BIDUPSID=8A865DD04526B3D71CC0F2D52EFAC4EC; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598; delPer=0; BD_CK_SAM=1; PSINO=3; H_PS_645EC=bf5emVTwLUbIYx0ujrAjhpprhjqEm8FX67T4bMeU5GEYsK3E0vj3npqNg1k; BDUSS=DdYWGRjM2JqOVJPVnJ3a3ZiaU9qM1M2SW9GSmFlaEtUTzJZRFBJM3Z4SkcxTmRjRVFBQUFBJCQAAAAAAAAAAAEAAAApDGqCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEZHsFxGR7BcS; BD_HOME=1");

            //请求并,如果验证非200返回则报错;
            var response = await httpClient.GetAsync(@"https://www.baidu.com/" + MyHttpLib.ObjToQueryParam(param));

            var header = response.Headers;

            //return response;
            response.EnsureSuccessStatusCode();

            //解析返回内容到string
            var responseString = await response.Content.ReadAsStringAsync();
            //return header;

            //给ie设这些header也没用
            //foreach (var item in header)
            //{
            //    foreach (var itemKeyValue in item.Value)
            //    {

            //        if (item.Key == "Set-Cookie")
            //        {
            //            HttpContext.Response.Cookies.Append(itemKeyValue.Split(";")[0].Split("=")[0], itemKeyValue.Split(";")[0].Split("=")[1]);
            //        }
            //        else
            //        {
            //            HttpContext.Response.Headers.Add(item.Key, itemKeyValue);
            //        }
            //    }
            //}

            //Log.Error($"\r\n" +
            //            $"TODO:FIXME:看看百度\r\n" +
            //            $"FIXME:时间{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}\r\n" +
            //            $"{responseString}\r\n");

            return Content(responseString, "text/html");

        }

        [HttpGet]
        async public Task<object> 测试获取整个知网页面的html(params object[] param)
        {
            var httpClient = new HttpClient();
           
            //请求并,如果验证非200返回则报错;
            var response = await httpClient.GetAsync(@"http://www.cnki.net/" + MyHttpLib.ObjToQueryParam(param));

            var header = response.Headers;

            //return response;
            response.EnsureSuccessStatusCode();

            //解析返回内容到string
            var responseString = await response.Content.ReadAsStringAsync();
            //return header;

            return Content(responseString, "text/html");

        }


        /// <summary>
        /// 还可以加content-type
        /// </summary>
        /// <param name="echostr"></param>
        /// <returns></returns>
        [HttpGet]
        public object 返回纯字符串(string echostr)
        {
            return Content(echostr); //返回随机字符串则表示验证通过
            //还可以加content-type
            //return Content(responseString, "text/html");
        }

        /// <summary>
        /// Task.FromResult
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        async public Task<object> Index() => await Task.FromResult<string>("OK");

        /// <summary>
        /// 试试swagger里面上传文件
        /// 并返回文件内容,不保存
        /// </summary>
        /// <param name="files"></param>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpPost]
        public object testUpload(Microsoft.AspNetCore.Http.IFormFileCollection files)
        {
            var sr = new StreamReader(files[0].OpenReadStream());
            return sr.ReadToEnd();
        }

        /// <summary>
        /// 根据code取openid,接着取该openid绑定的用户信息;
        /// OAuthScope.snsapi_base方式回调
        /// </summary>
        /// <param name="code"></param>
        /// <param name="state"></param>
        /// <param name="returnUrl">用户最初尝试进入的页面</param>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task<object> 测试merge人员OpenId([FromBody]人员OpenId model) =>
            await Db.Merge(model);

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object 测试获取ip() =>
            new
            {
                请求的ip = HttpContext.Connection.RemoteIpAddress.ToString(),
                请求的端口 = HttpContext.Connection.RemotePort.ToString(),
                网站的ip = Request.Host.Host,
                网站的端口 = Request.Host.Port
            };

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public object 测试CurrentUser() => CurrentUser;

        /// <summary>
        /// 看看即可
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        public object 测试vs里面dapper的事务用func传进去的写法([FromBody] 教学科室 data)
        {
            //Task<教学科室> myTran(SqlConnection dbForTransaction, SqlTransaction transaction) =>
            //    dbForTransaction.Merge<教学科室>(data, transaction);

            //return await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
            return "自己看代码";
        }

        /// <summary>
        /// 这是不可能的,只能重写,不能屏蔽;
        /// 但是可以用Obsolete来实现swagger的post时不显示~~
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [HttpPost]
        public object 测试子类屏蔽父类的某个属性([FromBody] 子类class1 obj)
        {
            return obj;
        }

        public class 父类class1
        {
            public int 年纪 { get; set; }
            public int 岁数 { get; set; }
        }

        public class 子类class1 : 父类class1
        {
            /// <summary>
            /// 不需要这样写哈,这么写是为说明子类不能屏蔽父类属性;
            /// 要obsolete直接写在父类即可;
            /// </summary>
            [Obsolete]
            public new int 年纪 { get; }
        }

        [HttpPost]
        async public  Task<object> 测试发送微信模板消息([FromBody]MyWxTemplate myData)
        {
            var appId = Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestappId" : "WechatSetting:appId");
            var appSecret = Config.GetValue<string>(Env.IsDevelopment() == true ? "WechatSetting:TestappSecret" : "WechatSetting:appSecret");

            var myMessage = new MyWxTemplate()
            {
                touser = "o67SQ1t_HcG8izl34cNWjfvWVJMQ",
                url = "www.baidu.com",
                template_id = "WmBf7XFKUDLuq09KliZa0FPayzLUNQT0DNhZqeBPluI",
                data = new MyWxData()
                {
                    first = new MyWxFirst() { value = "小贾同志" },
                    keyword1 = new MyWxKeynote() { value = "你的模板消息" ,color = "red"},
                    keyword2 = new MyWxKeynote() { value = "老子" },
                    keyword3 = new MyWxKeynote() { value = "给你搞定了" },
                    keyword4 = new MyWxKeynote() { value = "你要请我吃饭" },
                    remark = new MyWxRemark() { value = "哈哈哈哈" }
                }
            };

            return MyLib.MyWx.SentMessage(appId, appSecret, myData);
        }

        public class 测试时间传入model
        {
            public DateTime date1 { get; set; }
            public DateTime? date2 { get; set; }

            [Required]
            public DateTime date3 { get; set; }

            [Required]
            public DateTime? date4 { get; set; }

            public int int1 { get; set; }
            public int? int2 { get; set; }

            [Required]
            public int int3 { get; set; }
            [Required]
            public int? int4 { get; set; }
        }

        /// <summary>
        /// date1 不传就会是0001-01-01 00:00:00
        /// date2 不传就是null,正确
        /// date3不传也不会提示必填,默认给一个0001-01-01 00:00:00
        /// date4不传会提示必填,正确;
        /// int 同理
        /// 注意只有在post的时候才会发生;
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        public object 测试时间传入([FromBody]测试时间传入model data)
        {
            return data;
        }
    }
}