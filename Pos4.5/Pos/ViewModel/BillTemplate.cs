using GalaSoft.MvvmLight;
using Pos.Model;
using Pos.Utils;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Media;

namespace Pos.ViewModel
{
    /// <summary>
    /// This class contains properties that a View can data bind to.
    /// <para>
    /// See http://www.galasoft.ch/mvvm
    /// </para>
    /// </summary>
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
        public static string GenerateBill(Curorder order, ObservableCollection<CurorderDetail> DetailList,string PayType)
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
            PrintDialog dialog = new PrintDialog();
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