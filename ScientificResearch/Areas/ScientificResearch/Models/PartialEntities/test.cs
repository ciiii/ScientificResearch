using Microsoft.AspNetCore.Mvc;
using System;
using System.ComponentModel.DataAnnotations;
using System.Collections;
using System.Collections.Generic;

namespace ScientificResearch.Models
{
    [ModelMetadataType(typeof(RedPackMD))]
    public partial class Test { }

    public class RedPackMD
    {
        [MaxLength(length: 100, ErrorMessage = "描述长度不能超过100")]
        public string Describe { get; set; }

        [MaxLength(length: 50, ErrorMessage = "口令长度不能超过50")]
        public string Word { get; set; }
    }

    public class 系统角色组编号
    {
        public int 系统管理员 { get; set; }
        public int 专家 { get; set; }
        public int 科研人员 { get; set; }
        public int 部门管理员 { get; set; }
        public int 科研管理员 { get; set; }
        public int 财务部会计 { get; set; }
        public IDictionary<string,int> 多个数据 { get; set; }
    }
}
