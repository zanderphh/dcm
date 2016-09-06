using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Lib;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;

namespace Pos.Utils
{
    public class DbTool
    {/// <summary>
     /// 获取数据库值
     /// </summary>
     /// <param name="key"></param>
     /// <returns></returns>
        public static string GetDbValue(string key)
        {
            if (string.IsNullOrEmpty(key))
            {
                return string.Empty;
            }
            string sql = "select note from uoption where opt_id= ?;";
            object value = OdbcTool.ExecuteScalar(sql, key);
            return value == null ? null : value.ToString();
        }

        /// <summary>
        /// 设置数据库值
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <returns></returns>

        public static bool SetDbValue(string key, string value)
        {
            if (string.IsNullOrEmpty(key) || string.IsNullOrEmpty(value))
            {
                return false;
            }
            string sql = "select count(*) from uoption where opt_id= ?;";
            int cnt = (int)OdbcTool.ExecuteScalar(sql, key);
            if (cnt < 1)
            {
                sql = "insert into uoption(opt_id,note) values(?,?);";
                cnt = (int)OdbcTool.ExecuteSql(sql, key, value);
            }
            else
            {
                sql = "update uoption set note = ? where opt_id = ?;";
                cnt = (int)OdbcTool.ExecuteSql(sql, value, key);
            }
            return cnt > 0;
        }
        /// <summary>
        /// 生成连续编码的流水号
        /// </summary>
        /// <param name="insName"></param>
        /// <param name="num"></param>
        /// <returns></returns>
        public static string GetFlowID(string prefix, int num = 1)
        {
            try
            {
                string sql = "UPDATE autoins	SET ins_number = string(cast(ins_number as numeric(10)) + ?) Where ins_id = ?";
                OdbcTool.ExecuteSql(sql, num, prefix);
                sql = "SELECT ins_number FROM autoins Where autoins.ins_id = ?";
                int x = int.Parse(OdbcTool.ExecuteSql(sql, prefix).ToString());
                if (x == 0)
                {
                    throw new Exception("流水号生成失败:" + prefix);
                }
                string str = "00000000" + x.ToString();
                return prefix + str.Substring(str.Length - 8, 8);
            }
            catch (Exception)
            {
                throw;
            }            
        }

        /// <summary>
        /// 检查权限
        /// </summary>
        /// <param name="operator_id"></param>
        /// <param name="function_id"></param>
        /// <returns></returns>
        public static bool CheckRight(String operator_id, String function_id)
        {
            string sql = "select count(*) as cnt "
                        + " from operator_group,operator_group_function "
                        + " where operator_group.group_id = operator_group_function.group_id "
                        + " and operator_id = ? and function_id = ?";
            int cnt = (int)OdbcTool.ExecuteScalar(sql, operator_id, function_id);
            return cnt > 0;
        }

        /// <summary>
        /// 获取服务器时间
        /// </summary>
        /// <returns></returns>
        public static DateTime GetServerTime()
        {
            string sql = "select getdate() as t from dinner";
            DateTime dt = (DateTime)OdbcTool.ExecuteScalar(sql);
            return dt;
        }
        /// <summary>
        /// 获取班次
        /// </summary>
        /// <returns></returns>
        public static String GetShift()
        {
            DateTime serverTime;
            serverTime = GetServerTime();
            string sql = "";
            sql = "SELECT shift_id,shift,time_start FROM shift Where time_start <= ? And time_end >= ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql, serverTime, serverTime);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0][1].ToString();
            }

            sql = "SELECT shift_id,shift,time_start "
                    + " FROM shift Where (SELECT Max(time_start) From shift ) <= ? And "
                    + " time_start = (SELECT Max(time_start) From shift )";

            dt = OdbcTool.ExecuteDataTable(sql, serverTime);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0][1].ToString();
            }
            sql = "SELECT shift_id,shift,time_start "
                    + " FROM shift Where (SELECT Min(time_end) From shift ) >= ? And "
                    + " time_end = (SELECT Min(time_end) From shift)";
            dt = OdbcTool.ExecuteDataTable(sql, serverTime);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0][1].ToString();
            }
            return "";
        }
    }
}
