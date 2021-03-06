﻿using Dapper;
using MyLib;
using ScientificResearch.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using static Dapper.SqlMapper;

namespace ScientificResearch.Infrastucture
{
    /// <summary>
    /// 预定义的主键,就是这个主键名称是固定的而已
    /// 对应tt_编号这个tt
    /// </summary>
    public class PredefindedKeyFields
    {
        /// <summary>
        /// 
        /// </summary>
        public int 编号 { get; set; }
    }

    /// <summary>
    /// 一个Id+一个T的列表的结构,很多sp用,对接口来说,就不需要自定义post的传入类了;
    /// 当然要转换为sp类还是手动来的好;
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class PredefindedIdList<T>
    {
        public int Id { get; set; }
        public IEnumerable<T> List { get; set; }
    }

    /// <summary>
    /// 类似上面那个
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <typeparam name="TList"></typeparam>
    public class PredefindedModelList<T, TList>
    {
        public T Model { get; set; }
        public IEnumerable<TList> List { get; set; }
    }

    public class Predefinded2Models<T1, T2>
    {
        public T1 FirstModel { get; set; }
        public T2 SecondModel { get; set; }
    }

    /// <summary>
    /// 用一个Name+一个Object表示一个可执行的SP的数据;
    /// </summary>
    public class PredefindedSPStructure
    {
        /// <summary>
        /// SP的名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 参数
        /// </summary>
        public object Parameter { get; set; }
    }

    /// <summary>
    /// GetModelById
    /// 一些预定义的sp的dapper调用
    /// </summary>
    public static class PredefinedSpExtention
    {
        /// <summary>
        /// IList PredefindedSPStructure的AddItem挂载方法;
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        /// <param name="item"></param>
        /// <returns></returns>
        public static IList<PredefindedSPStructure> AddItem<T>(this IList<PredefindedSPStructure> list, T item)
        {
            list.Add(new PredefindedSPStructure() { Name = typeof(T).Name, Parameter = item });
            return list;
        }

        /// <summary>
        /// 预定义的主键,非要叫"编号"而不叫"Id"我有啥法
        /// </summary>
        private const string PredefindedKeyFields = "编号";

        private static string PrdefindeSpMergeName<T>() { return $"SP_{typeof(T).Name}_增改"; }
        private static string PrdefindeSpDeleteName<T>() { return $"SP_{typeof(T).Name}_删"; }
        private static string PrdefindeSpEnableName<T>() { return $"SP_{typeof(T).Name}_启禁"; }

        /// <summary>
        /// 把IEnumerable int类型的编号列表,转为PredefindedKeyFieldsList列表,后者可以转为一个dataTable,是只有一个字段 编号 的表
        /// </summary>
        /// <param name="idList"></param>
        /// <returns></returns>
        public static IEnumerable<PredefindedKeyFields> ToPredefindedKeyFieldsList(this IEnumerable<int> idList)
        {
            return idList.Select(i => new PredefindedKeyFields()
            {
                编号 = i
            });
        }

        /// <summary>
        /// 根据idlist得到一个用逗号分隔的字符串,count=0则返回"0",其中每一项都是数字;
        /// </summary>
        /// <param name="idList"></param>
        /// <param name="Spacer"></param>
        /// <returns></returns>
        public static string ToStringIdWithSpacer(this IEnumerable<int> idList, string Spacer = ",")
        {
            return idList.Count() == 0 ? "0" : string.Join(Spacer, idList);
        }

        #region 画蛇添足的
        ////private const string PredefinedNameOfTvpParameterInMergeSp = "tt";  //这个使用失败,动态的object的属性名称
        ///// <summary>
        ///// 这3个方法在codesmith映射sp的结构以后,就多余了
        ///// </summary>
        ///// <typeparam name="T"></typeparam>
        ///// <returns></returns>
        ////public static string GetMergeSpNameByClassName<T>() => $"sp_{typeof(T).Name}_增改";

        ///// <summary>
        ///// 单表增改的参数;也算预定义的了;
        ///// 这3个方法在codesmith映射sp的结构以后,就多余了
        ///// </summary>
        ///// <typeparam name="T"></typeparam>
        ///// <param name="model"></param>
        ///// <returns></returns>
        ////public static object GetMergeSpParamByModel<T>(T model) where T : new()
        ////{
        ////    return new { tt = model.ToDataTable() };
        ////}

