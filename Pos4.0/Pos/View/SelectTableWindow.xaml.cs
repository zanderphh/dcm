using Lib;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Pos.View
{
    /// <summary>
    /// TableNameSelectWindowxaml.xaml 的交互逻辑
    /// </summary>
    public partial class SelectTableWindow// : BaseWindow
    {
        DataTable dt = null;
        public SelectTableWindow()
        {
            InitializeComponent();
            init();
        }
        void init()
        {
            string sql = "select table_id,tablename from tables order by table_id";
            dt = OdbcTool.ExecuteDataTable(sql);
            list.ItemsSource = dt.DefaultView;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if(list.SelectedIndex <0)
            {
                MessageBox.Show("请选择收银台");
                return;
            }
            OK(dt.Rows[list.SelectedIndex]["tablename"]);
            DialogResult = true;
            Close();
        }
    }
}
