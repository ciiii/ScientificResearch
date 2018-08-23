using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using log4net;
using log4net.Config;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

using MyLib;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using ScientificResearch.Infrastucture;

namespace ScientificResearch
{
    /// <summary>
    /// 
    /// </summary>
    public class Startup
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="configuration"></param>
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        /// <summary>
        /// 
        /// </summary>
        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        /// <summary>
        /// 
        /// </summary>
        /// <param name="services"></param>
        public void ConfigureServices(IServiceCollection services)
        {
            #region 对于配置文件,废弃的18-4-2之前方法;
            //配置文件,对于appsetting.json.可以不用这么写.直接使用Configuration,这个Configuration也注入到了services.BuildServiceProvider().GetService<IConfiguration>()里面;
            //也就是可以直接使用 Configuration.GetValue<string>("connectionString:ScientificResearch");
            //如果是其他文件,可以用下面这个
            //另外:Mylib.IConfigurationRootExtensions不需要了,直接使用IConfiguration.GetValue<T>泛型方法即可;
            //var configRoot = new ConfigurationBuilder().
            //    SetBasePath(Directory.GetCurrentDirectory()).
            //    AddJsonFile("appsettings.json", false, true).
            //    Build();

            //services.AddSingleton<IConfigurationRoot>(configRoot);
            #endregion

            //测试一个全局配置数据的使用
            //services.AddSingleton<Models.系统角色组编号>(configRoot.GetSection("系统角色组编号").Get<Models.系统角色组编号>());
            //services.AddSingleton<Models.系统角色组编号>(JsonConvert.DeserializeObject < Models.系统角色组编号 >(configRoot.GetSection("系统角色组编号").Value));

            //log4net
            services.AddSingleton<ILog>(p =>
            {
                var repository = LogManager.CreateRepository("ScientificResearch");
                XmlConfigurator.Configure(repository, new FileInfo("log4net.xml"));
                return LogManager.GetLogger(repository.Name, repository.Name);
            });

            //Compression
            services.AddResponseCompression();


            //Microsoft.AspNetCore.ResponseCaching,没啥用
            //services.AddResponseCaching();

            ////redis
            //services.AddSingleton<IConnectionMultiplexer>(s =>
            //{
            //    return ConnectionMultiplexer.Connect(s.GetService<IConfigurationRoot>().GetSection("redisConnectionString").Value);
            //});

            ////Microsoft.AspNetCore.DataProtection;
            //services.AddDataProtection().PersistKeysToRedis(services.BuildServiceProvider().GetService<IConnectionMultiplexer>(), "DataProtection-Test-Keys:");

            ////AddDistributedRedisCache for session
            //services.AddDistributedRedisCache(option =>
            //{
            //    //redis 数据库连接字符串
            //    option.Configuration = services.BuildServiceProvider().GetService<IConfigurationRoot>().GetSection("redisConnectionString").Value;
            //    //redis 实例名
            //    option.InstanceName = "session:";
            //});

            //Session;befor mvc
            //services.AddSession(sessioOptions => sessioOptions.Cookie.Name = "x");
            services.AddSession();


            //services.Configure<Microsoft.Extensions.WebEncoders.WebEncoderOptions>(options =>
            //{
            //    options.TextEncoderSettings = new System.Text.Encodings.Web.TextEncoderSettings(System.Text.Unicode.UnicodeRanges.All);
            //});

            //mvc
            services.AddMvc(option =>
            {
                //自定义的过滤器
                option.Filters.Add(new MyAuthorizationFilter());
                option.Filters.Add(new MyActionFilter());
                option.Filters.Add(new MyResultFilter());
                //如果 Accept 头中包含 /，那么 Header 将被忽略，除非 MvcOptions 的 RespectBrowserAcceptHeader 设置为 true。
                //                与其它 API 客户端不同，Web 浏览器一般都会在请求中包含 Accept 头，其中使用通配符（wildcards）。默认情况下，当框架检测到请求来自浏览器，它就会忽略 Accept 头并返回应用程序配置的默认格式（如果没有另行安排，则默认为 JSON 格式）。这样一来，当使用不同的浏览器消费 API 时提供一致的体验。
                //如果你希望你的应用程序优先考虑浏览器的 Accept 头，你可以在 MVC 的配置中进行相关配置，具体来讲是在 Startup.cs 的 ConfigureServices 方法中将 RespectBrowserAcceptHeader 设置为 true。
                //services.AddMvc(options =>
                //{
                //    options.RespectBrowserAcceptHeader = true; // false by default
                //}
                //option.RespectBrowserAcceptHeader = true;

                //option.OutputFormatters.RemoveType<TextOutputFormatter>();
                //option.OutputFormatters.RemoveType<HttpNoContentOutputFormatter>();
                //option.OutputFormatters.Add(new StringOutputFormatter());
            }).AddJsonOptions(option =>
            {
                //返回的时间类型的格式
                option.SerializerSettings.DateFormatString = "yyyy'-'MM'-'dd' 'HH':'mm':'ss";
                //DefaultContractResolver 是默认的序列化,开头是大写就是大写
                //CamelCasePropertyNamesContractResolver 这个是开头小写的驼峰命名法
                option.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            });

            //swagger
            services.AddSwaggerGen(p =>
            {
                p.SwaggerDoc("v1", new Swashbuckle.AspNetCore.Swagger.Info { Title = "科研管理系统-API", Version = "v1" });
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "ScientificResearchApi.xml");
                p.IncludeXmlComments(filePath);
            });

