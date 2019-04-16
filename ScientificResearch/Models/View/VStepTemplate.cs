using System;
using System.Data;
using System.ComponentModel;

namespace ScientificResearch.Models
{
    /// <summary>
    /// VStepTemplate[类]
    /// </summary>
    [Serializable]
	public partial class VStepTemplate 
	{       
              
        #region 属性
        /// <summary>
		/// 
		/// </summary>
        public int Id { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public int FlowTemplateId { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string Name { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string ViewComponentName { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string EditComponentName { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string Style { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string Remark { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 可操作人 { get; set; }
        /// <summary>
		/// 
		/// </summary>
        public string 可用操作 { get; set; }
        
          
        #endregion
	}
}