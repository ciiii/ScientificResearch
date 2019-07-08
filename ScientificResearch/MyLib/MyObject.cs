using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;

namespace MyLib
{
    /// <summary>
    /// 
    /// </summary>
    public static class MyObject
    {

        /// <summary>
        /// 利用反射来判断对象是否包含某个属性
        /// 对dynamic类型的对象不适用
        /// </summary>
        /// <param name="obj">object</param>
        /// <param name="propertyName">需要判断的属性</param>
        /// <returns>是否包含</returns>
        public static bool ContainProperty(this object obj, string propertyName)
        {
            if (obj != null && !string.IsNullOrEmpty(propertyName))
            {
                PropertyInfo _findedPropertyInfo = obj.GetType().GetProperty(propertyName);
                return (_findedPropertyInfo != null);
            }
            return false;
        }

        /// <summary>
        /// 利用反射根据对象和属性名取对应属性的值,注意返回null和=null的object是不一样的;
        /// </summary>
        /// <param name="propertyName"></param>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static object GetValueByPropertyName(this object obj, string propertyName)
        {
            if (obj.ContainProperty(propertyName))
            {
                return obj.GetType().GetProperty(propertyName).GetValue(obj, null);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 利用反射根据对象和属性名为对应的属性赋值
        /// 注意,自定义类型的属性,非Nullable类型的泛型,不能用这个方法赋值;
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        /// <param name="fieldName"></param>
        /// <param name="value"></param>
        public static void SetValueByPropertyName(this object obj, string fieldName, object value)
        {
            if (obj.ContainProperty(fieldName))
            {
                var p = obj.GetType().GetProperty(fieldName);

                if (p.PropertyType.ToString().IndexOf("System.") > -1)
                {
                    try
                    {
                        if (!p.PropertyType.IsGenericType)
                        //非泛型
                        {
                            p.SetValue(obj, Convert.ChangeType(value, p.PropertyType), null);
                        }
                        else
                        //泛型,系统自带的泛型nullable<>,List<>等
                        {
                            //Nullable<>
                            if (p.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>))
                            {
                                //这里可以try catch一下
                                p.SetValue(obj, value == null ? null : Convert.ChangeType(value, Nullable.GetUnderlyingType(p.PropertyType)), null);
                            }
                            else
                            {
                                //非Nullable的泛型
                            }
                        }
                    }
                    catch (Exception e)
                    {
                        //这里可以忽略错误,主要是两个Convert.ChangeType可能引发的错误
                        Console.Write(e.Message);
                        //throw;
                    }
                }
                else
                {
                    //属性是自定义的类型;
                }


            }
            else
            {
                throw new Exception("给对象特定属性赋值错误:无此属性");
            }
        }

        #region 来自https://github.com/PandaCuipp/ObjectCompares/blob/master/ObjectCompare/ObjectHelper.cs
        /// <summary>
        /// 比较两个对象的属性值和字段值是否全部相等
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj1"></param>
        /// <param name="obj2"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool Compare<T>(T obj1, T obj2)
        {
            Type type = typeof(T);
            return CompareProperties(obj1, obj2, type) && CompareFields(obj1, obj2, type);
        }

        //public static bool Compare(object obj1, object obj2)
        //{
        //    //将对象序列化成内存中的二进制流  
        //    BinaryFormatter inputFormatter = new BinaryFormatter();
        //    MemoryStream inputStream;
        //    MemoryStream inputStream2;
        //    using (inputStream = new MemoryStream())
        //    {
        //        inputFormatter.Serialize(inputStream, obj1);
        //    }
        //    using (inputStream2 = new MemoryStream())
        //    {
        //        inputFormatter.Serialize(inputStream2, obj2);
        //    }
        //    string md5_1 = HashHelper.MD5Encrypt(inputStream.ToArray());
        //    string md5_2 = HashHelper.MD5Encrypt(inputStream2.ToArray());

        //    return (md5_1 == md5_2);
        //}

        /// <summary>
        /// 判断两个相同引用类型的对象的属性值是否相等
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj1">对象1</param>
        /// <param name="obj2">对象2</param>
        /// <param name="type">按type类型中的属性进行比较</param>
        /// <returns></returns>
        public static bool CompareProperties<T>(T obj1, T obj2, Type type)
        {
            //为空判断
            if (obj1 == null && obj2 == null)
                return true;
            else if (obj1 == null || obj2 == null)
                return false;

            Type t = type;

            PropertyInfo[] props = t.GetProperties();
            foreach (var po in props)
            {
                if (IsCanCompare(po.PropertyType))
                {
                    var propertyValueOfObj1 = po.GetValue(obj1);
                    var propertyValueOfObj2 = po.GetValue(obj2);

                    //为空判断
                    if (propertyValueOfObj1 == null && propertyValueOfObj2 == null) continue;
                    else if (propertyValueOfObj1 == null || propertyValueOfObj2 == null) return false;
                    //对比
                    else if (!propertyValueOfObj1.Equals(propertyValueOfObj2)) return false;
                }
                else
                {
                    return CompareProperties(po.GetValue(obj1), po.GetValue(obj2), po.PropertyType);
                }
            }

            return true;
        }

        /// <summary>
        /// 判断两个相同引用类型的对象的字段值是否相等
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj1">对象1</param>
        /// <param name="obj2">对象2</param>
        /// <param name="type">按type类型中的字段进行比较</param>
        /// <returns></returns>
        public static bool CompareFields<T>(T obj1, T obj2, Type type)
        {
            //为空判断
            if (obj1 == null && obj2 == null)
                return true;
            else if (obj1 == null || obj2 == null)
                return false;

            Type t = type;

            FieldInfo[] fields = t.GetFields();
            foreach (var fd in fields)
            {
                if (IsCanCompare(fd.FieldType))
                {
                    if (!fd.GetValue(obj1).Equals(fd.GetValue(obj2)))
                    {
                        return false;
                    }
                }
                else
                {
                    if (!CompareFields(fd.GetValue(obj1), fd.GetValue(obj2), fd.FieldType))
                    {
                        return false;
                    }
                }
            }

            return true;
        }

        /// <summary>
        /// 该类型是否可直接进行值的比较
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        private static bool IsCanCompare(Type t)
        {
            if (t.IsValueType)
            {
                return true;
            }
            else
            {
                //String是特殊的引用类型，它可以直接进行值的比较
                if (t.FullName == typeof(String).FullName)
                {
                    return true;
                }
                return false;
            }
        }
        #endregion

        /// <summary>
        /// 深拷贝,需要T有[Serializable]特性
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static T CreateDeepCopy<T>(T obj)
        {
            if (obj == null) return default(T);

            T t;
            MemoryStream memoryStream = new MemoryStream();
            BinaryFormatter formatter = new BinaryFormatter();
            formatter.Serialize(memoryStream, obj);
            memoryStream.Position = 0;
            t = (T)formatter.Deserialize(memoryStream);
            return t;
        }

        /// <summary>
        /// 没有T,仅做参考;
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        static object DeepCopyMine(object obj)
        {
            if (obj == null) return null;

            object newCopy;
            if (obj.GetType().IsArray)
            {
                var t = obj.GetType();
                var e = t.GetElementType();
                var r = t.GetArrayRank();
                Array a = (Array)obj;
                newCopy = Array.CreateInstance(e, a.Length);
                Array n = (Array)newCopy;
                for (int i = 0; i < a.Length; i++)
                {
                    n.SetValue(DeepCopyMine(a.GetValue(i)), i);
                }
                return newCopy;
            }
            else
            {
                newCopy = Activator.CreateInstance(obj.GetType(), true);
            }

            foreach (var field in newCopy.GetType().GetFields(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic))
            {
                if (!field.FieldType.IsPrimitive && field.FieldType != typeof(string))
                {
                    var fieldCopy = DeepCopyMine(field.GetValue(obj));
                    field.SetValue(newCopy, fieldCopy);
                }
                else
                {
                    field.SetValue(newCopy, field.GetValue(obj));
                }
            }
            return newCopy;
        }
    }
}
