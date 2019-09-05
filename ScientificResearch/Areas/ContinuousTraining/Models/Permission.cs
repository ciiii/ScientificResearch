using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public enum 继教角色enum
    {
        系统管理员 = 1, 医院管理员 = 2, 科室管理员 = 3, 助教老师 = 4
    }

    public class 继教角色人员Filter
    {
        public int? 角色编号 { get; set; }
        /// <summary>
        /// 人员编号
        /// </summary>
        public int? 编号 { get; set; }

        [Required(ErrorMessage = "请输入该人员是否属于该角色的搜索条件")]
        public bool 该人员是否属于该角色 { get; set; }
    }

    public class 继教角色权限Filter
    {
        [Required(ErrorMessage = "请输入角色编号")]
        public int 角色编号 { get; set; }
    }

    public class 继教微信角色权限Filter
    {
        [Required(ErrorMessage = "请输入角色编号")]
        public int 角色编号 { get; set; }
    }

    public class 继教人员权限Filter
    {
        [Required(ErrorMessage = "请输入人员编号")]
        public int 人员编号 { get; set; }
    }

    public class 继教微信端人员权限Filter
    {
        [Required(ErrorMessage = "请输入人员编号")]
        public int 人员编号 { get; set; }
    }
}
