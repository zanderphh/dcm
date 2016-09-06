using GalaSoft.MvvmLight;
using Lib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Model
{
    [Table("curorderdetail")]
    public class CurorderDetail : ObservableObject
    {
        [Column("Curorderdetail_id")]
        public string CurrderDetailId { get; set; }
        [Column("Curorder_id")]
        public string CurorderId { get; set; }
        [Column("dish_id")]
        public string DishId { get; set; }
        public string DishName { get; set; }
        public string DishType { get; set; }
        public string Unit { get; set; }

        private decimal quantity;
        public decimal Quantity
        {
            get
            {
                return quantity;
            }
            set
            {
                quantity = value;
                RaisePropertyChanged("Quantity");
            }
        }
        public decimal Price { get; set; }
        [Column("discount_rate")]
        public decimal DiscountRate { get; set; }
        [Column("after_discount")]
        public decimal AfterDiscount { get; set; }
        [Column("dishtype_id")]
        public string DishTypeId { get; set; }
        [Column("technician_name")]
        public string Waiter { get; set; }
        [Column("dish_time")]
        public DateTime DishTime { get; set; }
        [Column("dish_request")]
        public string DishRequest { get; set; }
        [Column("order_flag")]
        public string OrderFlag { get; set; }
        [Column("order_flag1")]
        public string OrderFlag1 { get; set; }
        [Column("kill_id")]
        public string KillId { get; set; }
        public string OrderType { get; set; }
        [Column("detailId")]
        public string HmeFlowId { get; set; }
        [Column("hme_upflag")]
        public string HmeUpFlag { get; set; }
    }
}
