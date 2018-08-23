using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using ScientificResearch.Infrastucture;

namespace ScientificResearch.Models
{

    public class 成果增改<T>
    {
        public T 基本资料 { get; set; }
        //public IEnumerable<成果项目> 相关项目 { get; set; }
        public IEnumerable<int> 相关纵向项目编号 { get; set; }
        public IEnumerable<int> 相关横向项目编号 { get; set; }
        public IEnumerable<成果作者> 作者 { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; }
    }

    public class 论文Filter
    {
        //public int? 编号 { get; set; }
        /// <summary>
        /// 论文标题的模糊查询
        /// </summary>
        public string Like论文标题 { get; set; }

        public string Like第一作者 { get; set; }

        [IsDate(ErrorMessage = "论文正式出版开始日期指定错误")]
        public string Begin论文正式出版日期 { get; set; }

        [IsDate(ErrorMessage = "论文正式出版结束日期指定错误")]
        public string End论文正式出版日期 { get; set; }

        /// <summary>
        /// 后台根据不同的接口加这个条件
        /// </summary>
        public bool? Null认领人编号 { get; set; }
    }


    public class 著作Filter
    {
        //public int? 编号 { get; set; }
        public string Like著作名称 { get; set; }
        public string Like出版社名称 { get; set; }
        /// <summary>
        /// 著作出版日期的搜索条件中的开始日期
        /// </summary>
        [IsDate]
        public string Begin著作出版日期 { get; set; }
        [IsDate]
        public string End著作出版日期 { get; set; }
        public int? 年度 { get; set; }
        public string Like主编 { get; set; }
    }

    public class 专利Filter
    {
        //public int? 编号 { get; set; }
        public string Like专利名称 { get; set; }
        public string Like专利权人名称 { get; set; }
        public int? 年度 { get; set; }
        public string Like第一发明人 { get; set; }
    }

    public class 获奖Filter
    {
        //public int? 编号 { get; set; }
        public string Like获奖名称 { get; set; }
        public string Like第一完成人 { get; set; }
        public int? 年度 { get; set; }
        [IsDate]
        public string Begin获奖日期 { get; set; }
        //[IsDate]
        //public string End获奖日期 { get; set; }
        public DateTime? End获奖日期 { get; set; }
    }

    public class 成果总览Filter
    {
        public string Like成果名称 { get; set; }
        public int? 发起人编号 { get; set; }
        public string Like发起人姓名 { get; set; }
        public string 成果类型 { get; set; }
        public int? 年度 { get; set; }
    }

    public class 论文导入
    {
        #region 属性

        /// <summary>
        /// 论文标题
        /// </summary>
        [DisplayName("Title")]
        public string 论文标题 { get; set; }

        /// <summary>
		/// 作者 ;分割的多个作者,保留第一个作为第一作者,在系统里面找到唯一一个则解析为人员编号放到论文作者里面去;
		/// </summary>
        [DisplayName("Author")]
        public string 作者 { get; set; }

        public int 作者人数 { get; set; }

        /// <summary>
        /// 年度
        /// </summary>
        [DisplayName("Year")]
        public int? 年度 { get; set; }

        /// <summary>
        /// 关键字
        /// </summary>
        [DisplayName("Keywords")]
        public string 关键字 { get; set; }

        /// <summary>
		/// 论文摘要
		/// </summary>
		[DisplayName("Abstract")]
        public string 论文摘要 { get; set; }

        /// <summary>
        /// 卷号
        /// </summary>
        [DisplayName("Volume")]
        public int? 卷号 { get; set; }

        /// <summary>
		/// 期号
		/// </summary>
		[DisplayName("Issue")]
        public int? 期号 { get; set; }

        /// <summary>
        /// 页码范围
        /// </summary>
        [DisplayName("Pages")]
        public string 页码范围 { get; set; }

        /// <summary>
		/// 
		/// </summary>
        public int? 页码范围起 { get; set; }

        /// <summary>
		/// 
		/// </summary>
        public int? 页码范围止 { get; set; }

        /// <summary>
        /// 刊物名称,
        /// </summary>
        [DisplayName("Journal")]
        public string 刊物名称 { get; set; }

        #endregion
    }

    public class 论文自定义导入
    {
        #region 属性

        [DisplayName("论文标题(必填)")]
        public string 论文标题 { get; set; }
        [DisplayName("论文标题类型")]
        public string 论文标题类型 { get; set; }
        [DisplayName("论文Online日期")]
        public DateTime? 论文Online日期 { get; set; }
        [DisplayName("论文正式出版日期")]
        public DateTime? 论文正式出版日期 { get; set; }
        /// <summary>
		/// 作者 ;分割的多个作者,保留第一个作为第一作者,在系统里面找到唯一一个则解析为人员编号放到论文作者里面去;
		/// </summary>
        [DisplayName("第一作者")]
        public string 作者 { get; set; }
        [DisplayName("作者人数")]
        public int? 作者人数 { get; set; }
        [DisplayName("他引次数")]
        public int? 他引次数 { get; set; }
        [DisplayName("年度")]
        public int? 年度 { get; set; }
        [DisplayName("收稿日期")]
        public DateTime? 收稿日期 { get; set; }
        [DisplayName("论文所属栏目")]
        public string 论文所属栏目 { get; set; }
        [DisplayName("论文字数(万字)")]
        public float? 论文字数 { get; set; }
        [DisplayName("计划来源")]
        public string 计划来源 { get; set; }
        [DisplayName("论文版面")]
        public string 论文版面 { get; set; }
        [DisplayName("学科门类")]
        public string 学科门类 { get; set; }
        [DisplayName("一级学科")]
        public string 一级学科 { get; set; }
        [DisplayName("二级学科")]
        public string 二级学科 { get; set; }
        [DisplayName("三级学科")]
        public string 三级学科 { get; set; }
        [DisplayName("关键字")]
        public string 关键字 { get; set; }
        [DisplayName("论文摘要")]
        public string 论文摘要 { get; set; }
        [DisplayName("论文类型")]
        public string 论文类型 { get; set; }
        [DisplayName("卷号")]
        public int? 卷号 { get; set; }
        [DisplayName("期号")]
        public int? 期号 { get; set; }
        /// <summary>
        /// 页码范围
        /// </summary>
        [DisplayName("页码范围")]
        public string 页码范围 { get; set; }
        public int? 页码范围起 { get; set; }
        public int? 页码范围止 { get; set; }
        /// <summary>
        /// 刊物名称,
        /// </summary>
        [DisplayName("刊物名称")]
        public string 刊物名称 { get; set; }

        #endregion
    }

}
