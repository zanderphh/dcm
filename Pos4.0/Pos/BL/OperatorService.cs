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
    public class OperatorService : IDataService
    {
        public List<Operator> GetList()
        {
            string sql = "select * from operator";
            DataTable dt = OdbcTool.ExecuteDataTable(sql);
            dt.TableName = "operator";
            List<Operator> list = dt.ToEntityList<Operator>();
            return list;
        }
        public Operator GetById(string id)
        {
            Operator o = new Operator();
            string sql = "select * from operator where operator_id=?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql,id);
            dt.TableName = "operator";
            o = dt.ToEntity<Operator>();
            return o;
        }
    }
}
