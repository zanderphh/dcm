using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace Lib
{/// <summary>
/// UI操作工具类
/// </summary>
    public static class UITool
    {/// <summary>
     /// 获取控件模板子无素
     /// </summary>
     /// <typeparam name="T"></typeparam>
     /// <param name="obj"></param>
     /// <param name="name"></param>
     /// <returns></returns>
        public static T ControlTemplateFindElement<T>(Control obj, string name)
        {
            return (T)obj.Template.FindName(name, obj);

        }

        /// <summary>
        /// 获取控件错误模板子无素
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        /// <param name="name"></param>
        /// <returns></returns>
        public static T ErrorTemplateFindElement<T>(FrameworkElement obj, string name)
        {
            return (T)Validation.GetErrorTemplate(obj).FindName(name, obj);

        }
        /// <summary>
        /// 获取数据模板子无素
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        /// <param name="name"></param>
        /// <returns></returns>
        public static T DataTemplateFindElement<T>(ItemsControl obj, string name)
        {
            var item = obj.ItemContainerGenerator.ContainerFromItem(obj.Items.CurrentItem);
            ContentPresenter myContentPresenter = FindVisualChild<ContentPresenter>(item);
            DataTemplate myDataTemplate = myContentPresenter.ContentTemplate;
            T element = (T)myDataTemplate.FindName(name, myContentPresenter);
            return element;
        }
        /// <summary>
        /// 查找对应UI类别的子无素
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static T FindVisualChild<T>(DependencyObject obj)
            where T : DependencyObject
        {
            for (int i = 0; i < VisualTreeHelper.GetChildrenCount(obj); i++)
            {
                DependencyObject child = VisualTreeHelper.GetChild(obj, i);
                if (child != null && child is T)
                    return (T)child;
                else
                {
                    T childOfChild = FindVisualChild<T>(child);
                    if (childOfChild != null)
                        return childOfChild;
                }
            }
            return null;
        }
        /// <summary>
        /// 查找对应UI类别的父元素
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="element"></param>
        /// <returns></returns>
        public static T FindVisualParent<T>(UIElement element) where T : UIElement
        {
            UIElement parent = element;
            while (parent != null)
            {
                var correctlyTyped = parent as T;
                if (correctlyTyped != null)
                {
                    return correctlyTyped;
                }

                parent = VisualTreeHelper.GetParent(parent) as UIElement;
            }
            return null;
        }
        /// <summary>
        /// 获取鼠标所在位置的对应UI类别元素
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static T GetElementUnderMouse<T>() where T : UIElement
        {
            return FindVisualParent<T>(Mouse.DirectlyOver as UIElement);
        }
        /// <summary>
        /// 根据字符串返回对应的依懒属性
        /// </summary>
        /// <param name="fe"></param>
        /// <param name="propertyName"></param>
        /// <returns></returns>
        public static DependencyProperty TestCode(FrameworkElement fe, string propertyName)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(fe);
            PropertyDescriptor myProperty = properties[propertyName];
            if (myProperty == null) return null;
            DependencyPropertyDescriptor dpd = DependencyPropertyDescriptor.FromProperty(myProperty);
            if (dpd == null) return null;
            DependencyProperty dp = dpd.DependencyProperty;
            return dp;
        }
    }
    /// <summary>
    /// 文件操作工具类
    /// </summary>
    public static class FileTool
    {/// <summary>
     /// 从文件读取文本字符
     /// </summary>
     /// <param name="path"></param>
     /// <returns></returns>
        public static string ReadText(string path)
        {

            StreamReader sr = new StreamReader(path, Encoding.UTF8);
            string line;
            StringBuilder sb = new StringBuilder();
            while ((line = sr.ReadLine()) != null)
            {
                sb.Append(line.ToString());
            }
            return sb.ToString();
        }
        public static object FromPhoto(string photourl)
        {
            FileStream fs = new FileStream(photourl, FileMode.Open, FileAccess.Read);//创建FileStream对象，用于向BinaryReader写入字节数据流
            BinaryReader br = new BinaryReader(fs);//创建BinaryReader对象，用于写入下面的byte数组
            byte[] photo = br.ReadBytes((int)fs.Length);//新建byte数组，写入br中的数据
            br.Close();//记得要关闭br
            fs.Close();//还有fs
            return photo;
        }
        public static void CreatePhoto(string url, byte[] photo)
        {
            try
            {
                FileStream fs = new FileStream(url, FileMode.CreateNew); //创建FileStream对象，用于写入字节数据流
                fs.Write(photo, 0, photo.Length);//将byte数组中的数据写入fs
                fs.Close();//关闭fs
            }
            catch
            {
                throw;
            }
        }
    }
    /// <summary>
    /// Json工具类
    /// </summary>
    public class JsonTool
    {
        /// <summary>
        /// 将对象序列化为JSON格式
        /// </summary>
        /// <param name="o">对象</param>
        /// <returns>json字符串</returns>
        public static string SerializeObject(object o)
        {
            string json = JsonConvert.SerializeObject(o);
            return json;
        }

        /// <summary>
        /// 解析JSON字符串生成对象实体
        /// </summary>
        /// <typeparam name="T">对象类型</typeparam>
        /// <param name="json">json字符串(eg.{"ID":"112","Name":"石子儿"})</param>
        /// <returns>对象实体</returns>
        public static T DeserializeJsonToObject<T>(string json) where T : class
        {
            JsonSerializer serializer = new JsonSerializer();
            StringReader sr = new StringReader(json);
            object o = serializer.Deserialize(new JsonTextReader(sr), typeof(T));
            T t = o as T;
            return t;
        }

        /// <summary>
        /// 解析JSON数组生成对象实体集合
        /// </summary>
        /// <typeparam name="T">对象类型</typeparam>
        /// <param name="json">json数组字符串(eg.[{"ID":"112","Name":"石子儿"}])</param>
        /// <returns>对象实体集合</returns>
        public static List<T> DeserializeJsonToList<T>(string json) where T : class
        {
            JsonSerializer serializer = new JsonSerializer();
            StringReader sr = new StringReader(json);
            object o = serializer.Deserialize(new JsonTextReader(sr), typeof(List<T>));
            List<T> list = o as List<T>;
            return list;
        }

        /// <summary>
        /// 反序列化JSON到给定的匿名对象.
        /// </summary>
        /// <typeparam name="T">匿名对象类型</typeparam>
        /// <param name="json">json字符串</param>
        /// <param name="anonymousTypeObject">匿名对象</param>
        /// <returns>匿名对象</returns>
        public static T DeserializeAnonymousType<T>(string json, T anonymousTypeObject)
        {
            T t = JsonConvert.DeserializeAnonymousType(json, anonymousTypeObject);
            return t;
        }
    }
}
