using System.Windows;
using Pos.ViewModel;
using System.Data;
using System.Data.Odbc;
using Lib;
using Pos.BL;
using Pos.Model;
using System.Collections.Generic;
using Pos.View;
using Pos.Utils;

namespace Pos
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        /// <summary>
        /// Initializes a new instance of the MainWindow class.
        /// </summary>
        public MainWindow()
        {
            InitializeComponent();
            Closing += (s, e) => ViewModelLocator.Cleanup();
        }
        string sql = "";
        private void Select_Click(object sender, RoutedEventArgs e)
        {
            List<Dish> a = new DishService().GetList();
            List<DishType> b = new DishTypeService().GetList();
            List<Curorder> c = new CurorderService().GetList();
            List<CurorderDetail> d = new CurorderDetailService().GetByCurorderId(c[0].CurorderId);
            List<Hisorder> g = new HisorderService().GetList();
            List<HisorderDetail> f = new HisorderDetailService().GetListByHisorderId(g[0].HisorderId);
            MessageBox.Show("OK");
        }

        private void Update_Click(object sender, RoutedEventArgs e)
        {
            sql = "select * from uoption where opt_id = ?";
            OdbcCommand cmd;
            DataTable dr = OdbcTool.ExecuteDataTable(sql, out cmd, "900002");
            dr.Rows[0]["note"] = "csj1";
            int rtn = OdbcTool.UpdateDataTable(dr, cmd);
            MessageBox.Show(rtn.ToString());
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            sql = "select * from uoption where opt_id = ?";
            OdbcCommand cmd;
            DataTable dr = OdbcTool.ExecuteDataTable(sql, out cmd, "900003");
            dr.Rows[0].Delete();
            int rtn = OdbcTool.UpdateDataTable(dr, cmd);
            MessageBox.Show(dr.Rows.Count.ToString());
            MessageBox.Show(rtn.ToString());
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            LoginWindow login = new LoginWindow();
            login.CancelCallback += Login_CancelCallback;
            login.ShowDialog();
        }

        private object Login_CancelCallback(object sender, object para)
        {
            return new MsgArgs(-1);
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            (new OrderWindow()).Show();
        }

        private void button2_Click(object sender, RoutedEventArgs e)
        {
            CheckOutWindow check = new CheckOutWindow(null);
            check.ShowDialog();
        }
    }
}