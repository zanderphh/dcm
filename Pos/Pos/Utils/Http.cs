using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace Utils
{
    public static class Http
    {
        public static string Post(string url, string methodName, string jsonParas)
        {
            string strURL = url + "/" + methodName;

            //创建一个HTTP请求 
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strURL);
            //Post请求方式 
            request.Method = "POST";
            //内容类型
            request.ContentType = "application/x-www-form-urlencoded";
            //设置参数，并进行URL编码 
            string paraUrlCoded = System.Web.HttpUtility.UrlEncode("jsonStr");
            paraUrlCoded += "=" + System.Web.HttpUtility.UrlEncode(jsonParas);

            byte[] paraByte;
            //将Json字符串转化为字节 
            paraByte = System.Text.Encoding.UTF8.GetBytes(paraUrlCoded);
            //设置请求的ContentLength 
            request.ContentLength = paraByte.Length;
            //发送请求，获得请求流 

            Stream writer;
            try
            {
                writer = request.GetRequestStream();//获取用于写入请求数据的Stream对象
            }
            catch (Exception e)
            {
                writer = null;
                Console.Write("请求服务器失败!");
                return null;
            }
            //将请求参数写入流
            writer.Write(paraByte, 0, paraByte.Length);
            writer.Close();//关闭请求流

            string strValue = "";//strValue为http响应所返回的字符流
            HttpWebResponse response;
            try
            {
                //获得响应流
                response = (HttpWebResponse)request.GetResponse();
            }
            catch (WebException ex)
            {
                response = ex.Response as HttpWebResponse;
            }

            Stream s = response.GetResponseStream();

            StreamReader sr = new StreamReader(response.GetResponseStream());

            strValue = sr.ReadToEnd();
            sr.Close();

            return strValue;//返回数据
        }
        public static string Post(string methodName, string jsonParas)
        {
            return Post(HttpMethodInfo.CommonUrl,methodName,jsonParas);
        }
    }

    //包含HTTP请求方法的常量类
    public static class HttpMethodInfo
    {
        public static string CrmUrl = @"http://api.hme.cn/hpf-open-api/api/crm";
        public static string CommonUrl = @"http://api.hme.cn/hpf-open-api/api/common";

        /// <summary>
        /// 获取当前时间
        /// </summary>
        public static string GetCurrentTime = "get-current-time.api";
    }
}
