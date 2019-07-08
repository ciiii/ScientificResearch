using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    /// <summary>
    /// 这些个sp的结果的model,不在view里面写死,而是在vs里面写死;
    /// </summary>
    [Serializable]
    public partial class v_sp_分类统计轮转任务数量
    {
        public int? 轮转总数 { get; set; }
        public int? 规定技能类任务数量 { get; set; }
        public int? 规定疾病类任务数量 { get; set; }
        public int? 规定门诊类任务数量 { get; set; }
        public int? 规定病房类任务数量 { get; set; }
        public int? 规定医技类任务数量 { get; set; }
        public int? 已完成技能类任务数量 { get; set; }
        public int? 已完成疾病类任务数量 { get; set; }
        public int? 已完成门诊类任务数量 { get; set; }
        public int? 已完成病房类任务数量 { get; set; }
        public int? 已完成医技类任务数量 { get; set; }
    }

    /// <summary>
    /// v_sp_教学考勤统计[类]
    /// </summary>
    [Serializable]
    public partial class v_sp_教学考勤统计
    {
        public int 编号 { get; set; }
        public int 正常白班 { get; set; }
        public int 正常休假 { get; set; }
        public int 迟到 { get; set; }
        public int 早退 { get; set; }
        public int 脱岗 { get; set; }
        public int 旷工 { get; set; }
        public int 夜班 { get; set; }
        public int 请假 { get; set; }
    }

    public class v_sp_分类统计数量
    {
        public string 分类 { get; set; }
        public int 数量 { get; set; }
    }
}
