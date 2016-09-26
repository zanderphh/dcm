using Lib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Utils
{/// <summary>
/// 字符格式化类
/// </summary>
    public class CharTool
    {
        public const int CharsPerLine = 34; //每行字符数
        /// <summary>
        /// 格式化字符串
        /// </summary>
        /// <param name="s"></param>
        /// <param name="align"></param>
        /// <param name="charWidth"></param>
        /// <returns></returns>
        public static string Append(object o, AlignType align = AlignType.Center, int charWidth = 0)
        {
            string s = o.ToString();
            bool noRn = false; //不换行标志,默认要换行
            if (charWidth == 0)
            {
                charWidth = CharsPerLine;
            }
            else
            {
                noRn = true;
            }
            string str = s;
            int length = str.GetByte();
            if (align == AlignType.Left && length <= charWidth)
            {
                str = fillRightToWidth(str, charWidth);
            }
            else if (align == AlignType.Right && length <= charWidth)
            {
                str = fillLeftToWidth(str, charWidth);
            }
            else
            {
                if (length < charWidth)
                {
                    str = fillLeftToWidth("", (charWidth - length)/2) + str + fillRightToWidth("", (charWidth - length)/2);
                }
            }
            //截断
            if (str.GetByte() > charWidth)
            {
                string temp = string.Empty;
                for (int j = 0; j < int.MaxValue; j++)
                {
                    temp += str.Substring(j, 1);
                    if (temp.GetByte() >= charWidth)
                    {
                        str = temp;
                        break;
                    }
                }
            }
            //换行
            if (noRn == false)
            {
                str = str + "\n";
            }
            return str;
        }

        private static string fillLeftToWidth(string str,int width)
        {
            while (str.GetByte() < width)
            {
                str = '　' + str;
            }
            return str;
        }
        private static string fillRightToWidth(string str, int width)
        {
            while (str.GetByte() < width)
            {
                str =  str + '　';
            }
            return str;
        }
        public static string Split()
        {
            return "".PadLeft(CharsPerLine / 2, '—') + "\n";
        }
    }
    public enum AlignType
    {
        Center,
        Left,
        Right
    }

}
