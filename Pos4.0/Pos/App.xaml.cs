using System.Windows;
using GalaSoft.MvvmLight.Threading;
using Pos.View;
using System;
using System.IO;
using System.Diagnostics;
using System.Text;
using Lib;

namespace Pos
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static string Version
        {
            get
            {
                return Tools.IniRead(CurrentDir + "main.ini", "Hme", "ProgramVersion", "0.0.0");
            }
        }
        public static string CurrentDir = AppDomain.CurrentDomain.BaseDirectory;
        public static string MainIni = CurrentDir + "Posini.ini";
        public static int HmeTableId { get; set; }
        public static string TableName { get; set; } //收银机名称
        public static string OperatorId { get; set; }
        public static string OperatorName { get; set; }
        public static string ShopId { get; set; }
        public static string ShopName { get; set; }
        public static string DinnerName { get; set; }   //餐厅名称
        public static string DinnerAddr { get; set; }   //餐厅地址
        public static string DinnerTel { get; set; }    //餐厅电话

        public static string LogFile
        {
            get
            {
                string name = "HmePoslog";
                if (!Directory.Exists(CurrentDir + name))
                {
                    Directory.CreateDirectory(CurrentDir + name);
                }
                return CurrentDir + name + "\\" + DateTime.Today.ToString("yyyy-MM-dd") + ".txt";
            }
        }
        public static void Log(string str)
        {
            str = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + Environment.NewLine + str + Environment.NewLine + Environment.NewLine;
            FileStream fs = new FileStream(LogFile, FileMode.Append);
            StreamWriter sw = new StreamWriter(fs, Encoding.Default);
            sw.Write(str);
            sw.Close();
            fs.Close();
            //Trace.WriteLine(str);
            //Trace.WriteLine(str);
            //Trace.WriteLine("\n");
            //Trace.Flush();
        }
        static App()
        {
            DispatcherHelper.Initialize();
            //TextWriterTraceListener tr = new TextWriterTraceListener(System.IO.File.CreateText(LogFile));
            //Trace.Listeners.Add(tr);
            //TextWriterTraceListener tr1 = new TextWriterTraceListener(System.Console.Out);
            //Trace.Listeners.Add(tr1);
            //Trace.AutoFlush = true;
        }

        private void Application_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
        {
            try
            {                
                string s = string.Empty;
                s = "应用程序错误\r\n";
                //s += "错误代码:" + e.Exception.InnerException.HResult + "\r\n";
                s += "对象名称:" + e.Exception.InnerException.Source + "\r\n";
                s += "方法名称:" + e.Exception.InnerException.TargetSite + "\r\n";
                s += "错误信息:" + e.Exception.InnerException.Message + "\r\n";
                s += "调用堆栈:" + e.Exception.InnerException.StackTrace;               

                Log(s);
                MessageBox.Show(e.Exception.InnerException.Message);
                e.Handled = true;
            }
            catch (Exception ex)
            {
                
            }           
        }

        private void Application_Startup(object sender, StartupEventArgs e)
        {
            LoginWindow login = new LoginWindow();
            login.Show();
        }
    }
}
