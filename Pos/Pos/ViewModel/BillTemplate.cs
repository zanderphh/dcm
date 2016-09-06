using GalaSoft.MvvmLight;
using Lib;
using Pos.Model;
using Pos.Utils;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Printing;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Media;

namespace Pos.ViewModel
{
    public static class PrintExtention
    {/// <summary>
     /// 设置指定打印机
     /// </summary>
     /// <param name="dg"></param>
     /// <param name="printer"></param>
        public static void SetPrinter(this PrintDialog dg, string printer)
        {
            //从本地计算机中获取所有打印机对象(PrintQueue)
            var printers = new LocalPrintServer().GetPrintQueues();
            //选择一个打印机
            var selectedPrinter = printers.FirstOrDefault(p => p.Name == printer);

            if (selectedPrinter == null)
            {
                MessageBox.Show("没有找到打印机:" + printer + ",\r\n将使用默认打印机进行打印");
            }
            //设置打印机
            dg.PrintQueue = selectedPrinter;
        }
    }

    public class BillTemplate : ViewModelBase
    {
        /// <summary>
        /// Initializes a new instance of the BillTemplate class.
        /// </summary>
        public BillTemplate()
        {
        }
        /// <summary>
        /// 生成结账单
        /// </summary>
        /// <param name="order"></param>
        /// <param name="curorderDetailList"></param>
        /// <returns></returns>
        public static string GenerateBill(Curorder order, ObservableCollection<CurorderDetail> DetailList, string PayType)
        {
            int col1 = 16, col2 = 8, col3 = 8;
            decimal sum = 0, qtys = 0;
            string s = string.Empty;
            s += CharTool.Append(App.DinnerName);
            s += CharTool.Append("结账单");
            s += CharTool.Append("流水:" + order.CurorderId, AlignType.Left);
            s += CharTool.Split();

            s += CharTool.Append("品名", AlignType.Left, col1) + CharTool.Append("数量", AlignType.Left, col2) + CharTool.Append("单价", AlignType.Left, col3);
            s += "\n";

            foreach (var item in DetailList)
            {
                qtys += item.Quantity;
                sum += item.Quantity * item.Price * item.DiscountRate;
                s += CharTool.Append(item.DishName, AlignType.Left, col1) + CharTool.Append(item.Quantity, AlignType.Left, col2) + CharTool.Append(item.Price, AlignType.Left, col3);
                s += "\n";
            }
            s += CharTool.Split();
            s += CharTool.Append("合计:", AlignType.Left, col1) + CharTool.Append(qtys.ToString("0.00"), AlignType.Left, col2) + CharTool.Append(sum.ToString("0.00"), AlignType.Left, col3);
            s += "\n";
            s += CharTool.Append(PayType + "支付", AlignType.Left, col1);
            s += CharTool.Append("收银:" + App.OperatorId, AlignType.Right, col2 + col3);
            s += "\n";
            s += CharTool.Append(DateTime.Now, AlignType.Left);
            s += CharTool.Append("欢迎下次光临");
            return s;
        }

        /// <summary>
        /// 生成历史结账单
        /// </summary>
        /// <param name="order"></param>
        /// <param name="curorderDetailList"></param>
        /// <returns></returns>
        public static string GenerateHisorderBill(Hisorder order, List<HisorderDetail> DetailList)
        {
            int col1 = 16, col2 = 8, col3 = 8;
            decimal sum = 0, qtys = 0;
            string s = string.Empty;
            s += CharTool.Append(App.DinnerName);
            s += CharTool.Append("结账单");
            s += CharTool.Append("流水:" + order.HisorderId, AlignType.Left);
            s += CharTool.Split();

            s += CharTool.Append("品名", AlignType.Left, col1) + CharTool.Append("数量", AlignType.Left, col2) + CharTool.Append("单价", AlignType.Left, col3);
            s += "\n";

            foreach (var item in DetailList)
            {
                qtys += item.Quantity;
                sum += item.Quantity * item.Price * item.DiscountRate;
                s += CharTool.Append(item.DishName, AlignType.Left, col1) + CharTool.Append(item.Quantity, AlignType.Left, col2) + CharTool.Append(item.Price, AlignType.Left, col3);
                s += "\n";
            }
            s += CharTool.Split();
            s += CharTool.Append("合计:", AlignType.Left, col1) + CharTool.Append(qtys.ToString("0.00"), AlignType.Left, col2) + CharTool.Append(sum.ToString("0.00"), AlignType.Left, col3);
            s += "\n";
            s += CharTool.Append(order.Paytype + "支付", AlignType.Left, col1);
            s += CharTool.Append("收银:" + App.OperatorId, AlignType.Right, col2 + col3);
            s += "\n";
            s += CharTool.Append(DateTime.Now, AlignType.Left);
            s += CharTool.Append("欢迎下次光临");
            return s;
        }

        /// <summary>
        /// 打印账单
        /// </summary>
        /// <param name="str"></param>
        public static void PrintBill(string doc)
        {
            string printer = Tools.IniRead(App.CurrentDir + "main.ini", "Options", "printer_of_jzd", "");
            if (string.IsNullOrEmpty(printer))
            {
                return;
            }
            PrintDialog dialog = new PrintDialog();
            dialog.SetPrinter(printer);
            Run run = new Run(doc);
            TextBlock visual = new TextBlock();
            visual.FontSize = 14;
            visual.FontFamily = new FontFamily("微软雅黑");
            visual.Inlines.Add(run);
            visual.Margin = new Thickness(20, 1, 1, 1);
            visual.TextWrapping = TextWrapping.Wrap;
            visual.LayoutTransform = new ScaleTransform(1, 1);
            Size pageSize = new System.Windows.Size(dialog.PrintableAreaWidth, dialog.PrintableAreaHeight);
            visual.Measure(pageSize);
            visual.Arrange(new Rect(0, 0, pageSize.Width, pageSize.Height));
            dialog.PrintVisual(visual, "结账单");
        }
    }
}