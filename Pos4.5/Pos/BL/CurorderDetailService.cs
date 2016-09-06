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
    public class CurorderDetailService : IDataService
    {
        public List<CurorderDetail> GetByCurorderId(string id)
        {
            List<CurorderDetail> list = new List<CurorderDetail>();
            string sql = "select * from curorderdetail where Curorder_id = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql, id);
            dt.TableName = "curorderdetail";
            list = dt.ToEntityList<CurorderDetail>();
            return list;
        }
    }
}
