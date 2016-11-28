using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace Lib
{
    public static class ListBoxExtiontion
    {
        public static bool IsUserVisible<T>(this ListBox listBox, T element) where T : FrameworkElement
        {
            if (!element.IsVisible)
                return false;
            ScrollViewer container = DragDropExtension.GetFirstVisualChild<ScrollViewer>(listBox);
            if (container == null)
                return false;
            var control = element as Control;
            Rect bounds =
                element.TransformToAncestor(container).TransformBounds(new Rect(0.0, 0.0, element.ActualWidth - 1, element.ActualHeight - 1));
            var rect = new Rect(0.0, 0.0, container.ActualWidth, container.ActualHeight);
            return rect.Contains(bounds.TopLeft) || rect.Contains(bounds.BottomRight);
        }
        public static List<T> GetVisibleItemsFromListbox<T>(this ListBox listBox) where T : FrameworkElement
        {
            var items = new List<T>();

            foreach (var item in listBox.Items)
            {
                if (listBox.IsUserVisible((T)listBox.ItemContainerGenerator.ContainerFromItem(item)))
                {
                    items.Add((T)listBox.ItemContainerGenerator.ContainerFromItem(item));
                }
                else if (items.Any())
                {
                    break;
                }
            }
            return items;
        }
    }
}
