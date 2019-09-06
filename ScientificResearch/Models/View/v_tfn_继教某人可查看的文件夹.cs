using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_tfn_继教某人可查看的文件夹[类]
    /// </summary>
    [Serializable]
	public partial class v_tfn_继教某人可查看的文件夹 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 父编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 完整路径名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 排序值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 层级 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 归属人类型 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int 归属人编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public DateTime 建立时间 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否归属自己 { get; set; }
        
          
        #endregion
	}
}