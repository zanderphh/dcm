using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;

namespace Utils.Lib
{
    public static class NotificationExtensions
    {
        //private static void OnPropertyChanged([CallerMemberName] string propertyName = "none passed")
        //{
        //}
        public static void Notify(this PropertyChangedEventHandler eventHandler, Expression<Func<object>> expression)
        {

            if (null == eventHandler)
            {
                return;
            }
            var lambda = expression as LambdaExpression;
            MemberExpression memberExpression;
            if (lambda.Body is UnaryExpression)
            {
                var unaryExpression = lambda.Body as UnaryExpression;
                memberExpression = unaryExpression.Operand as MemberExpression;
            }
            else
            {
                memberExpression = lambda.Body as MemberExpression;
            }
            var constantExpression = memberExpression.Expression as ConstantExpression;
            var propertyInfo = memberExpression.Member as PropertyInfo;

            foreach (var del in eventHandler.GetInvocationList())
            {
                del.DynamicInvoke(new object[] { constantExpression.Value, new PropertyChangedEventArgs(propertyInfo.Name) });
            }
        }
    }
}
