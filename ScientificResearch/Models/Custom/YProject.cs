using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 纵向项目申报增改
    {
        public 纵向项目申报 基本资料 { get; set; }
        public IEnumerable<项目参与人> 参与人列表 { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; }
    }

    public class 纵向项目总览Filter
    {
        public int? 分类 { get; set; }
        public string Like项目中文名称 { get; set; }
        public string Like项目英文名称 { get; set; }
        public int? 发起人编号 { get; set; }
    }

    public class 纵向项目申报Filter
    {
        //public int? 编号 { get; set; }
        public int? 分类 { get; set; }
        public string 分类名称 { get; set; }
        public string Like申报人姓名 { get; set; }
        public string Like项目名称 { get; set; }
        public int? 申报年度 { get; set; }
        public string 项目级别 { get; set; }
        public DateTime? Begin申报时间 { get; set; }
        public DateTime? End申报时间 { get; set; }
        public bool? 是否立项 { get; set; }
        public int? 状态 { get; set; }

    }

    public class 纵向项目立项增改
    {
        public 纵向项目立项 基本资料 { get; set; }
        public IEnumerable<项目参与人> 参与人列表 { get; set; }
        public IEnumerable<项目计划> 计划列表 { get; set; }
        public IEnumerable<项目经费预算> 经费预算列表 { get; set; }
        public IEnumerable<项目预期成果> 预期成果列表 { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; }
    }

    public class 纵向项目立项Filter
    {
        //public int? 编号 { get; set; }
        /// <summary>
        /// 分类: 1-科研项目 2-重点学科 3-人才培养
        /// </summary>
        public int? 分类 { get; set; }
        public string Like项目中文名称 { get; set; }
        public string Like项目英文名称 { get; set; }
        public string 分类名称 { get; set; }
        public string 项目级别 { get; set; }
        public DateTime? Begin计划开始日期 { get; set; }
        public DateTime? End计划开始日期 { get; set; }
        public string Like负责人姓名 { get; set; }
        public int? 发起人编号 { get; set; }
        public int? 状态 { get; set; }

    }

    public class 发起纵向项目中检
    {
        public int 纵向项目立项编号 { get; set; }
        public int 立项登记人编号 { get; set; }
    }

    public class 纵向项目中检完善
    {
        public 纵向项目中检 基本资料 { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; }
    }

    public class 纵向项目中检Filter
    {
        public int? 编号 { get; set; }
        public int? 分类 { get; set; }
        public string Like项目中文名称 { get; set; }
        public string Like项目英文名称 { get; set; }
        public string 分类名称 { get; set; }
        public string 项目级别 { get; set; }
        public DateTime? Begin计划开始日期 { get; set; }
        public DateTime? End计划开始日期 { get; set; }
        public string Like负责人姓名 { get; set; }
        public int? 发起人编号 { get; set; }
        public int? 状态 { get; set; }

    }

    public class 纵向项目变更增改
    {
        public 纵向项目变更 基本资料 { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; }
    }

    /// <summary>
    /// 注意:变更搜索条件是针对"关联的立项项目当前的信息"来的,而不是"当时的变更内容"或"已变更过的旧的立项内容";
    /// </summary>
    public class 纵向项目变更Filter
    {
        public int? 编号 { get; set; }
        public int? 分类 { get; set; }
        public string Like项目中文名称 { get; set; }
        public string Like项目英文名称 { get; set; }

        public string Like负责人姓名 { get; set; }
        public string 分类名称 { get; set; }
        public DateTime? Begin变更时间 { get; set; }
        public DateTime? End变更时间 { get; set; }

        public string Like变更事由 { get; set; }
        public int? 发起人编号 { get; set; }

        public int? 状态 { get; set; }

    }

    public class 发起纵向项目结题
    {
        public int 纵向项目立项编号 { get; set; }
        public int 立项发起人编号 { get; set; }
        /// <summary>
        /// 没有就空着
        /// </summary>
        public IEnumerable<项目参与人> 参与人列表 { get; set; }
    }

    public class 纵向项目结题完善
    {
        public 纵向项目结题 基本资料 { get; set; }
        public IEnumerable<项目参与人> 参与人列表 { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; }
    }

    public class 纵向项目结题Filter
    {
        public int? 编号 { get; set; }
        public int? 分类 { get; set; }
        public string Like项目中文名称 { get; set; }
        public string Like项目英文名称 { get; set; }

        public string Like负责人姓名 { get; set; }
        public string 分类名称 { get; set; }
        public string 项目级别 { get; set; }
        public DateTime? Begin结题验收时间 { get; set; }
        public DateTime? End结题验收时间 { get; set; }

        public bool? 结题验收是否合格 { get; set; }
        public int? 发起人编号 { get; set; }

        public int? 状态 { get; set; }
    }
}
