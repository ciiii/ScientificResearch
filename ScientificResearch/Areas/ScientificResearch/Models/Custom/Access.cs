﻿using System.ComponentModel.DataAnnotations;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 登录信息
    /// </summary>
    public class LoginInfo
    {
        /// <summary>
        /// 
        /// </summary>
        [Required(ErrorMessage = "工号不能为空")]
        public string 工号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        [Required(ErrorMessage = "密码不能为空")]
        public string 密码 { get; set; }

        /// <summary>
        /// 哪个db
        /// </summary>
        public string DbKey { get; set; }

        //public string IP { get; set; }

    }

    public class LoginInfoWithCode : LoginInfo
    {

        /// <summary>
        /// 微信获取openid的code
        /// </summary>
        public string Code { get; set; }

    }

    /// <summary>
    /// 获取登录者信息时用的筛选条件
    /// </summary>
    public class LoginInfoFilter
    {
        /// <summary>
        /// 
        /// </summary>
        public string 工号 { get; set; }
    }

    public class ChangePassword
    {
        public string 旧密码 { get; set; }
        public string 新密码 { get; set; }
    }

    //public class VM登录日志 : 登录日志
    //{
    //    public IPTools.Core.IpInfo 地域 { get; set; }
    //}

    /// <summary>
    /// 
    /// </summary>
    public class 登录日志Filter
    {
        public string 工号 { get; set; }
        public string Like姓名 { get; set; }
        public string Begin登录时间 { get; set; }
        public string End登录时间 { get; set; }
    }

    public class CurrentUserBase
    {
        public string DbKey { get; set; }
        //public string MyRole { get; set; }
    }

    /// <summary>
    /// 当前科研的登录人的信息
    /// </summary>
    public class CurrentUser: CurrentUserBase
    {
        public int 编号 { get; set; }
        public string 工号 { get; set; }
        public string 姓名 { get; set; }
        //public int Type { get; set; }
        //public string TypeName { get; set; }
        //属于哪个公司,key决定是哪个db链接
        public int 部门编号 { get; set; }
        public string 部门名称 { get; set; }
    }
}