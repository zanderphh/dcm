using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lib
{
    static class ExtendMethod
    {/// <summary>
     /// 8位字符串转换成日期
     /// </summary>
     /// <param name="dt"></param>
     /// <returns></returns>
        public static DateTime c8Date(this string dt)
        {
            return DateTime.ParseExact(dt, "yyyyMMdd", new CultureInfo("zh-CN"), DateTimeStyles.AllowWhiteSpaces);
        }
        public static string toStandDateString(this DateTime dt)
        {
            return dt.ToString("yyyy/MM/dd");
        }
        public static string toStandDateTimeString(this DateTime dt)
        {
            return dt.ToString("yyyy/MM/dd HH:mm:ss");
        }
    }
}
