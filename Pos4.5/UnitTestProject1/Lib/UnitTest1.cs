using Microsoft.VisualStudio.TestTools.UnitTesting;
using Lib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lib.Tests
{
    [TestClass()]
    public class UnitTest1
    {
        [TestMethod()]
        public void MD5EncodeTest()
        {
            string s = Tools.MD5Encode("12071.5.2sccs1463935668218db2191f6c0fb520a6b08810591cea7f4");
        }
    }
}