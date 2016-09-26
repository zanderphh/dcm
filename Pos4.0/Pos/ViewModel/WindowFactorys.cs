using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pos.View;
using Pos.Utils;

namespace Pos.ViewModel
{
    public class CheckOutWindowFactory:BaseWindowFactory
    {
        decimal Amount;
        public CheckOutWindowFactory(decimal amount)
        {
            Amount = amount;
        }
        protected override BaseWindow GetWindow()
        {
            MsgArgs arg = new MsgArgs() { Content = Amount.ToString() };
            CheckOutWindow w = new CheckOutWindow(arg);
            w.Owner = App.Current.MainWindow;
            return w;
        }
    }
    public class OrderWindowFactory : BaseWindowFactory
    {
        protected override BaseWindow GetWindow()
        {
            return new OrderWindow();
        }
    }
}
