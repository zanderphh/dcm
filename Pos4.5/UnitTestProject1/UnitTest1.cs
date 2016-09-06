using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Lib;
using Utils;
using Pos.BL;
using System.Collections.Generic;
using Pos.Model;
using System.Diagnostics;
using Pos.BL.Http;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void IsConnectInternetTest()
        {
            bool rtn;
            rtn = Internet.IsConnectInternet();
        }
        [TestMethod]
        public void TestHttp()
        {
            string rtn;
            string data = "{\"clientNo\":\"1207\",\"version\":\"1.5.1\",\"timestamp\":\"1461854941041\",\"mac\":\"ad917adc9b5074bc75ada99d07c49487\"}";
            rtn = HttpTool.Post(HttpMethodInfo.CommonUrl, HttpMethodInfo.GetCurrentTime,null, data);
            Debug.WriteLine(rtn, "Test");
        }
        [TestMethod]
        public void TestModelService()
        {
            List<Dish> a = new DishService().GetList();
            List<DishType> b = new DishTypeService().GetList();
            List<Curorder> c = new CurorderService().GetList();
            List<CurorderDetail> d = new CurorderDetailService().GetByCurorderId(c[0].CurorderId);
            List<Hisorder> e = new HisorderService().GetList();
            List<HisorderDetail> f = new HisorderDetailService().GetListByHisorderId(e[0].HisorderId);
            int s = 0;
            s++;
            Assert.IsTrue(true);
        }

    }
}
