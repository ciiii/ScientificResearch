using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    public class 教学学员培训情况Filter
    {
        public string WhereIn编号 { get; set; }
        /// <summary>
        /// 有:未报到,退培,已报到,轮转计划已安排,在培,待结业,结业
        /// </summary>
        public string 状态 { get; set; }
        public string Like学员类型名称 { get; set; }
        public string Like工号 { get; set; }
        public string Like姓名 { get; set; }
        public string 民族 { get; set; }
        public string Like医师资格证书编号 { get; set; }
    }

    public class 教学学员报到Filter
    {
        public bool? 是否已报到 { get; set; }
        public string Like学员类型名称 { get; set; }
        public string Like工号 { get; set; }
        public string Like姓名 { get; set; }
        public string Begin报到时间 { get; set; }
        public string End报到时间 { get; set; }
    }

    public class 教学学员宿舍楼安排Filter
    {
        public bool? 是否已安排宿舍 { get; set; }
    }

    public class 自动设置轮转
    {
        [Required(ErrorMessage = "请指定计划开始培训日期")]
        public DateTime? 计划开始培训日期 { get; set; }

        [Required(ErrorMessage = "请指定教学本院策略编号")]
        public int? 教学本院策略编号 { get; set; }

        [Required(ErrorMessage = "请指定学员编号列表")]
        public List<int> 学员编号列表 { get; set; }
    }

    public class 教学轮转Filter
    {
        public int? 学员编号 { get; set; }
        public string WhereIn学员编号 { get; set; }
        public string Like学员姓名 { get; set; }
        public DateTime? Begin计划入科日期 { get; set; }
        public DateTime? End计划入科日期 { get; set; }
        public DateTime? Begin计划出科日期 { get; set; }
        public DateTime? End计划出科日期 { get; set; }
        public DateTime? Begin实际入科日期 { get; set; }
        public DateTime? End实际入科日期 { get; set; }
        public DateTime? Begin实际出科日期 { get; set; }
        public DateTime? End实际出科日期 { get; set; }
        public string Like教学本院策略名称 { get; set; }
        public int? 教学专业科室编号 { get; set; }
        public string Like教学专业科室名称 { get; set; }
        public int? 本院科室编号 { get; set; }
        public string Like本院科室名称 { get; set; }
        public int? 科室管理员编号 { get; set; }
        public string Like科室管理员名称 { get; set; }
        /// <summary>
        /// 未入科,在科,已出科
        /// </summary>
        public string 状态 { get; set; }
    }

    public class 按科室统计轮转的结果
    {
        public int 本院科室编号 { get; set; }
        public string 状态 { get; set; }
        public DateTime 日期 { get; set; }
        public int 人数 { get; set; }
    }

    public enum 教学学员培训状态
    {
        未报到, 退培, 已报到, 轮转计划已安排, 在培, 待结业, 结业
    }

    public enum 教学轮转状态
    {
        未入科, 在科, 已出科
    }

    public class 补轮转
    {
        public int 教学轮转编号 { get; set; }
        public int 补轮转天数 { get; set; }
        public string 说明 { get; set; }
    }

    public class v_教学补轮转Filter
    {
        public string Like学员姓名 { get; set; }
    }
}
