using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Business;
using ScientificResearch.Infrastucture;
using ScientificResearch.Models;

using Dapper;
using MyLib;
using Microsoft.Extensions.Configuration;
using System.IO;
using System.Data;
using System.Text;

namespace ScientificResearch.Controllers
{
    public class FruitController : BaseController
    {
        public int 纵向项目立项流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:纵向项目立项");
            }
        }

        public int 横向项目申请流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:横向项目申请");
            }
        }

        public int 论文管理流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:论文管理");
            }
        }

        public int 认领论文流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:认领论文");
            }
        }

        public int 著作管理流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:著作管理");
            }
        }

        public int 专利管理流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:专利管理");
            }
        }

        public int 获奖管理流程模板编号
        {
            get
            {
                return Config.GetValue<int>("流程模板编号:获奖管理");
            }
        }

        public enum 成果类型
        {
            论文 = 1, 著作 = 2, 专利 = 3, 获奖 = 4
        }


        #region 论文管理
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        async public Task<object> 获取论文辅助数据()
        {
            var 所属栏目 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "所属栏目" }, tbName: "字典", tbFields: "值");
            var 计划来源分类 = await Db.GetListSpAsync<字典, 字典Filter>(new 字典Filter() { 分类 = "计划来源分类" }, tbName: "字典");
            var 计划来源 = await Db.GetListSpAsync<字典, 字典Filter>(new 字典Filter() { 分类 = "计划来源" }, tbName: "字典");

            //var 计划来源分类 = from item in 计划来源分类temp
            //             select new
            //             {
            //                 分类名称 = item.值,
            //                 计划来源 = from item2 in 计划来源temp where item2.上级编号 == item.编号 select item2.值
            //             };

            var 论文版面 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "论文版面" }, tbName: "字典", tbFields: "值");
            var 学科门类 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "学科门类" }, tbName: "字典", tbFields: "值");
            var 论文类型 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "论文类型" }, tbName: "字典", tbFields: "值");
            var 论文作者级别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "论文作者级别" }, tbName: "字典", tbFields: "值");

            //var 所属栏目temp = Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "所属栏目" }, tbName: "字典", tbFields: "值");
            //await Task.WhenAll(所属栏目temp);
            //所属栏目temp.Result;

            return new
            {
                所属栏目,
                计划来源分类,
                计划来源,
                论文版面,
                学科门类,
                论文类型,
                论文作者级别
            };
        }

        /// <summary>
        /// 单独录入论文或认领,同时开启审核流程
        /// 批量导入的不会开启流程,只有在认领时才会
        /// 相关项目和作者项中的"成果类型"和"成果编号"不需要前台填写;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 新增论文([FromBody]成果增改<成果论文> model)
        {
            //这里要主动给加上认领人
            model.基本资料.认领人编号 = CurrentUser.编号;
            //await 发起一个成果论文增改流程<成果论文>(model, 论文管理流程模板编号);
            await MyWorkFlowBusiness.发起流程(
                           论文管理流程模板编号,
                           new sp_成果论文_增改
                           {
                               tt = model.基本资料.ToDataTable(),
                               //tt_成果项目 = model.相关项目.ToDataTable(),
                               tt_成果项目 = 合并纵向横向成果项目(model).ToDataTable(),
                               tt_成果作者 = model.作者.ToDataTable()
                           },
                            CurrentUser.编号,
                            model.IsHold);
        }

        private IEnumerable<成果项目> 合并纵向横向成果项目<T>(成果增改<T> model)
        {
            var 纵向成果项目 = model.相关纵向项目编号.Select(i => new 成果项目() { 项目类型 = 纵向项目立项流程模板编号, 项目编号 = i });
            var 横向成果项目 = model.相关横向项目编号.Select(i => new 成果项目() { 项目类型 = 横向项目申请流程模板编号, 项目编号 = i });
            return 纵向成果项目.Concat(横向成果项目);
        }

        [HttpPost]
        async public Task<object> 导入知网论文()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
               Request.Form.Files,
               Env.WebRootPath,
               "upload/成果/论文/导入知网论文",
               Config.GetValue<int>("uploadFileMaxSize"));
            var fileName = filesNameList[0];

            //var f = "C:\\Users\\Administrator\\Desktop\\123.xlsx";

            var result = MyXls.Import<论文导入>(MyPath.Combine(Env.WebRootPath, fileName));

            await 导入整理后的公网论文数据(result);
            //return result;
            return fileName;
        }

        /// <summary>
        /// 无论是知网还是万网,无论是xlsx还是endnote文件,最后都会整理为IEnumerable[论文导入]来此;
        /// </summary>
        /// <param name="result"></param>
        /// <returns></returns>
        private async Task 导入整理后的公网论文数据(IEnumerable<论文导入> result)
        {
            result = result.Where(i => !string.IsNullOrWhiteSpace(i.论文标题));

            foreach (var item in result)
            {
                item.论文摘要 = item.作者 + Environment.NewLine + item.论文摘要;
                var authors = item.作者.Split(";");
                item.作者 = authors.FirstOrDefault();
                item.作者人数 = authors.Count();
                var pageFromTo = item.页码范围.Split("-");
                if (pageFromTo.Count() > 1)
                {
                    item.页码范围起 = int.TryParse(pageFromTo[0], out int from) ? (int?)from : null;
                    item.页码范围止 = int.TryParse(pageFromTo[1], out int to) ? (int?)to : null;
                }
            }

            TryValidateModel(result);
            await Db.ExecuteSpAsync(new sp_导入论文() { tt = result.ToDataTable() });
        }

        [HttpPost]
        async public Task<object> 导入endnote格式的论文()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
              Request.Form.Files,
              Env.WebRootPath,
              "upload/成果/论文/导入知网论文",
              Config.GetValue<int>("uploadFileMaxSize"));

            var fileName = filesNameList[0];
            //var fileName = @"C:\Users\Ly\Desktop\CNKI-636713025263281250.txt";

            //var gb2312 = Encoding.GetEncoding("GB2312");
            //var sr = new StreamReader(MyPath.Combine(Env.WebRootPath, fileName), gb2312, true); //,System.Text.Encoding.GetEncoding("gb2312")

            var sr = new StreamReader(MyPath.Combine(Env.WebRootPath, fileName), Encoding.Default); //,System.Text.Encoding.GetEncoding("gb2312")

            var endnote与论文字段对应关系 = Config.GetSection("endnote与论文字段对应关系").Get<IDictionary<string, string>>();

            //将数据按空行分段读取到不同的List<string>
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

            //每个List<string>解析为一个论文导入对象,其中作者有特殊的多个构成方式;
            var listOf论文 = new List<论文导入>();
            foreach (var item in listOfObj)
            {
                if (item.Count() == 0) continue;
                var new论文 = new 论文导入();
                ////难道这样顺序的赋值,会让 new论文 之中的属性的顺序发生变化,并且影响到后面todatatable的映射???!!!
                //foreach (var itemProp in item)
                //{
                //    //TODO:改为reg
                //    var keyInProp = itemProp.Substring(1, 1);
                //    var key = endnote与论文字段对应关系.ContainsKey(keyInProp) ? endnote与论文字段对应关系[keyInProp] : string.Empty;
                //    var value = itemProp.Substring(3);
                //    if (new论文.ContainProperty(key))
                //    {
                //        if (key == "作者")
                //        {
                //            new论文.作者 += $"{value};";
                //        }
                //        else
                //        {
                //            new论文.SetValueByPropertyName(key, value);
                //        }
                //    }
                //}

                //调整顺序会如何.没事...只有上面的情况会改变"顺序"
                //丑
                new论文.作者 = string.Join(";", item.Where(i => i.Substring(1, 1) == endnote与论文字段对应关系["作者"]).Select(j => j.Substring(3)));

                new论文.论文标题 = item.Where(i => i.Substring(1, 1) == endnote与论文字段对应关系["论文标题"]).FirstOrDefault().Substring(3);

                var yearValue = item.Where(i => i.Substring(1, 1) == endnote与论文字段对应关系["年度"]).FirstOrDefault();
                if (!string.IsNullOrWhiteSpace(yearValue))
                {
                    int.TryParse(yearValue.Substring(3), out int year);
                    new论文.年度 = year;
                }

                new论文.关键字 = item.Where(i => i.Substring(1, 1) == endnote与论文字段对应关系["关键字"]).FirstOrDefault().Substring(3);

                new论文.论文摘要 = item.Where(i => i.Substring(1, 1) == endnote与论文字段对应关系["论文摘要"]).FirstOrDefault().Substring(3);

                var volumeValue = item.Where(i => i.Substring(1, 1) == endnote与论文字段对应关系["卷号"]).FirstOrDefault();
                if (!string.IsNullOrWhiteSpace(volumeValue))
                {
                    int.TryParse(volumeValue.Substring(3), out int volume);
                    new论文.卷号 = volume;
                }

                var issueValue = item.Where(i => i.Substring(1, 1) == endnote与论文字段对应关系["期号"]).FirstOrDefault();
                if (!string.IsNullOrWhiteSpace(issueValue))
                {
                    int.TryParse(issueValue.Substring(3), out int issue);
                    new论文.期号 = issue;
                }
                
                new论文.页码范围 = item.Where(i => i.Substring(1, 1) == endnote与论文字段对应关系["页码范围"]).FirstOrDefault().Substring(3);

                new论文.刊物名称 = item.Where(i => i.Substring(1, 1) == endnote与论文字段对应关系["刊物名称"]).FirstOrDefault().Substring(3);

                listOf论文.Add(new论文);
            }

            await 导入整理后的公网论文数据(listOf论文);

            //return listOf论文;
            return fileName;
        }

        [HttpPost]
        async public Task<string> 导入自定义论文()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
               Request.Form.Files,
               Env.WebRootPath,
               "upload/成果/论文/导入自定义论文",
               Config.GetValue<int>("uploadFileMaxSize"));

            //var f = "C:\\Users\\Administrator\\Desktop\\导入论文成果模板.xlsx";

            var result = MyXls.Import<论文自定义导入>(MyPath.Combine(Env.WebRootPath, filesNameList[0]));
            //var result = MyXls.Import<论文自定义导入>($"{Env.WebRootPath}{filesNameList[0]}");
            //var result = MyXls.Import<论文自定义导入>(f);
            result = result.Where(i => !string.IsNullOrWhiteSpace(i.刊物名称));

            foreach (var item in result)
            {
                var pageFromTo = item.页码范围.Split("-");
                if (pageFromTo.Count() > 1)
                {
                    //int from = 0;
                    //int to = 0;
                    item.页码范围起 = int.TryParse(pageFromTo[0], out int from) ? (int?)from : null;
                    item.页码范围止 = int.TryParse(pageFromTo[1], out int to) ? (int?)to : null;

                }
            }

            TryValidateModel(result);
            await Db.ExecuteSpAsync(new sp_导入自定义论文() { tt = result.ToDataTable() });
            //await Db.ExecuteAsync(
            //    "sp_导入自定义论文",
            //    PredefinedSpExtention.GetMergeSpParamByModel<论文自定义导入>(result),
            //    commandType: CommandType.StoredProcedure);
            return filesNameList[0];
        }

        /// <summary>
        /// 被打回,ps:认领人不能变了;
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        async public Task 完善论文资料([FromBody]完成步骤<成果增改<成果论文>> model)
        {
            //await 完善成果论文资料(model);
            await MyWorkFlowBusiness.完成步骤(
                            model.ToSimple(), CurrentUser.编号,
                            new sp_成果论文_增改
                            {
                                tt = model.附加数据.基本资料.ToDataTable(),
                                tt_成果项目 = 合并纵向横向成果项目(model.附加数据).ToDataTable(),
                                tt_成果作者 = model.附加数据.作者.ToDataTable()
                            }, model.附加数据.IsHold);
        }

        [HttpPost]
        async public Task<object> 上传检索信息页相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/论文/检索信息页相关文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传论文正文()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/论文/论文正文",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传论文其他相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/论文/其他相关文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 分页获取论文(Paging paging, 论文Filter filter)
        {
            filter.Null认领人编号 = false;

            return await Db.GetPagingListSpAsync<object, 论文Filter>(
                paging,
                filter,
                $"tfn_成果论文({CurrentUser.编号},{论文管理流程模板编号})");
        }

        [HttpGet]
        async public Task<object> 分页获取可领取论文(Paging paging, 论文Filter filter)
        {
            filter.Null认领人编号 = true;
            return await Db.GetPagingListSpAsync<v1_成果论文_列表, 论文Filter>(
                   paging,
                   filter);
        }

        [HttpGet]
        async public Task<object> 获取论文详情(int 论文编号)
        {
            //var r1 = await Db.GetListSpAsync<v1_成果论文_详情, 论文Filter>(new 论文Filter() { 编号 = 论文编号 });
            var r1 = await Db.GetModelByIdSpAsync<v1_成果论文_详情>(论文编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_成果项目({(int)成果类型.论文},{论文编号})");
            var r3 = await Db.GetListSpAsync<object>($"tfn_成果作者({(int)成果类型.论文},{论文编号})");
            var r4 = await MyWorkFlowBusiness.获取某流程的步骤(论文管理流程模板编号, 论文编号);
            return new { 论文详情 = r1, 成果项目 = r2, 成果作者 = r3, 审核情况 = r4 };
        }
        #endregion

        #region 著作管理

        [HttpGet]
        async public Task<object> 获取著作辅助数据()
        {
            var 著作类型 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "著作类型" }, tbName: "字典", tbFields: "值");
            var 出版社级别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "出版社级别" }, tbName: "字典", tbFields: "值");
            var 语种类型 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "语种类型" }, tbName: "字典", tbFields: "值");
            var 学科门类 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "学科门类" }, tbName: "字典", tbFields: "值");
            var 著作作者级别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "著作作者级别" }, tbName: "字典", tbFields: "值");

            //var 所属栏目temp = Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "所属栏目" }, tbName: "字典", tbFields: "值");
            //await Task.WhenAll(所属栏目temp);
            //所属栏目temp.Result;

            return new
            {
                著作类型,
                出版社级别,
                语种类型,
                学科门类,
                著作作者级别
            };
        }


        [HttpPost]
        async public Task 新增著作([FromBody]成果增改<成果著作> model)
        {
            //await 发起一个成果著作增改流程<成果著作>(model, 著作管理流程模板编号);
            await MyWorkFlowBusiness.发起流程(
                           著作管理流程模板编号,
                           new sp_成果著作_增改
                           {
                               tt = model.基本资料.ToDataTable(),
                               tt_成果项目 = 合并纵向横向成果项目(model).ToDataTable(),
                               tt_成果作者 = model.作者.ToDataTable()
                           },
                           CurrentUser.编号,
                           model.IsHold);
        }

        [HttpPost]
        async public Task 完善著作资料([FromBody]完成步骤<成果增改<成果著作>> model)
        {
            //await 完善成果著作资料(model);
            await MyWorkFlowBusiness.完成步骤(
                            model.ToSimple(), CurrentUser.编号,
                            new sp_成果著作_增改
                            {
                                tt = model.附加数据.基本资料.ToDataTable(),
                                tt_成果项目 = 合并纵向横向成果项目(model.附加数据).ToDataTable(),
                                tt_成果作者 = model.附加数据.作者.ToDataTable()
                            },
                            model.附加数据.IsHold);
        }

        [HttpPost]
        async public Task<object> 上传封面相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/著作/封面相关文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传版权页相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/著作/版权页相关文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传前言页相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/著作/前言页相关文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传完整目录页相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/著作/完整目录页相关文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传著作其他相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/著作/其他相关文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 分页获取著作(Paging paging, 著作Filter filter) =>
            await Db.GetPagingListSpAsync<object, 著作Filter>(
                paging,
                filter,
                $"tfn_成果著作({CurrentUser.编号},{著作管理流程模板编号})");

        [HttpGet]
        async public Task<object> 获取著作详情(int 著作编号)
        {
            //var r1 = await Db.GetListSpAsync<v1_成果著作_详情, 著作Filter>(new 著作Filter() { 编号 = 著作编号 });
            var r1 = await Db.GetModelByIdSpAsync<v1_成果著作_详情>(著作编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_成果项目({(int)成果类型.著作},{著作编号})");
            var r3 = await Db.GetListSpAsync<object>($"tfn_成果作者({(int)成果类型.著作},{著作编号})");
            var r4 = await MyWorkFlowBusiness.获取某流程的步骤(著作管理流程模板编号, 著作编号);
            return new { 著作详情 = r1, 成果项目 = r2, 成果作者 = r3, 审核情况 = r4 };
        }
        #endregion

        #region 专利管理
        [HttpGet]
        async public Task<object> 获取专利辅助数据()
        {
            var 专利类型 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "专利类型" }, tbName: "字典", tbFields: "值");
            var 专利作者级别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "专利作者级别" }, tbName: "字典", tbFields: "值");
            return new
            {
                专利类型,
                专利作者级别
            };
        }

        [HttpPost]
        async public Task 新增专利([FromBody]成果增改<成果专利> model) =>
             //await 发起一个成果专利增改流程<成果专利>(model, 专利管理流程模板编号)
             await MyWorkFlowBusiness.发起流程(
                            专利管理流程模板编号,
                            new sp_成果专利_增改
                            {
                                tt = model.基本资料.ToDataTable(),
                                tt_成果项目 = 合并纵向横向成果项目(model).ToDataTable(),
                                tt_成果作者 = model.作者.ToDataTable()
                            },
                            CurrentUser.编号,
                            model.IsHold);

        [HttpPost]
        async public Task 完善专利资料([FromBody]完成步骤<成果增改<成果专利>> model) =>
            await MyWorkFlowBusiness.完成步骤(
                            model.ToSimple(), CurrentUser.编号,
                            new sp_成果专利_增改
                            {
                                tt = model.附加数据.基本资料.ToDataTable(),
                                tt_成果项目 = 合并纵向横向成果项目(model.附加数据).ToDataTable(),
                                tt_成果作者 = model.附加数据.作者.ToDataTable()
                            }, model.附加数据.IsHold);

        [HttpPost]
        async public Task<object> 上传专利相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/专利/相关文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 分页获取专利(Paging paging, 专利Filter filter) =>
            await Db.GetPagingListSpAsync<object, 专利Filter>(paging, filter, $"tfn_成果专利({CurrentUser.编号},{专利管理流程模板编号})");

        [HttpGet]
        async public Task<object> 获取专利详情(int 专利编号)
        {
            //var r1 = await Db.GetListSpAsync<v1_成果专利_详情, 专利Filter>(new 专利Filter() { 编号 = 专利编号 });
            var r1 = await Db.GetModelByIdSpAsync<v1_成果专利_详情>(专利编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_成果项目({(int)成果类型.专利},{专利编号})");
            var r3 = await Db.GetListSpAsync<object>($"tfn_成果作者({(int)成果类型.专利},{专利编号})");
            var r4 = await MyWorkFlowBusiness.获取某流程的步骤(专利管理流程模板编号, 专利编号);
            return new { 专利详情 = r1, 成果项目 = r2, 成果作者 = r3, 审核情况 = r4 };
        }
        #endregion

        #region 获奖管理
        [HttpGet]
        async public Task<object> 获取获奖辅助数据()
        {
            var 获奖级别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "获奖级别" }, tbName: "字典", tbFields: "值");
            var 获奖类别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "获奖类别" }, tbName: "字典", tbFields: "值");
            var 获奖等级 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "获奖等级" }, tbName: "字典", tbFields: "值");
            var 获奖作者级别 = await Db.GetListSpAsync<string, 字典Filter>(new 字典Filter() { 分类 = "获奖作者级别" }, tbName: "字典", tbFields: "值");
            return new
            {
                获奖级别,
                获奖类别,
                获奖等级,
                获奖作者级别
            };
        }

        [HttpPost]
        async public Task 新增获奖([FromBody]成果增改<成果获奖> model) =>
             await MyWorkFlowBusiness.发起流程(
                            获奖管理流程模板编号,
                            new sp_成果获奖_增改
                            {
                                tt = model.基本资料.ToDataTable(),
                                tt_成果项目 = 合并纵向横向成果项目(model).ToDataTable(),
                                tt_成果作者 = model.作者.ToDataTable()
                            },
                            CurrentUser.编号,
                            model.IsHold);

        [HttpPost]
        async public Task 完善获奖资料([FromBody]完成步骤<成果增改<成果获奖>> model) =>
             await MyWorkFlowBusiness.完成步骤(
                            model.ToSimple(), CurrentUser.编号,
                            new sp_成果获奖_增改
                            {
                                tt = model.附加数据.基本资料.ToDataTable(),
                                tt_成果项目 = 合并纵向横向成果项目(model.附加数据).ToDataTable(),
                                tt_成果作者 = model.附加数据.作者.ToDataTable()
                            }, model.附加数据.IsHold);

        [HttpPost]
        async public Task<object> 上传获奖相关文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/获奖/相关文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传获奖单位文件()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/获奖/获奖单位文件",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpPost]
        async public Task<object> 上传获奖批文()
        {
            var filesNameList = await MyLib.UploadFile.Upload(
                Request.Form.Files,
                Env.WebRootPath,
                "upload/成果/获奖/获奖批文",
                Config.GetValue<int>("uploadFileMaxSize"));
            return filesNameList;
        }

        [HttpGet]
        async public Task<object> 分页获取获奖(Paging paging, 获奖Filter filter) =>
           await Db.GetPagingListSpAsync<object, 获奖Filter>(
               paging,
               filter,
               $"tfn_成果获奖({CurrentUser.编号},{获奖管理流程模板编号})");

        [HttpGet]
        async public Task<object> 获取获奖详情(int 获奖编号)
        {
            //var r1 = await Db.GetListSpAsync<v1_成果获奖_详情, 获奖Filter>(new 获奖Filter() { 编号 = 获奖编号 });
            var r1 = await Db.GetModelByIdSpAsync<v1_成果获奖_详情>(获奖编号);
            var r2 = await Db.GetListSpAsync<object>($"tfn_成果项目({(int)成果类型.获奖},{获奖编号})");
            var r3 = await Db.GetListSpAsync<object>($"tfn_成果作者({(int)成果类型.获奖},{获奖编号})");
            var r4 = await MyWorkFlowBusiness.获取某流程的步骤(获奖管理流程模板编号, 获奖编号);
            return new { 获奖详情 = r1, 成果项目 = r2, 成果作者 = r3, 审核情况 = r4 };
        }

        #endregion

        [HttpGet]
        async public Task<PagingResult<v4_成果总览>> 分页获取成果总览(Paging paging, 成果总览Filter filter) =>
            await Db.GetPagingListSpAsync<v4_成果总览, 成果总览Filter>(paging, filter);
    }
}