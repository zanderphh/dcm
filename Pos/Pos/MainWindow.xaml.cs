using System.Windows;
using Pos.ViewModel;
using Pos.DsTableAdapters;
using static Pos.Ds;
using System.Data;
using System.Data.Odbc;
using Lib;

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
            string str = "";
            sql = "select * from uoption";
            DataSet ds = OdbcTool.ExecuteDataSet(sql);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
                {
                    str += dr[i].ToString();
                }
                str += "\n";
            }
            MessageBox.Show(str);
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
    }
}