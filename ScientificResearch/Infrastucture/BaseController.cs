using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using MyLib;
using ScientificResearch.Models;
using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Infrastucture
{
    /// <summary>
    /// 基础控制器
    /// </summary>
    [Produces("application/json")]
    [Consumes("application/json", "multipart/form-data")]
    //[Route("[area]/[controller]/[action]")] 
    [Route("[controller]/[action]")]
    // jwt 5/4
    [Authorize]
    public class BaseController<T> : Controller where T : CurrentUserBase, new()
    {
        /// <summary>
        ///  配置,使用config.GetValue T来读取
        /// </summary>
        protected IConfiguration Config => HttpContext.RequestServices.GetService<IConfiguration>();

        /// <summary>
        /// 测试获取自定义的全局配置数据
        /// </summary>
        protected 系统角色组编号 测试获取自定义的全局配置数据
        {
            get
            {
                return Config.GetSection("系统角色组编号").Get<Models.系统角色组编号>();
            }
        }

        /// <summary>
        /// 日志服务
        /// </summary>
        protected ILog Log => HttpContext.RequestServices.GetService<ILog>();

        /// <summary>
        /// 原始的连接字串,具体连接哪个库还没有指定
        /// 登录时可以用这个临时生成一个连接;
        /// </summary>
        public string DbConnectionStringLack =>
            Config.GetValue<string>("connectionString:ScientificResearch");

        /// <summary>
        /// 指定连接的库为当前登录人的库,字串可用于事务,也可用于下面的db
        /// </summary>
        public string DbConnectionString => DbConnectionStringLack.Replace("{0}", CurrentUser.DbKey);


        /// <summary>
        /// 获取当前登录者的数据库链接;可能在login方法中另做一个
        /// 也可以这么写: public IDbConnection Db => new SqlConnection(DbConnectionString);
        /// </summary>
        public IDbConnection Db
        {
            get
            {
                return new SqlConnection(DbConnectionString);
            }
        }

        /// <summary>
        /// 主库
        /// </summary>
        public SqlConnection Db_Manage => new SqlConnection(Config.GetValue<string>("connectionString:ScientificResearch_Manage"));

        ///// <summary>
        ///// redis服务的db对象 
        ///// </summary>
        ////protected IConnectionMultiplexer redis => HttpContext.RequestServices.GetService<IConnectionMultiplexer>();
        //protected IDatabase RedisDb => HttpContext.RequestServices.GetService<IConnectionMultiplexer>().GetDatabase();

        /// <summary>
        /// 网站服务器环境
        /// </summary>
        protected IHostingEnvironment Env => HttpContext.RequestServices.GetService<IHostingEnvironment>();

        #region 以前的CurrentUser的写法
        ///// <summary>
        ///// 登录人的信息
        ///// </summary>
        //protected CurrentUser CurrentUser
        //{
        //    get
        //    {
        //        var currentUser = HttpContext.Session.Get<CurrentUser>("user");
        //        if (currentUser == null)
        //        {
        //            if (!Env.IsDevelopment())
        //            {
        //                HttpContext.Response.StatusCode = 401;
        //                throw new Exception("请登录");
        //            }
        //            else
        //            {
        //                HttpContext.Session.Set<CurrentUser>("user", new CurrentUser()
        //                {
        //                    姓名 = "管理员",
        //                    工号 = "0001",
        //                    编号 = 2,
        //                    部门编号 = 10024,
        //                    部门名称 = "信息处",
        //                    DbKey = "ScientificResearch_Test"
        //                });
        //                currentUser = HttpContext.Session.Get<CurrentUser>("user");
        //            }
        //        }
        //        return currentUser;
        //    }
        //}

        //jwt 4/4
        //protected CurrentUser CurrentUser
        //{
        //    get
        //    {
        //            var currentUser =new CurrentUser();

        //        currentUser.SetValueByPropertyName(
        //            nameof(currentUser.姓名),
        //            User.Claims.Where(i => i.Type == nameof(currentUser.姓名)).SingleOrDefault().Value
        //        );

        //        currentUser.SetValueByPropertyName(
        //            nameof(currentUser.工号),
        //            User.Claims.Where(i => i.Type == nameof(currentUser.工号)).SingleOrDefault().Value
        //        );

        //        currentUser.SetValueByPropertyName(
        //            nameof(currentUser.编号),
        //            User.Claims.Where(i => i.Type == nameof(currentUser.编号)).SingleOrDefault().Value
        //        );

        //        currentUser.SetValueByPropertyName(
        //            nameof(currentUser.部门编号),
        //            User.Claims.Where(i => i.Type == nameof(currentUser.部门编号)).SingleOrDefault().Value
        //        );

        //        currentUser.SetValueByPropertyName(
        //            nameof(currentUser.部门名称),
        //            User.Claims.Where(i => i.Type == nameof(currentUser.部门名称)).SingleOrDefault().Value
        //        );

        //        currentUser.SetValueByPropertyName(
        //            nameof(currentUser.DbKey),
        //            User.Claims.Where(i => i.Type == nameof(currentUser.DbKey)).SingleOrDefault().Value
        //        );

        //        return currentUser;
        //    }
        //}
        #endregion

        /// <summary>
        /// 登录人信息
        /// 根据T来取User.Claims里面对应的数据
        /// 如果找到了,就取第一个匹配的claim的value
        /// </summary>
        protected T CurrentUser
        {
            get
            {
                var currentUser = new T();

                var propertys = typeof(T).GetProperties();
                for (int i = 0; i < propertys.Count(); i++)
                {
                    var p = propertys[i];
                    var v = User.Claims.Where(j => j.Type == p.Name).FirstOrDefault();
                    if (v != null)
                    {
                        currentUser.SetValueByPropertyName(
                            p.Name, v.Value
                        );
                    }
                }

                return currentUser;
            }
        }
    }

}

