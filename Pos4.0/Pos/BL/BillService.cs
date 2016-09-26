using Lib;
using Pos.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utils;

namespace Pos.BL
{
    public class BillService : IDataService
    {
        public List<Bill> GetList()
        {
            string sql = "select * from bill";
            DataTable dt = OdbcTool.ExecuteDataTable(sql);
            dt.TableName = "bill";
            List<Bill> list = dt.ToEntityList<Bill>();
            return list;
        }
        public Bill GetByBillId(string id)
        {
            Bill o = new Bill();
            string sql = "select * from bill where bill_id = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql, id);
            o = dt.ToEntity<Bill>();
            return o;
        }

        public List<Bill> GetByHisorderId(string id)
        {
            string sql = "select * from bill where hisorder_id = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql,id);
            List<Bill> list = dt.ToEntityList<Bill>();
            return list;
        }

    }
}
