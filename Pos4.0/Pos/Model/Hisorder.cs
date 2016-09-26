using GalaSoft.MvvmLight;
using Lib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Model
{
    [Table("hisorder")]
    public class Hisorder : ObservableObject
    {
        [Column("hisorder_id")]
        public string HisorderId { get; set; }
        [Column("containordernos")]
        public string HmeOrderId { get; set; }
        [Column("userid")]
        public int HmeUserId { get; set; }
        [Column("tableId")]
        public int HmeTableId { get; set; }
        [Column("hme_id")]
        public string HmeFlowId { get; set; }
        public string Posname { get; set; }
        public string TableName { get; set; }
        public string Shift { get; set; }
        public DateTime OrderDate { get; set; }
        [Column("bill_date")]
        public DateTime BillDate { get; set; }

        [Column("personnumber",typeof(int))]
        public int PeopleNum { get; set; }
        public string Operatorname { get; set; }
        public string Waiter { get; set; }
        [Column("dish_amount")]
        public decimal DishAmount { get; set; }
        public decimal Roomfee { get; set; }
        public decimal Srvfee { get; set; }
        public decimal Amount { get; set; }
        [Column("discount_rate")]
        public decimal DiscountRate { get; set; }
        public decimal Discount { get; set; }
        [Column(Type=typeof(decimal))]
        public decimal PrepayAmount { get; set; }
        public decimal Shouldpay { get; set; }
        [Column("Free_Charge")]
        public decimal FreeCharge { get; set; }
        public decimal Yetpay { get; set; }
        //[Column("srv_rate")]
        //public decimal SrvRate { get; set; }
        public string Paytype { get; set; }
        [Column("all_discount")]
        public string AllDiscount { get; set; }
    }
}
