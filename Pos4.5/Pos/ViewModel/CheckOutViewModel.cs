using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Messaging;
using Lib;
using Pos.BL;
using Pos.Model;
using Pos.Utils;
using GalaSoft.MvvmLight.Command;
using System;
using System.ComponentModel.DataAnnotations;
using System.Windows;

namespace Pos.ViewModel
{
    public class CheckOutViewModel : ValidationViewModelBase
    {
        //    public override void OnUnregister<T>(object obj)
        //    {
        //        base.OnUnregister<CheckOutViewModel>(obj);
        //    }
        //    /// <summary>
        //    /// 结账回调接口
        //    /// </summary>
        //    public CallbackHandler CheckOutCallBack;

        //    /// <summary>
        //    /// 订单应付总金额
        //    /// </summary>
        //    public decimal ShouldPay = 0;
        //    /// <summary>
        //    /// 付款方式
        //    /// </summary>
        //    string PayTypeString { get; set; }
        //    /// <summary>
        //    /// 付款码
        //    /// </summary>
        //    string PayCodeString { get; set; }

        //    private string payCodeMoney;
        //    /// <summary>
        //    /// 现金输入值
        //    /// </summary>
        //    public string PayCodeMoney
        //    {
        //        get { return payCodeMoney; }
        //        set
        //        {
        //            payCodeMoney = value;
        //            PayCodeString = string.Empty;
        //            PayTypeString = PayType.现金;
        //            Set(ref payCodeMoney, value, true);
        //        }
        //    }

        //    private string payCodeWx;
        //    /// <summary>
        //    /// 微信付款码
        //    /// </summary>
        //    public string PayCodeWx
        //    {
        //        get { return payCodeWx; }
        //        set
        //        {
        //            payCodeWx = value;
        //            PayCodeString = value;
        //            PayTypeString = PayType.微信;
        //            Set(ref payCodeWx, value, true);
        //        }
        //    }
        //    private string payCodeZfb;
        //    /// <summary>
        //    /// 支付宝付款码
        //    /// </summary>
        //    public string PayCodeZfb
        //    {
        //        get { return payCodeZfb; }
        //        set
        //        {
        //            payCodeZfb = value;
        //            PayCodeString = value;
        //            PayTypeString = PayType.支付宝;
        //            Set(ref payCodeZfb, value, true);
        //        }
        //    }
        //    private string payCodeJf;
        //    /// <summary>
        //    /// 积分付款码
        //    /// </summary>
        //    public string PayCodeJf
        //    {
        //        get { return payCodeJf; }
        //        set
        //        {
        //            payCodeJf = value;
        //            PayCodeString = value;
        //            PayTypeString = PayType.积分;
        //            Set(ref payCodeJf, value, true);
        //        }
        //    }

        //    private RelayCommand checkOutCommand;
        //    public RelayCommand CheckOutCommand
        //    {
        //        get
        //        {
        //            return checkOutCommand
        //                ?? (checkOutCommand = new RelayCommand(
        //                () =>
        //                {
        //                    MessageBox.Show(PayCodeWx);
        //                    MessageBox.Show(PayCodeZfb);
        //                    MessageBox.Show(PayCodeJf);
        //                    //CheckOrder();
        //                }));
        //        }
        //    }

        //    /// <summary>
        //    /// 结账逻辑
        //    /// </summary>
        //    private void CheckOrder()
        //    {
        //        CheckOutArg arg = new CheckOutArg()
        //        {
        //            PayType = PayCodeString,
        //            PayCode = PayCodeString
        //        };
        //        var v = CheckOutCallBack.Invoke(arg);
        //    }

        public class PayType
        {
            public static string 现金 = "现金";
            public static string 微信 = "微信";
            public static string 支付宝 = "支付宝";
            public static string 积分 = "积分";
        }

        public class CheckOutArg
        {
            public string PayType { get; set; }
            public decimal ShouldPay { get; set; }
            public string PayCode { get; set; }
        }
    }
}