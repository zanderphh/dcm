using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using Lib;
using Pos.BL;
using Pos.Model;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System;
using System.Globalization;
using System.Data;
using System.Data.Odbc;
using GalaSoft.MvvmLight.Messaging;
using Pos.Utils;
using System.Linq;
using System.Threading;
using System.Diagnostics;
using System.Text;

namespace Pos.ViewModel
{
    public class OrderViewModel : ValidationViewModelBase
    {
        string PayType = "现金";
        public OrderViewModel()
        {
            DishAndTypeList = new ObservableCollection<DishModel>();
            CurorderDetailList = new ObservableCollection<CurorderDetail>();
            initDishs();
        }
        public override void OnUnregister<T>(object obj)
        {
            base.OnUnregister<OrderViewModel>(null);
        }
        public int DishTypeSelectedIndex { get; set; }
        public int OrderedDishQty
        {
            get
            {
                var x = from a in CurorderDetailList select a.Quantity;
                return Convert.ToInt32(x.Sum());
            }
        }
        public decimal OrderedDishAmount
        {
            get
            {
                var x = from a in CurorderDetailList select a.Quantity * a.Price;
                decimal sum = x.Sum();
                decimal temp = sum - Math.Truncate(sum);
                return sum;
                return temp == (decimal)0.5 ? Math.Truncate(sum) + (decimal)0.5 : Math.Round(sum);
            }
        }

        private int orderedDishSelectedIndex;

        public int OrderedDishSelectedIndex
        {
            get { return orderedDishSelectedIndex; }
            set { Set("OrderedDishSelectedIndex", ref orderedDishSelectedIndex, value, true); }
        }

        #region Command
        private RelayCommand clearOrderedDishCommand;
        public RelayCommand ClearOrderedDishCommand
        {
            get
            {
                return clearOrderedDishCommand
                    ?? (clearOrderedDishCommand = new RelayCommand(
                    () =>
                    {
                        this.CurorderDetailList.Clear();
                        RaisePropertyChanged("OrderedDishQty");
                        RaisePropertyChanged("OrderedDishAmount");
                    }));
            }
        }

        private RelayCommand<EventInfo<RoutedEventArgs>> addDishCommand;
        public RelayCommand<EventInfo<RoutedEventArgs>> AddDishCommand
        {
            get
            {
                return addDishCommand
                    ?? (addDishCommand = new RelayCommand<EventInfo<RoutedEventArgs>>(
                    (obj) =>
                    {
                        ListBox lb = obj.EventArgs.Source as ListBox;
                        if (lb == null) return;
                        var item = UITool.GetElementUnderMouse<ListBoxItem>();
                        if (item == null) return;
                        DishType theType = DishAndTypeList[DishTypeSelectedIndex].DishType;
                        if (lb.SelectedIndex == -1)
                        {
                            return;
                        }
                        Dish theDish = DishAndTypeList[DishTypeSelectedIndex].DishList[lb.SelectedIndex];
                        var v = CurorderDetailList.Where(p => p.DishId == theDish.ID).ToList();
                        if (v.Count > 0)
                        {
                            OrderedDishSelectedIndex = CurorderDetailList.IndexOf(v[0]);
                            ModifyDishQty(OrderedDishSelectedIndex, 1);
                        }
                        else
                        {
                            CurorderDetail theDetail = CreateTheDish(theType, theDish);
                            CurorderDetailList.Add(theDetail);
                            RaisePropertyChanged("OrderedDishQty");
                            RaisePropertyChanged("OrderedDishAmount");
                            OrderedDishSelectedIndex = CurorderDetailList.Count - 1;
                        }
                        lb.SelectedIndex = orderedDishSelectedIndex;
                        Messenger.Default.Send(new MsgArgs() { MsgToken = "AddDish" }, MsgToken.OrderToken);
                        lb.SelectedIndex = -1;
                    }));
            }
        }

        private CurorderDetail CreateTheDish(DishType theType, Dish theDish)
        {
            CurorderDetail detail = new CurorderDetail();
            detail.DishId = theDish.ID;
            detail.DishName = theDish.Name;
            detail.DishTypeId = theType.Id;
            detail.DishType = theDish.TypeName;
            detail.DishTime = DateTime.Now;
            detail.DiscountRate = 1.00m;
            detail.AfterDiscount = theDish.Price;
            detail.OrderFlag = "0";
            detail.OrderFlag1 = "1";
            detail.OrderType = "2";//线上代表1，店内代表2
            detail.Price = theDish.Price;
            detail.Quantity = 1;
            detail.Unit = theDish.Unit;
            detail.Waiter = App.OperatorName;
            detail.DetailId = theDish.hme_id;
            return detail;
        }

        private Curorder CreateCurorder()
        {
            string id = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            Curorder order = new Curorder();
            order.AllDiscount = "0";
            order.Amount = OrderedDishAmount;
            order.CurorderId = "ZD" + id;
            order.Discount = 0;
            order.DiscountRate = 1.00m;
            order.DishAmount = OrderedDishAmount;
            order.FreeCharge = 0;
            order.HmeOrderId = "CRM" + App.ShopId + id;
            order.HmeUserId = 0;
            order.Operatorname = App.OperatorName;
            order.OrderDate = DateTime.Now;
            order.Paytype = PayType;
            order.PeopleNum = 0;
            order.Posname = "快餐厅";
            order.PrepayAmount = 0;
            order.Roomfee = 0;
            order.Shift = DbTool.GetShift();
            order.Shouldpay = OrderedDishAmount;
            order.Srvfee = 0.00m;
            order.SrvRate = 0.00m;
            order.TableName = App.TableName;
            order.HmeTableId = App.HmeTableId;
            order.Waiter = App.OperatorName;
            order.Yetpay = OrderedDishAmount;
            return order;
        }

