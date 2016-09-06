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
    public class HisorderService : IDataService
    {
        public List<Hisorder> GetList()
        {
            string sql = "select * from hisorder";
            DataTable dt = OdbcTool.ExecuteDataTable(sql);
            dt.TableName = "hisorder";
            List<Hisorder> list = dt.ToEntityList<Hisorder>();
            return list;
        }
        public Hisorder GetByHisorderId(string id)
        {
            Hisorder o = new Hisorder();
            string sql = "select * from hisorder where hisorder_id = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql, id);
            dt.TableName = "hisorder";
            o = dt.ToEntity<Hisorder>();
            return o;
        }

        public Hisorder GetByTablename(string tablename)
        {
            string sql = "select * from hisorder where tablename = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql,tablename);
            dt.TableName = "hisorder";
            Hisorder o = dt.ToEntity<Hisorder>();
            return o;
        }
        public List<Hisorder> GetListByDateRange(DateTime start,DateTime end)
        {
            string sql = "select * from hisorder where date(bill_date) between ? and ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql,start,end);
            dt.TableName = "hisorder";
            List<Hisorder> list = dt.ToEntityList<Hisorder>();
            return list;
        }
    }
}
