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
    public class DishTypeService : IDataService
    {
        public List<DishType> GetList()
        {
            string sql = "select * from dishtype";
            DataTable dt = OdbcTool.ExecuteDataTable(sql);
            dt.TableName = "dishtype";
            List<DishType> list = dt.ToEntityList<DishType>();
            return list;
        }
        public DishType GetById(string id)
        {
            DishType o = new DishType();
            string sql = "select * from dishtype where dishtype_id = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql,id);
            dt.TableName = "dishtype"; 
            o = dt.ToEntity<DishType>();
            return o;
        }
        public DishType GetByName(string name)
        {
            DishType o = new DishType();
            string sql = "select * from dishtype where dishtype = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql, name);
            dt.TableName = "dishtype";
            o = dt.ToEntity<DishType>();
            return o;
        }
    }
}
