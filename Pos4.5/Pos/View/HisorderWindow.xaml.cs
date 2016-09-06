using Lib;
using Pos.BL;
using Pos.Model;
using Pos.ViewModel;
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
    /// 历史客单查询
    /// </summary>
    public partial class HisorderWindow : BaseWindow
    {
        List<Hisorder> HList;
        List<HisorderDetail> HDList;
        public HisorderWindow()
        {
            InitializeComponent();
            initData();
        }

        void initData()
        {
            HList = (new HisorderService()).GetListByDateRange(DateTime.Today.AddDays(-1), DateTime.Today);
            HList = HList.OrderByDescending(p => p.HisorderId).ToList();
            grid_h.ItemsSource = HList;
            if (HList.Count > 0)
            {
                grid_h.SelectedIndex = 0;
            }
        }

        private void grid_d_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (grid_h.SelectedIndex < 0 || grid_h.SelectedIndex >= HList.Count) { return; }
            string hid = HList[grid_h.SelectedIndex].HisorderId;
            HDList = (new HisorderDetailService()).GetListByHisorderId(hid);
            grid_d.ItemsSource = HDList;
        }
        /// <summary>
        /// 打印历史结账单
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Print_Click(object sender, RoutedEventArgs e)
        {
            if (grid_h.SelectedIndex < 0 || grid_h.SelectedIndex >= HList.Count) { return; }
            string s = BillTemplate.GenerateHisorderBill(HList[grid_h.SelectedIndex], HDList);
            BillTemplate.PrintBill(s);
        }
    }
}
