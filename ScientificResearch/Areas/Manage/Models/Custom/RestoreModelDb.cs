using Microsoft.AspNetCore.Hosting;
using MyLib;
using ScientificResearch.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class RestoreModelDb
    {
        /// <summary>
        /// 获取根据模板数据库备份文件恢复一个新的库的脚本;
        /// </summary>
        /// <param name="dbName"></param>
        /// <param name="Env"></param>
        /// <returns></returns>
        public static string GetSql(string dbName, IHostingEnvironment Env)
        {
            //模板db名称
            var modeDbName = "ScientificResearch_Model";
            //存放模板bak文件的路径+文件名
            var pathFileNameOfBak = MyPath.Combine(Env.WebRootPath, @"\upload\Db_Model\db_model.bak");
            //恢复后新的数据库数据文件存放的路径,不包括文件名;
            //var dbFilePath = @"d:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA";
            var dbFilePath = @"C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA";
            return $@"restore database {dbName} 
                        from disk = '{pathFileNameOfBak}' 
                        with move '{modeDbName}' to '{dbFilePath}\{dbName}.mdf',
                        move '{modeDbName}_log' to '{dbFilePath}\{dbName}_log.ldf'";

        }

        /// <summary>
        /// 科研的根据登录模板html文件,以及数据库名,简写,生成一个独立的登录文件
        /// 如果还有别的系统,这个要再来一遍;
        /// </summary>
        /// <param name="dbName"></param>
        /// <param name="code"></param>
        /// <param name="Env"></param>
        async public static Task CopyLoginHtmlForScientificResearch(string dbName, string code,IHostingEnvironment Env)
        {
            //模板文件
            var sr = new StreamReader(MyPath.Combine(Env.WebRootPath, @"\upload\Db_Model\login_model.html"));
            sr.BaseStream.Seek(0, SeekOrigin.Begin);
            var modelCotent =await sr.ReadToEndAsync();
            var newCotent = modelCotent.Replace("{{dbKey}}", dbName);
            var sw = new StreamWriter(MyPath.Combine(Env.WebRootPath, $"login_{code}.html"));
            await sw.WriteLineAsync(newCotent);
            sr.Close();
            sw.Close();
        }
    }
}
