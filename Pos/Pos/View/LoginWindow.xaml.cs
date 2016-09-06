using GalaSoft.MvvmLight.Messaging;
using Lib;
using Newtonsoft.Json.Linq;
using Pos.BL.Http;
using Pos.Utils;
using System.Data;
using System.Diagnostics;
using System.Reflection;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace Pos.View
{
    /// <summary>
    /// Description for Login.
    /// </summary>
    public partial class LoginWindow : BaseWindow
    {
        IInputElement focus;
        public LoginWindow()
        {
            InitializeComponent();
        }

        /// <summary>
        /// 消息接收，回调方法
        /// </summary>
        /// <param name="obj"></param>
        private void LoginCallback(MsgArgs obj)
        {
            switch (obj.Code)
            {
                case MsgCode.Succ:
                    if (Init() == false)
                    {
                        return;
                    }
                    (new OrderWindow()).Show();
                    Close();
                    return;
                case MsgCode.Faild:
                    Close();
                    return;
                case MsgCode.NoTheUser:
                    tbxUser.Clear();
                    tbxUser.Focus();
                    break;
                case MsgCode.PasswordError:
                    tbxPwd.Clear();
                    tbxPwd.Focus();
                    break;
            }
            MessageBox.Show(obj.ErrMessage);
        }

        /// <summary>
        /// 初始化检测
        /// </summary>
        private bool Init()
        {
            string tableName = Tools.IniRead(App.MainIni, "App", "posname", "");
            if (string.IsNullOrEmpty(tableName))
            {
                SelectTableWindow w = new SelectTableWindow();
                w.OKCallback += (sender, parm) =>
                {
                    if (parm == null)
                    {
                        return null;
                    }
                    tableName = parm.ToString();
                    Tools.IniWrite(App.MainIni, "App", "posname", tableName);
                    return null;
                };
                w.ShowDialog();
            }
            if (string.IsNullOrEmpty(tableName))
            {
                MessageBox.Show("必须选择收银机才能继续使用系统！");
                return false;
            }
            App.TableName = tableName;
            var o = OdbcTool.ExecuteScalar("select hme_id from tables where tablename = ?", tableName);
            if (o == null)
            {
                Tools.IniWrite(App.MainIni, "App", "posname", "");
                MessageBox.Show("未找到与服务器对应的台位ID\r\n" + "本地台位名称:" + tableName);
                return false;
            }
            App.HmeTableId = int.Parse(o.ToString());

            string sql = "select top 1 dinnername,dinnneraddress,dinnertel from dinner";
            DataTable dt = OdbcTool.ExecuteDataTable(sql);
            if (dt.Rows.Count > 0)
            {
                App.DinnerName = dt.Rows[0][0] == null ? string.Empty : dt.Rows[0][0].ToString();
                App.DinnerAddr = dt.Rows[0][1] == null ? string.Empty : dt.Rows[0][1].ToString();
                App.DinnerTel = dt.Rows[0][2] == null ? string.Empty : dt.Rows[0][2].ToString();
            }
            return true;
        }
        protected void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Messenger.Default.Register<MsgArgs>(this, MsgToken.LoginToken, LoginCallback);
            Keyboard.Focus(tbxUser);
            tbxUser.SelectionStart = tbxUser.Text.Length;

            //检测升级
            try
            {
                if (Tools.IniRead(App.CurrentDir + "main.ini", "kill", "server", "").ToLower() != "s") return;//非服务端不检测升级
                if (App.Version == "0.0.0") return;
                MsgArgs arg = (new HttpUpgradeCheck()).Request();
                if (arg.Code == 22 || arg.Code != 1) return;
                string data = JObject.Parse(arg.Content)["data"].ToString();
                var serverVersion = JsonTool.ParseValue(data, "version");
                string url = JsonTool.ParseValue(data, "downloadUrl");
                if (string.IsNullOrEmpty(App.Version) || string.Compare(serverVersion, App.Version) <= 0) return;
                string str = "当前程序版本: " + App.Version + "\r\n服务器程序版本:" + serverVersion + ", 是否立即更新？";
                if (MessageBox.Show(str, "提示", MessageBoxButton.OKCancel) == MessageBoxResult.Cancel) return;
                string downloadexefile = Tools.IniRead(App.CurrentDir + "main.ini", "exefile", "downloadfile.exe", "downloadfile.exe");
                Process.Start(downloadexefile, url);
                Tools.IniWrite(App.MainIni, "App", "startpoint", "pos");//让下载升级完成后启动该程序
                Close();
            }
            catch (System.Exception ex)
            {
                App.Log(ex.Message);
            }

        }

        protected override void Window_Unloaded(object sender, RoutedEventArgs e)
        {
            base.Window_Unloaded(sender, e);
        }
        private void Grid_Click(object sender, RoutedEventArgs e)
        {
            Button btn = e.OriginalSource as Button;
            if (btn == null)
            {
                return;
            }
            string inputChar = btn.Content.ToString();
            CustInput.inputText(focus, inputChar, btn.Tag == null ? null : btn.Tag.ToString());
        }

        private void textBox_GotKeyboardFocus(object sender, KeyboardFocusChangedEventArgs e)
        {
            focus = e.NewFocus;
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        /// <summary>
        /// 测试用
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tbxPwd_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyStates == Keyboard.GetKeyStates(Key.T) && Keyboard.Modifiers == ModifierKeys.Control)
            {
                InnerTest Test = new InnerTest();
                Test.Show();
                e.Handled = true;
                return;
            }
            //特殊登录方式
            if (Keyboard.IsKeyDown(Key.LeftCtrl) && Keyboard.IsKeyDown(Key.Back))
            {
                Messenger.Default.Send(new MsgArgs(MsgCode.Succ), MsgToken.LoginToken);
                e.Handled = true;
                return;
            }
        }
    }
}