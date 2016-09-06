using GalaSoft.MvvmLight;
using Lib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Model
{
    [Table("Operator")]
    public class Operator : ObservableObject
    {
        [Column("operator_id")]
        public string Id { get; set; }
        [Column("operator_name")]
        public string Name { get; set; }
        [Column("password")]
        public string Pwd { get; set; }
        [Column("operator_num")]
        public string Num { get; set; }
    }
}
