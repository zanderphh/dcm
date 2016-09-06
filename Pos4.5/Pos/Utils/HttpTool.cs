using Pos;
using Pos.BL;
using Pos.BL.Http;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace Utils
{
     public static class HttpTool
    {
        public static string Post(string url, string methodName, string jsonKey, string jsonParas)
        {
            return Post(url + "/" + methodName, jsonKey, jsonParas);
        }
        public static string PostDefault(string methodName, string jsonParas)
        {
            return Post(HttpMethodInfo.DefaultUrl, methodName, HttpMethodInfo.JsonKey, jsonParas);
        }
        public static string PostUrl(string url, string param)
        {
            return Post(url, string.Empty, param);
        }

        public static string Post(string url, string paraKey, string paraValue)
        {
            string strURL = url;
            App.Log(strURL + "?" + paraKey + "=" + paraValue);
            //创建一个HTTP请求 
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strURL);
            //Post请求方式 
            request.Method = "POST";
            //内容类型
            request.ContentType = "application/x-www-form-urlencoded";
            //设置参数，并进行URL编码 
            string paraUrlCoded = System.Web.HttpUtility.UrlEncode(paraKey);
            if (paraUrlCoded.Length > 0)
            {
                paraUrlCoded += "=" + System.Web.HttpUtility.UrlEncode(paraValue);
            }
            else
            {
                paraUrlCoded = System.Web.HttpUtility.UrlEncode(paraValue);
            }

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
            catch (Exception )
            {
                writer = null;
                throw ;
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

            //Stream s = response.GetResponseStream();

            StreamReader sr = new StreamReader(response.GetResponseStream());

            strValue = sr.ReadToEnd();
            sr.Close();

           App.Log(strValue);
            return strValue;//返回数据
        }
        /// <summary>  
        /// 创建GET方式的HTTP请求  
        /// </summary>  
        public static HttpWebResponse CreateGetHttpResponse(string url, CookieCollection cookies = null)
        {
            HttpWebRequest request = null;
            if (url.StartsWith("https", StringComparison.OrdinalIgnoreCase))
            {
                //对服务端证书进行有效性校验（非第三方权威机构颁发的证书，如自己生成的，不进行验证，这里返回true）
                ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
                request = WebRequest.Create(url) as HttpWebRequest;
                request.ProtocolVersion = HttpVersion.Version10;    //http版本，默认是1.1,这里设置为1.0
            }
            else
            {
                request = WebRequest.Create(url) as HttpWebRequest;
            }
            request.Method = "GET";

            //设置代理UserAgent和超时
            //request.UserAgent = userAgent;
            //request.Timeout = timeout;
            if (cookies != null)
            {
                request.CookieContainer = new CookieContainer();
                request.CookieContainer.Add(cookies);
            }
            return request.GetResponse() as HttpWebResponse;
        }

        /// <summary>  
        /// 创建POST方式的HTTP请求  
        /// </summary>  
        public static HttpWebResponse CreatePostHttpResponse(string url, IDictionary<string, object> parameters, CookieCollection cookies = null)
        {
            HttpWebRequest request = null;
            //如果是发送HTTPS请求  
            if (url.StartsWith("https", StringComparison.OrdinalIgnoreCase))
            {
                //ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
                request = WebRequest.Create(url) as HttpWebRequest;
                //request.ProtocolVersion = HttpVersion.Version10;
            }
            else
            {
                request = WebRequest.Create(url) as HttpWebRequest;
            }
            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";

            //设置代理UserAgent和超时
            //request.UserAgent = userAgent;
            //request.Timeout = timeout; 

            if (cookies != null)
            {
                request.CookieContainer = new CookieContainer();
                request.CookieContainer.Add(cookies);
            }
            //发送POST数据  
            if (!(parameters == null || parameters.Count == 0))
            {
                StringBuilder buffer = new StringBuilder();
                int i = 0;
                foreach (string key in parameters.Keys)
                {
                    if (i > 0)
                    {
                        buffer.AppendFormat("&{0}={1}", key, parameters[key].ToString());
                    }
                    else
                    {
                        buffer.AppendFormat("{0}={1}", key, parameters[key].ToString());
                        i++;
                    }
                }
                byte[] data = Encoding.ASCII.GetBytes(buffer.ToString());
                using (Stream stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }
            }
            string[] values = request.Headers.GetValues("Content-Type");
            return request.GetResponse() as HttpWebResponse;
        }

        /// <summary>
        /// 获取请求的数据
        /// </summary>
        public static string GetResponseString(HttpWebResponse webresponse)
        {
            using (Stream s = webresponse.GetResponseStream())
            {
                StreamReader reader = new StreamReader(s, Encoding.UTF8);
                return reader.ReadToEnd();
            }
        }

        /// <summary>
        /// 验证证书
        /// </summary>
        private static bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
        {
            if (errors == SslPolicyErrors.None)
                return true;
            return false;
        }
    }
}
