using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace Lib
{
    public static class Test
    {
        public static System.ComponentModel.DataAnnotations.ValidationResult CheckValid(object obj)
        {
            if (Int32.Parse(obj.ToString()) == 100)
            {
                return System.ComponentModel.DataAnnotations.ValidationResult.Success;
            }
            return new System.ComponentModel.DataAnnotations.ValidationResult("值必须为100");
        }

    }
}