        ///// <summary>
        ///// 这3个方法在codesmith映射sp的结构以后
        ///// </summary>
        ///// <typeparam name="T"></typeparam>
        ///// <param name="list"></param>
        ///// <returns></returns>
        ////public static object GetMergeSpParamByModel<T>(IEnumerable<T> list) where T : new()
        ////{
        ////    return new { tt = list.ToDataTable() };
        ////}

        ///// <summary>
        ///// 
        ///// </summary>
        ///// <typeparam name="T"></typeparam>
        ///// <returns></returns>
        ////public static string GetDeleteSpNameByClassName<T>() => $"sp_{typeof(T).Name}_删";
        ///// <summary>
        /////  画蛇添足
        ///// </summary>
        ///// <typeparam name="T"></typeparam>
        ///// <returns></returns>
        ////public static string GetEnableDisableSpNameByClassName<T>() => $"sp_{typeof(T).Name}_启禁";
        #endregion

        /// <summary>
        /// 通过主键获得对象,或者null
        /// T为表映射而来的类
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        async public static Task<T> GetModelByIdSpAsync<T>(this IDbConnection cnn, int id, string keyFields = PredefindedKeyFields, IDbTransaction transaction = null,string tableName = null)
        {
            var result = await cnn.QuerySpAsync<sp_GetList, T>(new sp_GetList()
            {
                tbName = tableName??typeof(T).Name,
                strWhere = $"{keyFields}={id}",
                keyFields = PredefindedKeyFields,
                OrderStr = "",
                tbFields = "*"
            }, transaction);
            return result.FirstOrDefault();
        }

        /// <summary>
        /// sp_GetList,带搜索条件的
        /// T的作用有2:1默认用T的名称做TbName,2dapper返回类型的指定
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="TFilter"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="filter"></param>
        /// <param name="tbName"></param>
        /// <param name="keyFields"></param>
        /// <param name="orderType"></param>
        /// <param name="orderStr"></param>
        /// <param name="tbFields"></param>
        /// <returns></returns>
        async public static Task<IEnumerable<T>> GetListSpAsync<T, TFilter>(
            this IDbConnection cnn,
            TFilter filter = null,
            string tbName = null,
            string keyFields = PredefindedKeyFields,
            bool orderType = false,
            string orderStr = "",
            string tbFields = "*",
            IDbTransaction transaction = null) where TFilter : class
        {
            return await cnn.QuerySpAsync<sp_GetList, T>(new sp_GetList()
            {
                tbName = tbName ?? typeof(T).Name,
                strWhere = filter == null ? "" : SqlWhereMapper.toWhere<TFilter>(filter),
                keyFields = keyFields ?? PredefindedKeyFields,
                OrderType = orderType,
                OrderStr = orderStr,
                tbFields = tbFields
            }, transaction);
        }

        /// <summary>
        /// 没有搜索条件的单独传参数
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="tbName"></param>
        /// <param name="keyFields"></param>
        /// <param name="orderType"></param>
        /// <param name="orderStr"></param>
        /// <returns></returns>
        async public static Task<IEnumerable<T>> GetListSpAsync<T>(
            this IDbConnection cnn,
            string tbName = null,
            string keyFields = null,
            bool orderType = false,
            string orderStr = "", IDbTransaction transaction = null)
        {
            return await cnn.GetListSpAsync<T, object>(null, tbName, keyFields, orderType, orderStr, transaction: transaction);
        }

        /// <summary>
        /// 有条件的分页获取
        /// T的作用有2:1默认用T的名称做TbName,2dapper返回类型的指定
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="TFilter"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="paging"></param>
        /// <param name="filter"></param>
        /// <param name="tbName"></param>
        /// <param name="keyFields"></param>
        /// <param name="orderStr"></param>
        /// <param name="orderType"></param>
        /// <returns></returns>
        async public static Task<PagingResult<T>> GetPagingListSpAsync<T, TFilter>(
            this IDbConnection cnn,
            Paging paging = null,
            TFilter filter = null,
            string tbName = null,
            string keyFields = null,
            string orderStr = "",
            bool orderType = true, IDbTransaction transaction = null) where TFilter : class
        {
            if (paging == null) paging = new Paging();
            var result = await cnn.QueryMultipleSpAsync(new sp_GetPagingList
            {
                tbName = tbName ?? typeof(T).Name,
                strWhere = filter == null ? "" : SqlWhereMapper.toWhere<TFilter>(filter),
                keyFields = keyFields ?? PredefindedKeyFields,
                PageSize = paging.Size,
                PageIndex = paging.Index,
                OrderType = paging.OrderType,
                OrderStr = orderStr,
                tbFields = "*"
            }, transaction);
            var total = result.Read<int>().FirstOrDefault();
            var list = result.Read<T>();
            return new PagingResult<T> { total = total, list = list };
        }

