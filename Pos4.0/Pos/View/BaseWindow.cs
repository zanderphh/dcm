using FirstFloor.ModernUI.Windows.Controls;
using GalaSoft.MvvmLight.Command;
using GalaSoft.MvvmLight.Messaging;
using Lib;
using Pos.Utils;
using System;
using System.ComponentModel;
using System.Windows;

namespace Pos.View 
{
    public delegate object OkCancelHandler(object sender, object para);
    public class BaseWindow : ModernWindow, INotifyPropertyChanged
    {
        /// <summary>
        /// 窗体关闭后，自动注销与之绑定的ViewModel,ViewModel必须重写OnUnregister方法
        /// </summary>
        public BaseWindow()
        {
            Unloaded += Window_Unloaded;            
            Closed += (sender, e) =>
            {
                ValidationViewModelBase vm = (ValidationViewModelBase)this.DataContext;
                if (vm != null && vm is ValidationViewModelBase)
                {
                    vm.OnUnregister<object>(null);
                }
            };
        }

        /// <summary>
        /// 注销消息Messenger
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected virtual void Window_Unloaded(object sender, RoutedEventArgs e)
        {
            Messenger.Default.Unregister(this);
        }

        /// <summary>
        /// 窗体加载
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        public event OkCancelHandler OKCallback;
        public event OkCancelHandler CancelCallback;
        public event PropertyChangedEventHandler PropertyChanged;
        virtual internal protected void OnPropertyChanged(string propertyName)
        {
            if (this.PropertyChanged != null)
            {
                this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
        /// <summary>
        /// 确定返回时调用之前注册的回调接口
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public object OK(object obj)
        {
            if (OKCallback != null)
            {
               return OKCallback(this, obj);
            }
            return null;
        }

        /// <summary>
        /// 取消返回时调用之前注册的回调接口
        /// </summary>
        /// <param name="obj"></param>
        public void Cancel(object obj)
        {
            if (CancelCallback != null)
            {
                CancelCallback(this, obj);
            }
        }
        /// <summary>
        /// 关闭事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected virtual void closeButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
            e.Handled = true;
        }
    }
}