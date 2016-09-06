using GalaSoft.MvvmLight.Messaging;
using Lib;
using Pos.Utils;
using Pos.ViewModel;
using System;
using System.ComponentModel;
using System.Reflection;
using System.Security.Permissions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Input;
using System.Windows.Threading;

namespace Pos.View
{
    public partial class CheckOutWindow : BaseWindow
    {
        TextBox focus;
        decimal ShouldPay = 0;
        string PayCodeString = string.Empty;
        string PayTypeString = string.Empty;
        public CheckOutWindow(MsgArgs arg)
        {
            InitializeComponent();
            tbxMoney.Focus();
            if (null != arg)
            {
                tb_shouldpay.Text = string.Format("合计金额:￥{0}", arg.Content);
                ShouldPay = decimal.Parse(arg.Content);
            }
        }
        /// <summary>
        /// 文本框获得焦点勾选支付方式
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void textBox_GotFocus(object sender, RoutedEventArgs e)
        {
            var tb = e.OriginalSource as TextBox;
            if (tb == null || tb.Tag == null) return;
            focus = tb;
            switch (Convert.ToInt32(tb.Tag))
            {
                case 1:
                    cbxMoney.IsChecked = true;
                    cbxWx.IsChecked = false;
                    cbxZfb.IsChecked = false;
                    cbxJf.IsChecked = false;
                    tbxWx.Text = string.Empty;
                    tbxZfb.Text = string.Empty;
                    tbxJf.Text = string.Empty;
                    PayTypeString = PayType.现金;
                    break;
                case 2:
                    cbxMoney.IsChecked = false;
                    cbxWx.IsChecked = true;
                    cbxZfb.IsChecked = false;
                    cbxJf.IsChecked = false;
                    tbxMoney.Text = string.Empty;
                    tbxZfb.Text = string.Empty;
                    tbxJf.Text = string.Empty;
                    PayTypeString = PayType.微信;
                    break;
                case 3:
                    cbxMoney.IsChecked = false;
                    cbxWx.IsChecked = false;
                    cbxZfb.IsChecked = true;
                    cbxJf.IsChecked = false;
                    tbxMoney.Text = string.Empty;
                    tbxWx.Text = string.Empty;
                    tbxJf.Text = string.Empty;
                    PayTypeString = PayType.支付宝;
                    break;
                case 4:
                    cbxMoney.IsChecked = false;
                    cbxWx.IsChecked = false;
                    cbxZfb.IsChecked = false;
                    cbxJf.IsChecked = true;
                    tbxMoney.Text = string.Empty;
                    tbxWx.Text = string.Empty;
                    tbxZfb.Text = string.Empty;
                    PayTypeString = PayType.积分;
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 输入面板事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Grid_Click(object sender, RoutedEventArgs e)
        {
            Button btn = e.OriginalSource as Button;
            if (btn == null)
            {
                return;
            }

            if (btn.Tag != null && btn.Tag.ToString() == "OK")
            {
                return;
            }

            string inputChar = btn.Content.ToString();
            CustInput.inputText(focus, inputChar, btn.Tag == null ? null : btn.Tag.ToString());
        }

        /// <summary>
        /// 计算找零
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tbxMoney_TextChanged(object sender, TextChangedEventArgs e)
        {
            TextBox tb = sender as TextBox;
            if (null == tb) return;
            if (!string.IsNullOrEmpty(tb.Text))
            {
                tbxZl.Text = (Convert.ToDecimal(tb.Text) - ShouldPay).ToString();
            }
            else
            {
                tbxZl.Text = string.Empty;
            }
        }

        /// <summary>
        /// 结账按钮事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void OK_Click(object sender, RoutedEventArgs e)
        {
            int PayChannel = 0;
            switch (PayTypeString)
            {
                case PayType.微信:
                    PayCodeString = tbxWx.Text.Trim();
                    PayChannel = 1;
                    break;
                case PayType.支付宝:
                    PayCodeString = tbxZfb.Text.Trim();
                    PayChannel = 2;
                    break;
                case PayType.积分:
                    PayCodeString = tbxJf.Text.Trim();
                    PayChannel = 3;
                    break;
                default:
                    PayCodeString = string.Empty;
                    PayChannel = 0;
                    break;
            }

            if (PayChannel == 0 && tbxMoney.Text.Length > 8)
            {
                MessageBox.Show("输入有误，请重新输入!");
                tbxMoney.Text = string.Empty;
                return;
            }

            if (PayChannel > 0 && string.IsNullOrEmpty(PayCodeString))
            {
                MessageBox.Show(string.Format("请输入{0}付款码！", PayTypeString));
                return;
            }

            MsgArgs arg = new MsgArgs();
            arg.Extra.Add("PayCode", PayCodeString);
            arg.Extra.Add("PayType", PayTypeString);
            arg.Extra.Add("PayChannel", PayChannel);

            //支付中...
            grid_doing.Visibility = Visibility.Visible;
            Task<MsgArgs> task = Task.Factory.StartNew(() =>
            {
                MsgArgs msg = OK(arg) as MsgArgs;
                return msg;
            });
            Task t = task.ContinueWith((a) =>
            {
                MsgArgs message = a.Result;
                if (message.Code != MsgCode.Succ)
                {//支付失败...
                    grid_doing.Visibility = Visibility.Collapsed;
                    MessageBox.Show(message.ErrMessage);
                    if (PayChannel == 0)
                    {
                        tbxMoney.Focus();
                    }
                    else if (PayChannel == 1)
                    {
                        tbxWx.Text = string.Empty;
                        tbxWx.Focus();
                    }
                    else if (PayChannel == 2)
                    {
                        tbxZfb.Text = string.Empty;
                        tbxZfb.Focus();
                    }
                    else if (PayChannel == 3)
                    {
                        tbxJf.Text = string.Empty;
                        tbxJf.Focus();
                    }
                    return;
                }
                //支付成功...
                grid_doing.Visibility = Visibility.Collapsed;
                grid_succ.Visibility = Visibility.Visible;
                BillTemplate.PrintBill(message.Content);
            }, TaskScheduler.FromCurrentSynchronizationContext());
        }

        public class PayType
        {
            public const string 现金 = "现金";
            public const string 微信 = "微信";
            public const string 支付宝 = "支付宝";
            public const string 积分 = "积分";
        }

        private void OnKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                buttonOK.RaiseEvent(new RoutedEventArgs(Button.ClickEvent));
                e.Handled = true;
            }
        }
    }
}