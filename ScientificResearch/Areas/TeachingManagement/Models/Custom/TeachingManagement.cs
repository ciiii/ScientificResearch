using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Models
{
    [Serializable]
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
        public DateTime? Begin计划开始培训日期 { get; set; }
        public DateTime? End计划开始培训日期 { get; set; }
        public int? 专业编号 { get; set; }

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
        public DateTime? Begin入住日期 { get; set; }
        public DateTime? End入住日期 { get; set; }
        //Like学员类型名称，Like姓名，Like工号，专业编号
        public string Like学员类型名称 { get; set; }
        public string Like姓名 { get; set; }
        public string Like工号 { get; set; }
        public int? 专业编号 { get; set; }
    }

    public class 自动设置轮转
    {
        [Required(ErrorMessage = "请指定计划开始培训日期")]
        public DateTime? 计划开始培训日期 { get; set; }

        [Required(ErrorMessage = "请指定教学本院策略编号")]
        public int? 教学本院策略编号 { get; set; }

        /// <summary>
        /// 这些个学员应该是没有设置过轮转的学员;
        /// </summary>
        [Required(ErrorMessage = "请指定学员编号列表")]
        public List<int> 学员编号列表 { get; set; }
    }

    public class v_教学轮转Filter
    {
        public int? 编号 { get; set; }
        public int? 学员编号 { get; set; }
        public string WhereIn编号 { get; set; }
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
        public string Like科室管理员姓名 { get; set; }
        /// <summary>
        /// 未入科,在科,已出科
        /// </summary>
        public string 状态 { get; set; }
        public string NotEqual状态 { get; set; }

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
        public int? 学员编号 { get; set; }
        public string Like学员姓名 { get; set; }
    }


    public class v_tfn_教学考试成绩Filter : v_教学轮转Filter
    {
        public int? Begin理论考试成绩 { get; set; }
        public int? End理论考试成绩 { get; set; }
        public int? Begin技能考试成绩 { get; set; }
        public int? End技能考试成绩 { get; set; }
    }

    public class v_tfn_教学医疗差错及事故记录Filter : v_教学轮转Filter
    {
        public DateTime? Begin处理日期 { get; set; }
        public DateTime? End处理日期 { get; set; }
        public string 处理类别 { get; set; }
    }

    public class v_tfn_教学管床病人Filter:v_教学轮转Filter
    {

    }

    public class 学员入科
    {
        [Required]
        public int 教学轮转编号 { get; set; }
        [Required]
        public int 带教老师编号 { get; set; }
    }

    public class v_tfn_教学更换带教老师Filter : v_教学轮转Filter
    {
        public int? 原带教老师编号 { get; set; }
        public string Like原带教老师姓名 { get; set; }
        public int? 新带教老师编号 { get; set; }
        public string Like新带教老师姓名 { get; set; }
    }

    public class 教学考勤情况Filter
    {
        public int? 教学轮转编号 { get; set; }
    }

}
