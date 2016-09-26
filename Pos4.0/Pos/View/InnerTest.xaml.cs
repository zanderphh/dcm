using Lib;
using Pos.BL.Http;
using Pos.Utils;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Net;
using System.Printing;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Utils;

namespace Pos.View
{
    /// <summary>
    /// InnerTest.xaml 的交互逻辑
    /// </summary>
    public partial class InnerTest : Window
    {
        public InnerTest()
        {
            InitializeComponent();
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            string p = "{\"clientNo\": \"1207\",  \"version\": \"9.9.9\",  \"shopId\": \"2286\",  \"account\": \"hmyct\",  \"timestamp\": \"1465800076497\",  \"orderNo\": \"CRM20160613144114763\",  \"channel\": 3,  \"authCode\": \"1\",  \"mac\": \"48470fa98f4ad845473abf76b80416e7\"}";
            string s = Post(@"http://api.hme.cn/hpf-open-api/api/crm/micropay.api", "jsonStr", p);
            //HttpTool.Post(@"http://api.hme.cn/hpf-open-api/api/crm/micropay.api", "jsonStr", p);
            MessageBox.Show(s);
        }

        private void D_PrintPage(object sender, PrintPageEventArgs e)
        {
            string s = "In document_PrintPage method.";
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
            catch (Exception)
            {
                writer = null;
                throw;
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
    }
}
