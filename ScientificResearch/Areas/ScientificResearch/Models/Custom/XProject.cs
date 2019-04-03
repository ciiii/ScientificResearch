using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 横向项目申请增改
    {
        public 横向项目 基本资料 { get; set; }
        public IEnumerable<项目参与人> 参与人列表 { get; set; }
        /// <summary>
        /// 对横向项目来说,配套经费不用管,=0就是了
        /// </summary>
        public IEnumerable<项目经费预算> 经费预算列表 { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; }
    }
    public class 横向项目Filter
    {
        public string Like合同编号 { get; set; }
        public string Like合同名称 { get; set; }
        public int? 发起人编号 { get; set; }
        public string Like负责人姓名 { get; set; }
        public int? 部门编号 { get; set; }
        public DateTime? Begin签订时间 { get; set; }
        public DateTime? End签订时间 { get; set; }
        public int? 状态 { get; set; }
    }

    public class 横向项目变更增改
    {
        public 横向项目变更 基本资料 { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; }
    }

    public class 横向项目变更Filter
    {
        public string Like合同编号 { get; set; }
        public string Like合同名称 { get; set; }
        public string Like变更事由 { get; set; }
        public string Like负责人姓名 { get; set; }
        public int? 部门编号 { get; set; }
        public DateTime? Begin变更时间 { get; set; }
        public DateTime? End变更时间 { get; set; }
        public int? 状态 { get; set; }
    }

    public class 横向项目结题增改
    {
        public int 横向项目申请编号 { get; set; }
        public int 申请发起人编号 { get; set; }
        public IEnumerable<项目参与人> 参与人列表 { get; set; }

    }

    public class 横向项目结题完善
    {
        public 横向项目结题 基本资料 { get; set; }
        public IEnumerable<项目参与人> 参与人列表 { get; set; }

        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; }
    }

    public class 横向项目结题Filter
    {
        public string Like合同编号 { get; set; }
        public string Like合同名称 { get; set; }
        public string Like负责人姓名 { get; set; }
        public int? 部门编号 { get; set; }
        public DateTime? Begin结题验收时间 { get; set; }
        public DateTime? End结题验收时间 { get; set; }
        public bool? 结题验收是否合格 { get; set; }
        public int? 状态 { get; set; }

    }
}

