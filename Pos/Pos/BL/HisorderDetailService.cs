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
    public class HisorderDetailService : IDataService
    {
        public List<HisorderDetail> GetListByHisorderId(string id)
        {
            List<HisorderDetail> list = new List<HisorderDetail>();
            string sql = "select * from hisorderdetail where hisorder_id = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql, id);
            dt.TableName = "hisorderdetail";
            list = dt.ToEntityList<HisorderDetail>();
            return list;
        }
    }
}
