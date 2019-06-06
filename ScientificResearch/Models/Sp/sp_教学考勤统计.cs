using System;
using System.Data;

namespace ScientificResearch.Models
{
    /// <summary>
    /// sp_教学考勤统计[类]
    /// </summary>
    [Serializable]
	public class sp_教学考勤统计 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
		public DataTable 学员编号列表 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime 开始日期 { get; set; }
        /// <summary>
		/// 
		/// </summary>
		public DateTime 结束日期 { get; set; }
        
          
        #endregion
	}
}