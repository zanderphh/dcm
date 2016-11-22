using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Windows.Interactivity;

namespace Lib
{
    public class EventInfo<TEventArgsType>
    {
        public object Sender { get; set; }
        public TEventArgsType EventArgs { get; set; }
        public object CommandArgument { get; set; }
    }
    public class EventCommand : MapEventToCommandBase<EventArgs>
    {
    }

    public class RoutedEventCommand : MapEventToCommandBase<RoutedEventArgs>
    {
    }

    public abstract class MapEventToCommandBase<TEventArgsType> : TriggerAction<FrameworkElement>
        where TEventArgsType : EventArgs
    {
        public static readonly DependencyProperty CommandProperty = DependencyProperty.Register("Command", typeof(ICommand), typeof(MapEventToCommandBase<TEventArgsType>), new PropertyMetadata(null, OnCommandPropertyChanged));
        public static readonly DependencyProperty CommandParameterProperty = DependencyProperty.Register("CommandParameter", typeof(object), typeof(MapEventToCommandBase<TEventArgsType>), new PropertyMetadata(null, OnCommandParameterPropertyChanged));

        private static void OnCommandParameterPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var invokeCommand = d as MapEventToCommandBase<TEventArgsType>;
            if (invokeCommand != null)
            {
                invokeCommand.SetValue(CommandParameterProperty, e.NewValue);
            }
        }

        private static void OnCommandPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var invokeCommand = d as MapEventToCommandBase<TEventArgsType>;
            if (invokeCommand != null)
            {
                invokeCommand.SetValue(CommandProperty, e.NewValue);
            }
        }

        protected override void Invoke(object parameter)
        {
            if (this.Command == null)
            {
                return;
            }

            var eventInfo = new EventInfo<TEventArgsType>
            {
                EventArgs = parameter as TEventArgsType,
                Sender = this.AssociatedObject,
                CommandArgument = GetValue(CommandParameterProperty)
            };

            if (this.Command.CanExecute(eventInfo))
            {
                this.Command.Execute(eventInfo);
            }
        }

        public ICommand Command
        {
            get
            {
                return (ICommand)base.GetValue(CommandProperty);
            }
            set
            {
                base.SetValue(CommandProperty, value);
            }
        }

        public object CommandParameter
        {
            get
            {
                return base.GetValue(CommandParameterProperty);
            }
            set
            {
                base.SetValue(CommandParameterProperty, value);
            }
        }
    }
}
