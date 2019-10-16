using ScientificResearch.Infrastucture;
using MyLib;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Qiniu.Util;
using Qiniu.IO.Model;

namespace ScientificResearch.Models
{

    public class 继教某人可参与的活动Filter
    {
        /// <summary>
        /// 活动类型指"继教慕课, 继教理论考试, 继教操作考试, 继教签到, 继教慕课素材, 继教试题, 继教试卷, 继教评分表"
        /// </summary>
        //[Required(ErrorMessage = "请提供活动类型")]
        public string 活动类型 { get; set; }

        public int? 培训计划编号 { get; set; }

        public string Like培训计划名称 { get; set; }

        public int? 培训计划年份 { get; set; }

        public int? 项目分类编号 { get; set; }

        public string Like项目分类名称 { get; set; }

        public string Like名称 { get; set; }

        /// <summary>
        /// 对于一个某人可参与的活动来说,状态有:未开始,进行中,已结束,而没有"未发布"!
        /// 状态直接写死;
        /// </summary>
        public string 状态 { get; set; }
    }
}
