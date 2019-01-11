using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using log4net;
using log4net.Config;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using MyLib;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using ScientificResearch.Infrastucture;

using Swashbuckle.AspNetCore.Swagger;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace ScientificResearch
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
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

            #region 测试一个全局配置数据的使用
            //services.AddSingleton<Models.系统角色组编号>(configRoot.GetSection("系统角色组编号").Get<Models.系统角色组编号>());
            //services.AddSingleton<Models.系统角色组编号>(JsonConvert.DeserializeObject < Models.系统角色组编号 >(configRoot.GetSection("系统角色组编号").Value));
            #endregion

            //log4net
            services.AddSingleton<ILog>(p =>
            {
                var repository = LogManager.CreateRepository("ScientificResearch");
                XmlConfigurator.Configure(repository, new FileInfo("log4net.xml"));
                return LogManager.GetLogger(repository.Name, repository.Name);
            });

            //jwt 1/4 对jwt的解析做配置
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        //将下面两个参数设置为false，可以不验证Issuer和Audience，但是不建议这样做。
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidIssuer = Configuration.GetValue<string>("JWT:ValidIssuer"),
                        ValidAudience = Configuration.GetValue<string>("JWT:ValidAudience"),

                        //是否要求Token的Claims中必须包含Expires
                        RequireExpirationTime = false,
                        //是否验证Token有效期，使用当前时间与Token的Claims中的NotBefore和Expires对比
                        ValidateLifetime = false,

                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["JWT:SecurityKey"])),

                        // RequireSignedTokens = true,
                        // SaveSigninToken = false,
                        // ValidateActor = false,
                        // ValidateIssuerSigningKey = false,
                        // 允许的服务器时间偏移量
                        // ClockSkew = TimeSpan.FromSeconds(300),
                    };
                });

            //Compression
            services.AddResponseCompression();

            #region 暂时没用的ResponseCaching + redis + DataProtection + 注入的sqlserver连接 + session等
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
            //services.AddSession();

            //services.Configure<Microsoft.Extensions.WebEncoders.WebEncoderOptions>(options =>
            //{
            //    options.TextEncoderSettings = new System.Text.Encodings.Web.TextEncoderSettings(System.Text.Unicode.UnicodeRanges.All);
            //});

            //sql,如果是动态指定数据库,那么每种数据库链接指定不同的login页面,在login时指定用户关联到哪个数据库并保存在session里面.然后每一次请求时,读取指定的key来建立db的连接;2018-5-7 换成了在访问时动态切换数据库
            //services.AddTransient<IDbConnection>(p => new SqlConnection(Configuration.GetValue<string>("connectionString:ScientificResearch")));
            #endregion

            //mvc
            services.AddMvc(option =>
            {
                //自定义的过滤器
                //option.Filters.Add(new MyAuthorizationFilter());  //用了jwt这玩意儿就没啥用了;
                option.Filters.Add(new MyActionFilter());
                option.Filters.Add(new MyResultFilter());

                #region 不好删又暂时没想起来是什么意思的几个东西
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
                #endregion
            }).AddJsonOptions(option =>
            {
                //返回的时间类型的格式
                option.SerializerSettings.DateFormatString = "yyyy'-'MM'-'dd' 'HH':'mm':'ss";
                //DefaultContractResolver 是默认的序列化,开头是大写就是大写
                //CamelCasePropertyNamesContractResolver 这个是开头小写的驼峰命名法
                option.SerializerSettings.ContractResolver = new DefaultContractResolver();
            });

            //swagger
            services.AddSwaggerGen(option =>
            {
                option.OperationFilter<SwaggerFileUploadFilter>();//增加文件过滤处理

                var security = new Dictionary<string, IEnumerable<string>> { { "Bearer", new string[] { } }, };
                option.AddSecurityRequirement(security);//添加一个必须的全局安全信息，和AddSecurityDefinition方法指定的方案名称要一致，这里是Bearer。

                option.AddSecurityDefinition("Bearer", new ApiKeyScheme
                {
                    Description = "权限认证(数据将在请求头中进行传输) 参数结构: \"Authorization: Bearer {token}\"",
                    Name = "Authorization",//jwt默认的参数名称
                    In = "header",//jwt默认存放Authorization信息的位置(请求头中)
                    Type = "apiKey"
                });//Authorization的设置

                option.IgnoreObsoleteActions();
                option.IgnoreObsoleteProperties();

                option.SwaggerDoc("ScientificResearch", new Info { Title = "科研管理系统-API", Version = "ScientificResearch-v1" });
                option.SwaggerDoc("test", new Info { Title = "测试-API", Version = "test-v1" });
                option.SwaggerDoc("TeachingManagement", new Info { Title = "教学管理-API", Version = "TeachingManagement-v1" });
                option.SwaggerDoc("Manage", new Info { Title = "主库-API", Version = "Manage-v1" });

                option.DocInclusionPredicate((docName, apiDesc) =>
                {
                    if (!apiDesc.TryGetMethodInfo(out MethodInfo methodInfo)) return false;
                    var versions = methodInfo.DeclaringType
                                             .GetCustomAttributes(true)
                                             .OfType<ApiExplorerSettingsAttribute>()
                                             .Select(attr => attr.GroupName);

                    if (docName == "ScientificResearch" && versions.FirstOrDefault() == null) return true;

                    return versions.Any(v => v.ToString() == docName);

                });

                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "ScientificResearchApi.xml");
                option.IncludeXmlComments(filePath);
            });

            #region hangfire
            ////hangfire 先用redis,sql以后再说
            //services.AddHangfire(c => c.UseRedisStorage(services.BuildServiceProvider().GetService<IConfigurationRoot>().GetSection("redisConnectionString").Value));
            #endregion
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
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
                    context.Response.ContentType = "application/json; charset=utf-8";
                    await context.Response.WriteAsync(JsonConvert.SerializeObject(new { error = ex.Message }));

                    //继续抛
                    //throw ex;
                }
            });

            #region hangfire
            ////hangfire
            //app.UseHangfireServer();
            //app.UseHangfireDashboard();
            #endregion

            //在mvc之前
            app.UseResponseCompression();

            //Microsoft.AspNetCore.ResponseCaching
            //app.UseResponseCaching();

            //web api应用默认用的wwwroot根目录作为静态文件目根录,
            var staticfile = new StaticFileOptions();
            //设置扩展文件名mime映射
            var provider = new FileExtensionContentTypeProvider();
            //provider.Mappings.Add(".log", "text/plain");//手动设置对应MIME
            provider.Mappings[".txt"] = "application/txt";      //手动设置对应MIME
            //provider.Mappings[".txt"] = "application/octet-stream";      //手动设置对应MIME
            staticfile.ContentTypeProvider = provider;
            app.UseStaticFiles(staticfile);

            #region Session
            //注意顺序 UseSession必须在UseMvc之前;有了session,mvc才能用
            //使用了distributedRedisCache以后,这个就是设置了redis对于session的过期时间了 
            //app.UseSession(new SessionOptions() { IdleTimeout = TimeSpan.FromDays(1) });
            #endregion

            //2018/1/29为了让不能设置content-type的XDomainRequest的content-type为json
            app.Use(async (context, next) =>
            {
                if (string.IsNullOrWhiteSpace(context.Request.ContentType) || context.Request.ContentType == "context.Request.ContentType")
                    context.Request.ContentType = "application/json";

                await next();
            });

            #region cors
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
            #endregion

            //test jwt 2/4 在管道应用jwt验证
            app.UseAuthentication();

            //mvc 注意顺序:3 抓异常写好之后(里面都有个try{await next}),再是mvc的中间件
            app.UseMvc();

            //经由Swagger
            app.UseSwagger(c =>
            {
                c.RouteTemplate = "swagger/{documentName}/swagger.json";
            });
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/ScientificResearch/swagger.json", "ScientificResearch-v1");
                c.SwaggerEndpoint("/swagger/test/swagger.json", "test-v1");
                c.SwaggerEndpoint("/swagger/TeachingManagement/swagger.json", "TeachingManagement-v1");
                c.SwaggerEndpoint("/swagger/Manage/swagger.json", "Manage-v1");
            });
        }
    }
}