            //sql,如果是动态指定数据库,那么每种数据库链接指定不同的login页面,在login时指定用户关联到哪个数据库并保存在session里面.然后每一次请求时,读取指定的key来建立db的连接;2018-5-7 换成了在访问时动态切换数据库
            //services.AddTransient<IDbConnection>(p => new SqlConnection(Configuration.GetValue<string>("connectionString:ScientificResearch")));

            ////hangfire 先用redis,sql以后再说
            //services.AddHangfire(c => c.UseRedisStorage(services.BuildServiceProvider().GetService<IConfigurationRoot>().GetSection("redisConnectionString").Value));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        /// <summary>
        /// 
        /// </summary>
        /// <param name="app"></param>
        /// <param name="env"></param>
        /// <param name="log"></param>
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILog log)
        {
            #region 每个请求都log一下
            //app.Use((context, next) =>
            //{
            //log.Info(
            //    $"\r\n{context.Request.Method}" +
            //    $"\r\n{context.Request.Host}" +
            //    $"\r\n{context.Request.PathBase}" +
            //    $"\r\n{context.Request.Path}" +
            //    $"\r\n{context.Request.QueryString}" +
            //    $"\r\n");
            //return next();
            // });
            #endregion

            #region 网页可以用下面的,api就不用了
            //注意顺序:1 最外层的抓取异常;
            if (env.IsDevelopment())
            {
                //开发环境下,抛异常
                app.UseDeveloperExceptionPage();
            }
            else
            {
                //生产环境下到公益404,注意在swaggerUi是重定向不了的;
                app.UseExceptionHandler(appBuilder => appBuilder.Run(async context => await Task.Run(() =>
                {
                    context.Response.Redirect(Configuration.GetValue<string>("page404"));
                })));
            }
            #endregion

            //记录错误,然后继续抛
            app.Use(async (context, next) =>
            {
                //once you read it, its gone
                var bodyStr = string.Empty;
                context.Request.EnableRewind();
                using (StreamReader reader = new StreamReader(context.Request.Body, Encoding.UTF8, true, 1024, true))
                {
                    bodyStr = reader.ReadToEnd();
                }
                context.Request.Body.Position = 0;

                try
                {
                    await next();
                }
                catch (Exception ex)
                {
                    var strRequestHeaders = string.Join("\r\n", context.Request.Headers.Select(i => i.ToString()).ToArray());

                    log.Error($"\r\n" +
                        $"TODO:FIXME:请求方法:{context.Request.Method}\r\n" +
                        $"FIXME:请求头:{strRequestHeaders}\r\n" +
                        $"FIXME:请求路径:{context.Request.Host.ToString() + context.Request.Path.ToString()} \r\n" +
                        $"FIXME:url参数:{context.Request.QueryString}\r\n" +
                        $"FIXME:data参数:{bodyStr}\r\n" +
                        $"FIXME:时间{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}——{ex.GetType().ToString()}：{ex.Message}\r\n" +
                        $"FIXME:堆栈信息：\r\n" +
                        $"{ex.StackTrace}\r\n");

                    //context.Response.StatusCode = 500;
                    //2017/12/25 前端要求的返回,错误格式;
                    await context.Response.WriteAsync(JsonConvert.SerializeObject(new { error = ex.Message }));

                    //继续抛
                    //throw ex;
                }
            });

            ////hangfire
            //app.UseHangfireServer();
            //app.UseHangfireDashboard();

            //在mvc之前Microsoft.AspNetCore.UseResponseCompression
            app.UseResponseCompression();
            //Microsoft.AspNetCore.ResponseCaching
            //app.UseResponseCaching();

            //web api应用默认用的wwwroot根目录作为静态文件目根录,
            app.UseStaticFiles();

            //注意顺序 UseSession必须在UseMvc之前;有了session,mvc才能用
            //使用了distributedRedisCache以后,这个就是设置了redis对于session的过期时间了 
            app.UseSession(new SessionOptions() { IdleTimeout = TimeSpan.FromMinutes(30) });

            //2018/1/29为了让不能设置content-type的XDomainRequest的content-type为json
            app.Use(async (context, next) =>
            {
                if (string.IsNullOrWhiteSpace(context.Request.ContentType) || context.Request.ContentType == "context.Request.ContentType")
                    context.Request.ContentType = "application/json";

                await next();
            });

            //cors自己写,2018-7-10,将前台结合到了本工程,没用跨域了;
            //app.Use(async (context, next) =>
            //{

            //    //2018/1/29为了让不能设置content-type的XDomainRequest的content-type为json
            //    if (string.IsNullOrWhiteSpace(context.Request.ContentType)
            //        || context.Request.ContentType == "context.Request.ContentType")
            //        context.Request.ContentType = "application/json";

            //    context.Response.Headers.Add("Access-Control-Allow-Origin", "*");
            //    context.Response.Headers.Add("Access-Control-Allow-Headers", "content-type,*");
            //    context.Response.Headers.Add("Access-Control-Allow-Methods", "PUT,GET,POST,OPTIONS");
            //    //context.Response.Headers.Add("Access-Control-Allow-Credentials", "true");

            //    //Request.Headers.AllKeys.Contains("Origin") &&
            //    if (context.Request.Method == "OPTIONS")
            //    {
            //        context.Response.StatusCode = 202;
            //        await context.Response.WriteAsync("OK");
            //    }
            //    else
            //    {
            //        await next();
            //    }
            //});

            //注意顺序:3 抓异常写好之后(里面都有个try{await next}),再是mvc的中间件
            app.UseMvc();

            //经由Swagger
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "ScientificResearchApi-v1");
            });
        }
    }
}
