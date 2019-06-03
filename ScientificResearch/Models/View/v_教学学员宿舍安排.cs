using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学学员宿舍安排[类]
    /// </summary>
    [Serializable]
	public partial class v_教学学员宿舍安排 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 学员类型编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 学员类型名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 工号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 头像路径 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 性别 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 学员培训年界 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 学员培训年限 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 往届应届 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 专业编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 专业名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 送培方式 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否已安排宿舍 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 宿舍楼编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 宿舍楼名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 门禁卡卡号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 门牌号及床号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 职位 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 水起数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 电起数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 气起数 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public decimal? 滞纳金比例 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 入住日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 退出日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 退出原因 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 宿舍安排说明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime? 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}