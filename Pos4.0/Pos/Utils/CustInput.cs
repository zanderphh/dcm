using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace Pos.Utils
{
    public static class CustInput
    {
        /// <summary>
        /// 输入与删除当前焦点控件字符
        /// </summary>
        /// <param name="focus"></param>
        /// <param name="inputChar"></param>
        /// <param name="flag"></param>
        public static void inputText(IInputElement focus, string inputChar, string flag)
        {
            if (focus == null) { return; }
            if (focus is TextBox)
            {
                TextBox tb = (TextBox)focus;
                int index = tb.SelectionStart;
                if (flag == "backspace")
                {
                    if (index > 0)
                    {
                        tb.Text = tb.Text.Substring(0, index - 1) + tb.Text.Substring(index);
                        tb.SelectionStart = index - 1;
                    }
                }
                else if (flag == "del")
                {
                    tb.Text = "";
                }
                else
                {
                    tb.Text = tb.Text.Substring(0, index) + inputChar + tb.Text.Substring(index);
                    tb.SelectionStart = index + inputChar.Length;
                }

                Keyboard.Focus(tb);
                return;
            }
            if (focus is PasswordBox)
            {
                PasswordBox pb = (PasswordBox)focus;
                var Select = pb.GetType().GetMethod("Select", BindingFlags.Instance | BindingFlags.NonPublic);
                var GetSelect = pb.GetType().GetMethod("get_Selection", BindingFlags.Instance | BindingFlags.NonPublic);

                int index = pb.Password.Length;
                if (flag == "backspace")
                {
                    if (index > 0)
                    {
                        pb.Password = pb.Password.Substring(0, index - 1);
                    }
                }
                else if (flag == "del")
                {
                    pb.Password = "";
                }
                else
                {
                    pb.Password = pb.Password + inputChar;
                }

                Keyboard.Focus(pb);
                Select.Invoke(pb, new object[] { pb.Password.Length, 0 });
                return;
            }
        }
    }
}
