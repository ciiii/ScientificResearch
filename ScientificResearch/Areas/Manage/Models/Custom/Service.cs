using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using ScientificResearch.Infrastucture;
using MyLib;

namespace ScientificResearch.Models
{
    public class 医院Filter
    {
        public string 名称 { get; set; }
    }

    public partial class 医院服务
    {
        async public static Task Merge(IDbConnection Db, int 医院编号, IEnumerable<医院服务> list)
        {
            await Db.ExecuteSpAsync(new sp_医院服务_增改()
            {
                医院编号 = 医院编号,
                tt = list.ToDataTable()
            });
        }
    }

    public class 医院服务Filter
    {
        public int? 医院编号 { get; set; }

        public string 医院名称 { get; set; }
    }

    [ModelMetadataType(typeof(医院MD))]
    public partial class 医院
    {    }

    public class 医院MD
    {
        [RegularExpression(@"^[\u4e00-\u9fa5_a-zA-Z]+$", ErrorMessage = "医院名称只能由中文以及英文字母构成")]
        public string 名称 { get; set; }

        [RegularExpression(@"^[a-zA-Z0-9]+$", ErrorMessage = "医院代码只能由英文字母以及数字构成")]
        public string 代码 { get; set; }
    }
}
