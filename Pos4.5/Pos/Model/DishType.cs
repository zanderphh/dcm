using GalaSoft.MvvmLight;
using Lib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Model
{
    [Table("dishtype")]
    public class DishType : ObservableObject
    {
        [Column("dishtype_id")]
        public string Id { get; set; }
        [Column("dishtype")]
        public string Name { get; set; }
        [Column("displayorder",typeof(int))]
        public int Order { get; set; }
        [Column("hme_id")]
        public string HmeId { get; set; }
    }
}
