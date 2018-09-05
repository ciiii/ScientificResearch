﻿using System;
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

namespace ScientificResearch.Controllers
{
    [Produces("application/json")]
    [Consumes("application/json", "multipart/form-data")]//此处为新增
    [Route("[controller]/[action]")]
    public class TestController : BaseController
    {
        [HttpGet]
        public object GetJObejctString()
        {
            return new TestBusiness().TestJObject();
        }

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

        [HttpGet]
        public object 测试下tryParse的写法()
        {
            return int.TryParse("111", out int from) ? (int?)from : null;
        }

        [HttpGet]
        public object 测试下csharp的可列举数据处理()
        {
            return Enumerable.Range(0, 10).Select(i => new { a = i, b = i + 100 });
        }

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

        public class Product
        {
            public string Name { get; set; }
            public IEnumerable<int> Children { get; set; }
        }

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

        [HttpGet]
        public object TestPoint(MyClass x)
        {
            x = null;
            return new { x, x?.字段 };
        }

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

    }
}