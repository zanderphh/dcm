using GalaSoft.MvvmLight.Command;
using System;

namespace Lib
{
    public class ViewCommand
    {
        public string Name { get; set; }
        public RelayCommand<object> Command { get; set; }
        public Action<object> Action { get; set; }

        public ViewCommand() : this(string.Empty) { }
        public ViewCommand(string name)
        {
            Name = name;
            Command = new RelayCommand<object>(arg => { if (Action != null) Action.Invoke(arg); });
        }
    }
}
