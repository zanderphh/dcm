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
using Pos.BL.Http;
using Newtonsoft.Json.Linq;
using System.Windows.Input;
using Utils.Lib;

namespace Pos.ViewModel
{
    public class LoginViewModel : ValidationViewModelBase
    {
        private int inputErrTime = 0;//输错次数,大于三次退出
        private RelayCommand<KeyEventArgs> keyUpCommand;
        public RelayCommand<KeyEventArgs> KeyUpCommand
        {
            get
            {
                return keyUpCommand ?? (keyUpCommand = new RelayCommand<KeyEventArgs>
                (
                    (e) =>
                    {
                        if (e.Key != Key.Enter) return;
                        var element = e.OriginalSource as UIElement;
                        Login(element);
                    },
                    p => string.IsNullOrEmpty(OperatorId) == false
                ));
            }
        }


        public RelayCommand<object> LoginCommand { get; set; }
        /// <summary>
        /// Initializes a new instance of the LoginViewModel class.
        /// </summary>
        public LoginViewModel()
        {
            LoginCommand = new RelayCommand<object>(Exe, CanExe);
        }

        public override void OnUnregister<T>(object obj)
        {
            base.OnUnregister<LoginViewModel>(null);
        }

        private bool CanExe(object arg)
        {
            return !string.IsNullOrEmpty(OperatorId);
        }

        private void Exe(object obj)
        {
            Login(obj);
        }

        private string _operatorID;
        [RegularExpression(@"^[0-9]*$", ErrorMessage = "请输入合法的用户编码!")]
        [Required(ErrorMessage = "请输入用户ID")]
        public string OperatorId
        {
            get { return _operatorID; }
            set
            {
                Set("OperatorId", ref _operatorID, value, true);
                this.ValidateProperty("OperatorId");
                LoginCommand.RaiseCanExecuteChanged();
            }
        }
        private string _operatorPwd;

        public string OperatorPwd
        {
            get { return _operatorPwd; }
            set
            {
                Set(() => OperatorPwd, ref _operatorPwd, value, true);
                this.ValidateProperty("OperatorPwd");
            }
        }
        void Login(object obj)
        {
            string hmeOperatorId, hmeOeratorPwd;
            hmeOperatorId = DbTool.GetDbValue(Hme.CONST_Account);
            hmeOeratorPwd = DbTool.GetDbValue(Hme.CONST_password);
            if (string.IsNullOrEmpty(hmeOeratorPwd) || string.IsNullOrEmpty(hmeOeratorPwd))
            {
                MessageBox.Show("获取服务器分配账号或密码失败！");
                return;
            }
            bool isValid = false;
            DependencyObject btn = obj as DependencyObject;
            if (btn == null) { return; }
            Window dobj = Window.GetWindow(btn);
            if (dobj == null) { return; }
            if (dobj.HasError()) { return; }            //验证输入
            if (!this.ValidateViewModel()) { return; }  //验证ViewModel

            OperatorService service = new OperatorService();
            Operator o = service.GetById(OperatorId);
            if (o == null)
            {
                inputErrTime++;
                MessageBox.Show("本地用户不存在！");
            }
            else if (o.Pwd != (OperatorPwd ?? string.Empty))
            {
                inputErrTime++;
                MessageBox.Show("验证本地用户密码错误！");
            }
            else
            {
                inputErrTime = 0;
                isValid = true;
            }
            if (!isValid)
            {
                if (inputErrTime > 2)
                {
                    Messenger.Default.Send(new MsgArgs(MsgCode.Faild), MsgToken.LoginToken);
                }
                return;
            }
            if (Internet.IsConnectInternet())
            {
                try
                {
                    MsgArgs msg = (new HttpLogin()).Request();
                    if (msg.Code != 1)
                    {
                        MessageBox.Show("远程请求登录失败\n" + msg.ErrMessage);
                        return;
                    }
                    string license = JObject.Parse(msg.Content)["data"][0]["license"].ToString();
                    license = Tools.Base64Decode(license);
                    license = license.Split('|')[1];
                    string qrCodeAd = JObject.Parse(msg.Content)["data"][0]["qrCodeAd"].ToString();
                    DbTool.SetDbValue(Hme.CONST_Validdate, license);
                    DbTool.SetDbValue(Hme.CONST_QrCodeAd, qrCodeAd);
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.Message);
                    return;
                }
            }

            string validDateString = DbTool.GetDbValue(Hme.CONST_Validdate);
            if (string.IsNullOrEmpty(validDateString))
            {
                MessageBox.Show("获取登录授权失败!");
                return;
            }

            DateTime validDate = DateTime.Parse(validDateString);
            TimeSpan ts = validDate - DateTime.Today;
            if (ts.Days < 0)
            {
                MessageBox.Show("授权已过期,请联系服务提供商!");
                return;
            }

            App.OperatorId = OperatorId;
            App.OperatorName = o.Name;
            App.ShopId = DbTool.GetDbValue(Hme.CONST_ShopId);
            App.ShopName = DbTool.GetDbValue(Hme.CONST_ShopName);
            Messenger.Default.Send(new MsgArgs(MsgCode.Succ), MsgToken.LoginToken);
        }
    }
}