        private RelayCommand<object> modifyQtyCommand;

        public RelayCommand<object> ModifyQtyCommand
        {
            get
            {
                return modifyQtyCommand
                    ?? (modifyQtyCommand = new RelayCommand<object>(
                    (obj) =>
                    {
                        int parm = Convert.ToInt32(obj);
                        ListBoxItem item = UITool.GetElementUnderMouse<ListBoxItem>();
                        if (item == null) return;
                        item.IsSelected = true;
                        ListBox lb = UITool.GetElementUnderMouse<ListBox>();
                        if (null == lb) return;
                        if (parm == -1 && CurorderDetailList[lb.SelectedIndex].Quantity >= 1)
                        {
                            ModifyDishQty(lb.SelectedIndex, -1);
                        }
                        else if (parm == 1)
                        {
                            ModifyDishQty(lb.SelectedIndex, 1);
                        }
                    }));
            }
        }

        private void ModifyDishQty(int index, decimal qty)
        {
            CurorderDetailList[index].Quantity += qty;
            if (CurorderDetailList[index].Quantity == 0)
            {
                CurorderDetailList.RemoveAt(index);
            }
            RaisePropertyChanged("OrderedDishQty");
            RaisePropertyChanged("OrderedDishAmount");
        }

        private RelayCommand checkOutCommand;
        /// <summary>
        /// 结账命令
        /// </summary>
        public RelayCommand CheckOutCommand
        {
            get
            {
                return checkOutCommand
                    ?? (checkOutCommand = new RelayCommand(
                    () =>
                    {
                        if (CurorderDetailList.Count < 1)
                        {
                            MessageBox.Show("你还未点菜！");
                            return;
                        }
                        bool? rtn = new CheckOutWindowFactory(OrderedDishAmount).CreateDialogWindow(DoCheckout);
                    }));
            }
        }

        /// <summary>
        /// 结账逻辑
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="para"></param>
        /// <returns></returns>
        private object DoCheckout(object sender, object para)
        {
            MsgArgs arg = para as MsgArgs;
            if (arg == null)
            {
                throw new Exception(string.Format("获取结账返回参数出错!"));
            }

            try
            {
                string PayCode = arg.Extra["PayCode"].ToString();
                PayType = arg.Extra["PayType"].ToString();
                int PayChannel = int.Parse(arg.Extra["PayChannel"].ToString());
                Curorder order = CreateCurorder();
                int index = 0;
                foreach (var item in CurorderDetailList)
                {
                    item.CurorderId = order.CurorderId;
                    item.CurrderDetailId = "MX" + DateTime.Now.ToString("yyMMddHHmmss") + (++index).ToString("000");
                }
                CurorderService service = new CurorderService();
                //添加账单及付款请求
                service.AddOrder(order, CurorderDetailList, PayChannel, PayCode);
                //生成结账单字符串
                string str = BillTemplate.GenerateBill(order, CurorderDetailList, PayType);

                Application.Current.Dispatcher.Invoke(new Action(() =>
                {
                    CurorderDetailList.Clear();
                    RaisePropertyChanged("OrderedDishQty");
                    RaisePropertyChanged("OrderedDishAmount");
                }
                ));
                return new MsgArgs(MsgCode.Succ) { Content = str };
            }
            catch (Exception e)
            {
                return new MsgArgs(MsgCode.Faild, e.Message);
            }
        }


        private RelayCommand<int> dishTyeSelectionChangedCommand;

        public RelayCommand<int> DishTyeSelectionChangedCommand
        {
            get
            {
                return dishTyeSelectionChangedCommand
                    ?? (dishTyeSelectionChangedCommand = new RelayCommand<int>(
                    p =>
                    {
                        DishTypeSelectedIndex = p;
                    }));
            }
        }
        #endregion
        public ObservableCollection<DishModel> DishAndTypeList { get; set; }
        public ObservableCollection<CurorderDetail> CurorderDetailList { get; set; }

        void initDishs()
        {
            DishTypeService typeService = new DishTypeService();
            DishService dishService = new DishService();
            List<DishType> typeList = typeService.GetList();
            List<Dish> allDish = new List<Dish>();
            foreach (DishType type in typeList)
            {
                List<Dish> dishList = dishService.GetListByTypeId(type.Id);
                if (dishList != null)
                    allDish.AddRange(dishList);
                DishAndTypeList.Add(new DishModel { DishType = type, DishList = dishList });
            }
            DishType defautType = new DishType() { Id = "0", Name = "所有" };
            DishAndTypeList.Insert(0, new DishModel() { DishType = defautType, DishList = allDish });
        }
    }

    public class DishModel : ValidationViewModelBase
    {
        private DishType dishType;

        public DishType DishType
        {
            get { return dishType; }
            set
            {
                Set("DishType", ref dishType, value, true);
            }
        }

        private List<Dish> dishList;

        public List<Dish> DishList
        {
            get { return dishList; }
            set
            {
                Set("DishList", ref dishList, value, true);
            }
        }
    }
    public class SelectedItemToListConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is DishModel)
            {
                return ((DishModel)value).DishList;
            }
            return null;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}