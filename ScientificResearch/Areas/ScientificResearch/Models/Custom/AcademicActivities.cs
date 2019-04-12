using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;


namespace ScientificResearch.Models
{
    public class 主办讲座申请增改
    {
        public 主办讲座 基本资料 { get; set; }
        public IEnumerable<项目经费预算> 经费预算列表 { get; set; }
        public bool IsHold { get; set; } = false;

    }

    public class 主办讲座Filter
    {
        public int? 编号 { get; set; }
        public int? 主办人编号 { get; set; }
        public string Like主办人姓名 { get; set; }
        public string Like活动名称 { get; set; }
        public bool? 是否反馈过 { get; set; }
    }

    public class 讲座反馈Filter
    {
        public int? 编号 { get; set; }
        //[Required(ErrorMessage = "讲座编号必填")]
        public string Like活动名称 { get; set; }
        public string Like主办人姓名 { get; set; }
        public string Like专家姓名 { get; set; }
        public int? 讲座编号 { get; set; }
    }

    public class 参加会议申请增改
    {
        public 参加会议 基本资料 { get; set; }
        /// <summary>
        /// 对参加会议来说,批准经费和配套经费不用管,=0就是了,当然要用也无所谓;
        /// </summary>
        public IEnumerable<项目经费预算> 经费预算列表 { get; set; }
        /// <summary>
        /// 需要暂存=true,不暂存=false
        /// </summary>
        public bool IsHold { get; set; } = false;
    }

    public class 参加会议Filter
    {
        public int? 编号 { get; set; }
        public int? 申请人编号 { get; set; }
        public string Like申请人姓名 { get; set; }
        public string Like会议名称 { get; set; }
        public bool? 是否反馈过 { get; set; }
    }

    public class 参加会议反馈Filter
    {
        public int? 编号 { get; set; }
        //[Required(ErrorMessage ="参加会议编号必填")]
        public int? 参加会议编号 { get; set; }
        public string Like申请人姓名 { get; set; }
        public string Like会议名称 { get; set; }
    }
}
