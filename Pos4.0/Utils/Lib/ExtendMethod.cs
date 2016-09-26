using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lib
{
    public static class ExtendMethod
    {/// <summary>
     /// 8位字符串转换成日期
     /// </summary>
     /// <param name="dt"></param>
     /// <returns></returns>
        public static DateTime ToDate(this string dt)
        {
            return DateTime.ParseExact(dt, "yyyyMMdd", new CultureInfo("zh-CN"), DateTimeStyles.AllowWhiteSpaces);
        }
        public static DateTime ToDateTime(this string dt)
        {
            return DateTime.ParseExact(dt, "yyyyMMddHHmmss", new CultureInfo("zh-CN"), DateTimeStyles.AllowWhiteSpaces);
        }

        public static string ToDateString(this string dt)
        {
            return DateTime.ParseExact(dt, "yyyyMMdd", new CultureInfo("zh-CN"), DateTimeStyles.AllowWhiteSpaces).ToDateString();
        }
        public static string ToDateTimeString(this string dt)
        {
            return DateTime.ParseExact(dt, "yyyyMMddHHmmss", new CultureInfo("zh-CN"), DateTimeStyles.AllowWhiteSpaces).ToDateTimeString();
        }
        public static string ToDateString(this DateTime dt)
        {
            return dt.ToString("yyyy/MM/dd");
        }
        public static string ToDateTimeString(this DateTime dt)
        {
            return dt.ToString("yyyy/MM/dd HH:mm:ss");
        }
        /// <summary>
        /// 获取字符串长度，中文占两位
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static int GetByte(this string str)
        {
            return Encoding.Default.GetBytes(str).Length;
        }
    }
}
