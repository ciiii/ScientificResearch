using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// v_继教角色权限[类]
    /// </summary>
    [Serializable]
	public partial class v_继教角色权限 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int? 编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 上级编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 深度 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 排序值 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 名称 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 组件名 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 是否菜单 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 图标 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 备注 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int? 角色编号 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public bool? 该角色是否拥有该权限 { get; set; }
        
          
        #endregion
	}
}