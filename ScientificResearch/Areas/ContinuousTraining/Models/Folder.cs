using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public enum 继教文件夹类型
    {
        继教慕课, 继教理论考试, 继教操作考试, 继教签到, 继教慕课素材, 继教试题, 继教试卷, 继教品分表
    }

    public class 继教文件夹Filter
    {
        [Required(ErrorMessage = "请输入继教文件夹类型")]
        public string 类型 { get; set; }
        public string Like名称 { get; set; }
    }

    public class 继教文件夹可使用人Filter
    {
        public string WhereIn文件夹编号 { get; set; }
    }

    public enum 继教文件夹可使用人类型
    {
        人员, 继教角色, 部门
    }
}
