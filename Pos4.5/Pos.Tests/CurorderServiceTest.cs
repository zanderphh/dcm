// <copyright file="CurorderServiceTest.cs">Copyright ©  2016</copyright>
using System;
using System.Collections.Generic;
using Microsoft.Pex.Framework;
using Microsoft.Pex.Framework.Validation;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Pos.BL;
using Pos.Model;

namespace Pos.BL.Tests
{
    /// <summary>此类包含 CurorderService 的参数化单元测试</summary>
    [PexClass(typeof(CurorderService))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(InvalidOperationException))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(ArgumentException), AcceptExceptionSubtypes = true)]
    [TestClass]
    public partial class CurorderServiceTest
    {
        /// <summary>测试 GetList() 的存根</summary>
        [PexMethod(MaxBranches = 20000)]
        public List<Curorder> GetListTest([PexAssumeUnderTest]CurorderService target)
        {
            List<Curorder> result = target.GetList();
            return result;
            // TODO: 将断言添加到 方法 CurorderServiceTest.GetListTest(CurorderService)
        }
    }
}
