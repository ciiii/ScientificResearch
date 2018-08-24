using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Infrastucture
{
    /// <summary>
    /// 目前这东西还没使用;
    /// 目前使用的是DateTime?这个类型(原本没有使用DateTIme是因为sqlwhere一个解析没有被修复)
    /// 这东西明显能做的事情更多
    /// </summary>
    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property, AllowMultiple = false, Inherited = true)]
    public class IsDateAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (value ==null) return true;
            return DateTime.TryParse(value.ToString(),out DateTime valueTemp);
        }

        //protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        //{
        //    if (string.Equals(value, AllowCountry))
        //        return ValidationResult.Success;
        //    else
        //        return new ValidationResult(string.Format("{0} 字段非法", validationContext.DisplayName), new[] { validationContext.MemberName });
        //}
    }
}
