using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Lib;
using Utils;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            bool rtn;
            rtn = Internet.IsConnectInternet();
            Console.WriteLine(rtn);
            Console.Read();
        }
        [TestMethod]
        public void TestHttp()
        {
            string rtn;
            string data = "{\"clientNo\":\"1207\",\"version\":\"1.5.1\",\"timestamp\":\"1461854941041\",\"mac\":\"ad917adc9b5074bc75ada99d07c49487\"}";
            rtn = Http.Post(HttpMethodInfo.CommonUrl,HttpMethodInfo.GetCurrentTime, data);
            Console.WriteLine(rtn);
            Console.Read();
        }
    }
}
