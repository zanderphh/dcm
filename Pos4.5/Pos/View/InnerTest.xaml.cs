using Lib;
using Pos.Utils;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
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
            string s = "";
            //s += CharTool.Append("A");
            //s += CharTool.Append("AA");
            //s += CharTool.Append("AAA");
            //s += CharTool.Append("AAAA");

            //s += CharTool.Append("A",AlignType.Left);
            //s += CharTool.Append("AA", AlignType.Left);
            //s += CharTool.Append("AAA", AlignType.Left);

            //s += CharTool.Append("A", AlignType.Right);
            //s += CharTool.Append("AA", AlignType.Right);
            //s += CharTool.Append("ASA", AlignType.Right);

            //s += CharTool.Append("A", AlignType.Left,8);
            //s += CharTool.Append("AA", AlignType.Left, 8);
            //s += CharTool.Append("AAA", AlignType.Left, 8);

            //s += CharTool.Append("A", AlignType.Center, 8);
            //s += CharTool.Append("AA", AlignType.Center, 8);
            //s += CharTool.Append("AAA", AlignType.Center, 8);

            s += "    A账  单B    ";
            byte[] temp;
            //将 textBox1.Text 转换为 byte 数组
            temp = Encoding.Default.GetBytes(s);
            //利用 Encoding 类的 Convert 方法，将 temp 的编码由 gb2312 转换为 big5 编码
            temp = Encoding.Convert(Encoding.GetEncoding("gb2312"), Encoding.GetEncoding("utf-8"), temp);
            //将 byte 数组 转换为 string
            s = Encoding.Default.GetString(temp);

            PrintDialog dialog = new PrintDialog();
            Run run = new Run(s);
            TextBlock visual = new TextBlock();
            visual.FontSize = 20;
            visual.Inlines.Add(run);
            visual.Margin = new Thickness(20, 1, 1, 1);
            visual.TextWrapping = TextWrapping.Wrap;
            visual.LayoutTransform = new ScaleTransform(1, 1);
            Size pageSize = new Size(dialog.PrintableAreaWidth, dialog.PrintableAreaHeight);
            visual.Measure(pageSize);
            visual.Arrange(new Rect(0, 0, pageSize.Width, pageSize.Height));
            dialog.PrintVisual(visual, "doc");
        }

        private void D_PrintPage(object sender, PrintPageEventArgs e)
        {
            string s = "In document_PrintPage method.";
        }
    }
}
