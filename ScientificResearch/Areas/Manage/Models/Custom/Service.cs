using Microsoft.AspNetCore.Mvc;
using ScientificResearch.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 医院服务Filter
    {
        public int? 医院编号 { get; set; }

        public string 医院名称 { get; set; }
    }

    [ModelMetadataType(typeof(医院MD))]
    public partial class 医院 { }

    public class 医院MD
    {
        [RegularExpression(@"^[\u4e00-\u9fa5_a-zA-Z]+$", ErrorMessage = "医院名称只能由中文以及英文字母构成")]
        public string 名称 { get; set; }

        [RegularExpression(@"^[a-zA-Z0-9]+$", ErrorMessage = "医院代码只能由英文字母以及数字构成")]
        public string 代码 { get; set; }
    }
}