        /// <summary>
        /// 没有搜索条件的,返回分页数据
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="paging"></param>
        /// <param name="tbName"></param>
        /// <param name="keyFields"></param>
        /// <param name="orderStr"></param>
        /// <returns></returns>
        async public static Task<PagingResult<T>> GetPagingListSpAsync<T>(
            this IDbConnection cnn,
            Paging paging = null,
            string tbName = null,
            string keyFields = null,
            string orderStr = "", bool orderType = true, IDbTransaction transaction = null)
        {
            return await cnn.GetPagingListSpAsync<T, object>(paging, null, tbName, keyFields, orderStr, orderType, transaction);
        }

        /// <summary>
        /// 异步执行一个sp
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="model">sp映射而来的类对象,不能为null...</param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static Task<int> ExecuteSpAsync<T>(this IDbConnection cnn, T model, IDbTransaction transaction = null)
        {
            return cnn.ExecuteAsync(typeof(T).Name, model, transaction, commandType: CommandType.StoredProcedure);
        }

        /// <summary>
        /// 执行一个sp,返回指定类型的list,sp如果没有参数,则不输入model
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="TOut"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="model"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async public static Task<IEnumerable<TOut>> QuerySpAsync<T, TOut>(
            this IDbConnection cnn,
            T model = null,
            IDbTransaction transaction = null) where T : class
        {
            //return await cnn.QueryAsync(typeof(TOut), typeof(T).Name, model, transaction, commandType: CommandType.StoredProcedure);
            return await cnn.QueryAsync<TOut>(typeof(T).Name, model, transaction, commandType: CommandType.StoredProcedure);
        }

        /// <summary>
        /// 执行一个sp,返回指定类型的第一个数据,sp如果没有参数,则不输入model
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="TOut"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="model"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static Task<TOut> QueryFirstSpAsync<T, TOut>(
            this IDbConnection cnn,
            T model = null,
            IDbTransaction transaction = null) where T : class
        {
            return cnn.QueryFirstAsync<TOut>(typeof(T).Name, model, transaction, commandType: CommandType.StoredProcedure);
        }

        /// <summary>
        /// 执行一个sp,返回多个list,需要自己再去解析,
        /// sp如果没有参数,则不输入model
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="model"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        public static Task<GridReader> QueryMultipleSpAsync<T>(
            this IDbConnection cnn,
            T model = null,
            IDbTransaction transaction = null) where T : class
        {
            return cnn.QueryMultipleAsync(typeof(T).Name, model, transaction, commandType: CommandType.StoredProcedure);
        }

        /// <summary>
        /// 按约定SP_xxx_增改的命名执行一个merge
        /// 注意其中的参数名也是约定
        /// 注意他返回的是同类型T,而不是编号的int
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="model"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async public static Task<T> Merge<T>(this IDbConnection cnn, T model, IDbTransaction transaction = null) where T : new()
        {
            return await cnn.QueryFirstAsync<T>(PrdefindeSpMergeName<T>(), new
            {
                tt = model.ToDataTable()
            }, transaction, commandType: CommandType.StoredProcedure);

            //return result.SingleOrDefault();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="model"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async public static Task<IEnumerable<T>> Merge<T>(
            this IDbConnection cnn,
            IEnumerable<T> model,
            IDbTransaction transaction = null) where T : new()
        {
            var result = await cnn.QueryAsync<T>(PrdefindeSpMergeName<T>(), new
            {
                tt = model.ToDataTable()
            }, transaction, commandType: CommandType.StoredProcedure);

            return result;
        }

