using GalaSoft.MvvmLight;
using Lib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Model
{
    [Table("dish")]
    public class Dish : ObservableObject
    {
        [Column("dish_id")]
        public string ID { get; set; }
        [Column("dishname")]
        public string Name { get; set; }
        [Column("dishtype_id")]
        public string TypeId { get; set; }
        [Column("dishtype")]
        public string TypeName { get; set; }
        [Column("unit")]
        public string Unit { get; set; }
        public decimal Price { get; set; }
        [Column("vip_price")]
        public decimal VipPrice { get; set; }
        public string Py { get; set; }
        [Column("dish_index")]
        public int Order { get; set; }
        public string Discountable { get; set; }
    }

}

