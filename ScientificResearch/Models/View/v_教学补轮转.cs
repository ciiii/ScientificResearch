using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_教学补轮转[类]
    /// </summary>
    [Serializable]
	public partial class v_教学补轮转 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 教学轮转编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 学员编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 学员姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 计划入科日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 本院科室编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 本院科室名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 科室管理员编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 科室管理员姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 带教老师编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 带教老师姓名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 说明 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 开始日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 结束日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 建立人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        
          
        #endregion
	}
}