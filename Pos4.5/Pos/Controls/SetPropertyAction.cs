using System.Reflection;
using System.Windows;

namespace Pos.Controls { 
    /// <summary>
    /// Sets the designated property to the supplied value. TargetObject
    /// optionally designates the object on which to set the property. If
    /// TargetObject is not supplied then the property is set on the object
    /// to which the trigger is attached.
    /// </summary>
    public class SetPropertyAction : System.Windows.Interactivity.TriggerAction<FrameworkElement>
    {
         // PropertyName DependencyProperty.

        /// <summary>
        /// The property to be executed in response to the trigger.
        /// </summary>
        public string Property
        {
            get { return (string)GetValue(PropertyProperty); }
            set { SetValue(PropertyProperty, value); }
        }

        public static readonly DependencyProperty PropertyProperty
            = DependencyProperty.Register("Property", typeof(string),
            typeof(SetPropertyAction));


        // PropertyValue DependencyProperty.

        /// <summary>
        /// The value to set the property to.
        /// </summary>
        public object Value
        {
            get { return GetValue(ValueProperty); }
            set { SetValue(ValueProperty, value); }
        }

        public static readonly DependencyProperty ValueProperty
            = DependencyProperty.Register("Value", typeof(object),
            typeof(SetPropertyAction));


        // TargetObject DependencyProperty.

        /// <summary>
        /// Specifies the object upon which to set the property.
        /// </summary>
        public object Target
        {
            get { return GetValue(TargetProperty); }
            set { SetValue(TargetProperty, value); }
        }

        public static readonly DependencyProperty TargetProperty
            = DependencyProperty.Register("Target", typeof(object),
            typeof(SetPropertyAction));


        // Private Implementation.

        protected override void Invoke(object parameter)
        {
            object target = Target ?? AssociatedObject;
            PropertyInfo propertyInfo = target.GetType().GetProperty(
                Property,
                BindingFlags.Instance | BindingFlags.Public
                | BindingFlags.NonPublic | BindingFlags.InvokeMethod);

            propertyInfo.SetValue(target, Value);
        }
    }
}
