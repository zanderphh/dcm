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
    public class DishService : IDataService
    {
        public List<Dish> GetList()
        {
            string sql = "select * from dish";
            DataTable dt = OdbcTool.ExecuteDataTable(sql);
            List<Dish> list = dt.ToEntityList<Dish>();
            return list;
        }

        public List<Dish> GetListByTypeId(string typeid)
        {
            string sql = "select * from dish where dishtype_id = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql,typeid);
            List<Dish> list = dt.ToEntityList<Dish>();
            return list;
        }
        public Dish GetById(string id)
        {
            Dish o = new Dish();
            string sql = "select * from dish where dish_id = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql,id);
            o = dt.ToEntity<Dish>();
            return o;
        }
    }
}
