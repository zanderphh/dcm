using GalaSoft.MvvmLight;
using Lib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Model
{
    [Table("bill")]
    public class Bill: ObservableObject
    {
        [Column("bill_id")]
        public string BillId { get; set; }
        [Column("hisorder_id")]
        public string OrderId { get; set; }
        public string PayType { get; set; }
        [Column("pay_usage")]
        public string PayUsage { get; set; }
        public decimal RealPay { get; set; }
        public string Payee { get; set; }
        public DateTime PayDate { get; set; }
        public string is_statics { get; set; }
    }
}