        /// <summary>
        /// 对子表,且有merge时Not matched by source的时候删除的要求时,用这种;
        /// fid这个参数名字是约定的;
        /// 注意:tt里面必然有fid,在调用这个方法之前就要自己把它设置了;保证数据正确;
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="fId"></param>
        /// <param name="model"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async public static Task<IEnumerable<T>> Merge<T>(this IDbConnection cnn, int fId, IEnumerable<T> model, IDbTransaction transaction = null) where T : new()
        {
            var result = await cnn.QueryAsync<T>(PrdefindeSpMergeName<T>(), new
            {
                fId,
                tt = model.ToDataTable()
            }, transaction, commandType: CommandType.StoredProcedure);

            return result;
        }

        async public static Task<T> Merge<T>(this IDbConnection cnn, int fId, T model, IDbTransaction transaction = null) where T : new()
        {
            var result = await cnn.QueryFirstAsync<T>(PrdefindeSpMergeName<T>(), new
            {
                fId,
                tt = model.ToDataTable()
            }, transaction, commandType: CommandType.StoredProcedure);

            return result;
        }

        /// <summary>
        /// 按约定SP_xxx_删的命名执行一个delete
        /// 注意其中的参数名也是约定
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="list"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        async public static Task Delete<T>(this IDbConnection cnn, IEnumerable<int> list, IDbTransaction transaction = null) where T : new()
        {
            var result = await cnn.QueryAsync<T>(PrdefindeSpDeleteName<T>(), new
            {
                tt_编号 = list.ToPredefindedKeyFieldsList().ToDataTable()
            }, transaction, commandType: CommandType.StoredProcedure);
        }

        /// <summary>
        /// 按约定SP_xxx_启禁的命名执行一个enable
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="id"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        [Obsolete(message: "请使用批量的启禁方法和生成脚本")]
        async public static Task Enable<T>(this IDbConnection cnn, int id, IDbTransaction transaction = null) where T : new()
        {
            var result = await cnn.QueryAsync<T>(PrdefindeSpEnableName<T>(), new
            {
                编号 = id,
                是否启用 = true
            }, transaction, commandType: CommandType.StoredProcedure);
        }

        async public static Task Enable<T>(this IDbConnection cnn, IEnumerable<int> idList, IDbTransaction transaction = null) where T : new()
        {
            await cnn.ExecuteAsync(PrdefindeSpEnableName<T>(), new
            {
                tt_编号 = idList.ToPredefindedKeyFieldsList().ToDataTable(),
                是否启用 = true
            }, transaction, commandType: CommandType.StoredProcedure);
        }

        /// <summary>
        /// 按约定SP_xxx_启禁的命名执行一个disable
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="id"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        [Obsolete(message: "请使用批量的启禁方法和生成脚本")]
        async public static Task Disable<T>(this IDbConnection cnn, int id, IDbTransaction transaction = null) where T : new()
        {
            var result = await cnn.QueryAsync<T>(PrdefindeSpEnableName<T>(), new
            {
                编号 = id,
                是否启用 = false
            }, transaction, commandType: CommandType.StoredProcedure);
        }

        async public static Task Disable<T>(this IDbConnection cnn, IEnumerable<int> idList, IDbTransaction transaction = null) where T : new()
        {
            await cnn.ExecuteAsync(PrdefindeSpEnableName<T>(), new
            {
                tt_编号 = idList.ToPredefindedKeyFieldsList().ToDataTable(),
                是否启用 = false
            }, transaction, commandType: CommandType.StoredProcedure);
        }
        #region 根据sp中对删除和启禁用的命名约定,调用相应的sp的方法,已废弃,直接用上面的几个"dapper原生的操作sp的方法"+"映射而来的sp类"结合而得到的调用sp的方法
        ///// <summary>
        ///// 增改一个表.单个对象.其中sp名称和tt的名称是按约定从表名构成的;
        ///// 2018-5-10 将增改的sp里面生成的参数名都改为tt,并不需要变化对吧!
        ///// 2018-5-16 修改为可以返回插入后值的queryasync方法,sp里面也要做这个约定
        ///// </summary>
        ///// <typeparam name="T"></typeparam>
        ///// <param name="cnn"></param>
        ///// <param name="model"></param>
        ///// <param name="transaction"></param>
        ///// <returns></returns>
        //async public static Task<int> MergeSpAsync<T>(this IDbConnection cnn, T model, IDbTransaction transaction = null) where T : new()
        //{
        //    //给obj动态添加动态属性
        //    //dynamic obj = new System.Dynamic.ExpandoObject();
        //    //((IDictionary<string, object>)obj).Add(ttName, model.ToDataTable());
        //    //await cnn.MyExecuteSpAsync(spName, (object)obj);
        //    var result = await cnn.QueryAsync<int>(
        //        GetMergeSpNameByClassName<T>(),
        //        GetMergeSpParamByModel<T>(model),
        //        transaction,
        //        commandType: CommandType.StoredProcedure);
        //    return result.FirstOrDefault();
        //}



