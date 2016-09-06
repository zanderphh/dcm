using GalaSoft.MvvmLight.Messaging;
using Pos.Utils;
using System.Windows;
using System;
using System.Windows.Controls;
using System.Windows.Data;
using Lib;
using System.Windows.Media;
using System.Windows.Documents;
using System.Windows.Threading;

namespace Pos.View
{
    public partial class OrderWindow : BaseWindow
    {
        public OrderWindow()
        {
            InitializeComponent();
            App.Current.MainWindow = this;
            DispatcherTimer _timer = new DispatcherTimer();
            _timer.Interval = TimeSpan.FromMilliseconds(1000);
            _timer.Tick += new EventHandler(delegate (object s, EventArgs a)
            {
                textBlock_time.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            });
            _timer.Start();

        }
        protected void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Messenger.Default.Register<MsgArgs>(this, MsgToken.OrderToken, Callback);
            if (dishTypeListBox.Items.Count > 0)
            {
                dishTypeListBox.SelectedIndex = 0;
            }
        }
        protected override void Window_Unloaded(object sender, RoutedEventArgs e)
        {
            base.Window_Unloaded(sender, e);
        }
        private void Callback(MsgArgs obj)
        {
            if (obj.MsgToken == "AddDish")
            {
                orderedDishlistBox.ScrollIntoView(orderedDishlistBox.SelectedItem);
                return;
            }
        }

        private void buttonHisorder_Click(object sender, RoutedEventArgs e)
        {
            HisorderWindow w = new HisorderWindow();
            //w.Owner = App.Current.MainWindow;
            w.ShowDialog();
        }

        protected override void closeButton_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("确定要退出系统吗？", "提示", MessageBoxButton.YesNo, MessageBoxImage.Asterisk, MessageBoxResult.No) == MessageBoxResult.No)
                return;
            base.closeButton_Click(sender, e);
        }
    }
}