        ///// <summary>
        ///// 上面的姊妹,增改多条记录.
        ///// 2018-5-16 修改为可以返回插入后值的queryasync方法
        ///// </summary>
        ///// <typeparam name="T"></typeparam>
        ///// <param name="cnn"></param>
        ///// <param name="list"></param>
        ///// <param name="transaction"></param>
        ///// <returns></returns>
        //async public static Task<IEnumerable<int>> MergeSpAsync<T>(
        //    this IDbConnection cnn,
        //    IEnumerable<T> list,
        //    IDbTransaction transaction = null) where T : new()
        //{
        //    return await cnn.QueryAsync<int>(
        //        GetMergeSpNameByClassName<T>(),
        //        GetMergeSpParamByModel<T>(list),
        //        transaction,
        //        commandType: CommandType.StoredProcedure);
        //}

        /// <summary>
        /// 删除sp的:sp的名称和T(表名)的对应关系,sp参数名称,编号列表这个tt的名称和类型,这些都需要有约定
        /// 比上面好一点的地方是"tt_编号"这个sp的参数名是可以固定下来的;
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="idList"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        //async public static Task DeleteSpAsync<T>(
        //    this IDbConnection cnn,
        //    IEnumerable<int> idList,
        //    IDbTransaction transaction = null) where T : new()
        //{
        //    await cnn.ExecuteAsync(
        //        GetDeleteSpNameByClassName<T>(),
        //        new
        //        {
        //            tt_编号 = idList.Select(i => new 编号列表()
        //            {
        //                编号 = i
        //            }).ToDataTable()
        //        },
        //        transaction,
        //        commandType: CommandType.StoredProcedure);
        //}

        /// <summary>
        /// 启禁某个表的某条记录,对应的sp名有特定约定;
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cnn"></param>
        /// <param name="id"></param>
        /// <param name="state"></param>
        /// <param name="transaction"></param>
        /// <returns></returns>
        //async public static Task EnableDisableSpAsync<T>(
        //    this IDbConnection cnn,
        //    int id,
        //    bool state,
        //    IDbTransaction transaction = null) where T : new()
        //{
        //    await cnn.ExecuteAsync(
        //        GetEnableDisableSpNameByClassName<T>(),
        //        new { 编号 = id, 是否启用 = state },
        //        transaction,
        //        commandType: CommandType.StoredProcedure);
        //}
        #endregion

        ///
        async public static Task<TOut> ExecuteTransaction<TOut>(string dbConnectionString, Func<SqlConnection, SqlTransaction, Task<TOut>> myTran)
        {
            using (var dbForTransaction = new SqlConnection(dbConnectionString))
            {
                dbForTransaction.Open();
                using (var transaction = dbForTransaction.BeginTransaction())
                {
                    try
                    {

                        var result = await myTran(dbForTransaction, transaction);

                        transaction.Commit();

                        return result;
                    }
                    catch (Exception e)
                    {
                        transaction.Rollback();
                        throw e;
                    }
                }
            }
        }

        //不需要返回的,要用直接抄
        //async Task myTran(SqlConnection dbForTransaction, SqlTransaction transaction)
        //{
        //    await 继教操作考试.增改继教操作考试(data, dbForTransaction, transaction);
        //}

        //await PredefinedSpExtention.ExecuteTransaction(DbConnectionString, myTran);
        async public static Task ExecuteTransaction(string dbConnectionString, Func<SqlConnection, SqlTransaction, Task> myTran)
        {
            using (var dbForTransaction = new SqlConnection(dbConnectionString))
            {
                dbForTransaction.Open();
                using (var transaction = dbForTransaction.BeginTransaction())
                {
                    try
                    {

                        await myTran(dbForTransaction, transaction);

                        transaction.Commit();

                    }
                    catch (Exception e)
                    {
                        transaction.Rollback();
                        throw e;
                    }
                }
            }
        }
    }
}
