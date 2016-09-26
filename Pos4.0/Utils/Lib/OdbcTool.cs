﻿using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using System.Data.Odbc;
using System.Windows;

namespace Lib
{
    public abstract class OdbcTool
    {
        private const char HOLD_CHAR = ':';
        private const char REPLACE_CHAR = '?';
        private static string connStr = "dsn=hmeodbc;uid=dba;pwd=hmemob";
        public static string ConnStr { get { return connStr; } set { connStr = value; } }
        public static int ExecuteSql(string sqlstr)
        {
            return ExecuteSql(sqlstr, null);
        }
        public static int ExecuteSql(string sqlstr, params object[] commandParameters)
        {
            using (OdbcConnection conn = new OdbcConnection(ConnStr))
            {
                try
                {
                    OdbcCommand cmd = conn.CreateCommand();
                    PrepareCommand(cmd, conn, null, CommandType.Text, sqlstr, commandParameters);
                    int val = cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    conn.Close();
                    return val;
                }
                catch (Exception e)
                {
                    conn.Dispose();
                    throw e;
                }
            }
        }
        internal static int ExecuteSqlUsingTrans(string sqlstr, OdbcTransaction tran, params object[] commandParameters)
        {
            try
            {
                OdbcCommand cmd = tran.Connection.CreateCommand();
                PrepareCommand(cmd, tran.Connection, tran, CommandType.Text, sqlstr, commandParameters);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }
            catch (Exception e)
            {
                tran.Rollback();
                tran.Dispose();
                if (tran.Connection != null)
                    tran.Connection.Dispose();
                throw e;
            }
        }
        public static DataSet ExecuteDataSet(string sqlstr)
        {
            return ExecuteDataSet(sqlstr, null);
        }
        public static DataSet ExecuteDataSet(string sqlstr, params object[] commandParameters)
        {
            using (OdbcConnection conn = new OdbcConnection(ConnStr))
            {
                try
                {
                    OdbcCommand cmd = conn.CreateCommand();
                    PrepareCommand(cmd, conn, null, CommandType.Text, sqlstr, commandParameters);
                    OdbcDataAdapter adapter = new OdbcDataAdapter();
                    adapter.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    adapter.Fill(ds);
                    cmd.Parameters.Clear();
                    conn.Close();
                    return ds;
                }
                catch (Exception e)
                {
                    conn.Dispose();
                    throw e;
                }
            }
        }
        public static DataTable ExecuteDataTable(string sqlstr)
        {
            return ExecuteDataTable(sqlstr, null);
        }
        public static DataTable ExecuteDataTable(string sqlstr, params object[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(sqlstr, commandParameters);
            return ds == null ? null : ds.Tables[0];
        }

        public static DataTable ExecuteDataTable(string sqlstr, out OdbcCommand cmd, params object[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(sqlstr, commandParameters);
            cmd = GetCommand(sqlstr, commandParameters);
            return ds == null ? null : ds.Tables[0];
        }

        public static OdbcDataReader ExecuteReader(string sqlstr)
        {
            return ExecuteReader(sqlstr, null);
        }
        public static OdbcDataReader ExecuteReader(string sqlstr, params object[] commandParameters)
        {
            using (OdbcConnection conn = new OdbcConnection(ConnStr))
            {
                try
                {
                    OdbcCommand cmd = conn.CreateCommand();
                    PrepareCommand(cmd, conn, null, CommandType.Text, sqlstr, commandParameters);
                    OdbcDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    cmd.Parameters.Clear();
                    conn.Close();
                    return reader;
                }
                catch (Exception e)
                {
                    conn.Dispose();
                    throw e;
                }
            }
        }

        public static object ExecuteScalar(string sqlstr)
        {
            return ExecuteScalar(sqlstr, null);
        }
        public static object ExecuteScalar(string sqlstr, params object[] commandParameters)
        {
            using (OdbcConnection conn = new OdbcConnection(ConnStr))
            {
                try
                {
                    OdbcCommand cmd = conn.CreateCommand();
                    PrepareCommand(cmd, conn, null, CommandType.Text, sqlstr, commandParameters);
                    object val = cmd.ExecuteScalar();
                    cmd.Parameters.Clear();
                    conn.Close();
                    return val;
                }
                catch (Exception e)
                {
                    conn.Dispose();
                    throw e;
                }
            }
        }

        private static void PrepareCommand(OdbcCommand cmd, OdbcConnection conn, OdbcTransaction trans, CommandType cmdType, string cmdText, object[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
            {
                try
                {
                    conn.Open();
                }
                catch (Exception e)
                {
                    throw new Exception("连接数据库失败,请检查数据库是否启动\r\n"+e.Message);
                }
            }

            cmd.Connection = conn;
            if (trans != null)
                cmd.Transaction = trans;

            cmd.CommandType = cmdType;

            if (cmdParms != null)
            {
                List<OdbcParameter> list = GenSqlParms(ref cmdText, cmdParms);
                foreach (var item in list)
                {
                    cmd.Parameters.Add(item);
                }
            }
            cmd.CommandText = cmdText;
        }
        /// <summary>
        /// 更新数据表
        /// </summary>
        /// <param name="table"></param>
        /// <param name="cmd"></param>
        /// <returns></returns>
        public static Int32 UpdateDataTable(DataTable table, OdbcCommand cmd)
        {
            using (OdbcConnection conn = new OdbcConnection(ConnStr))
            {
                OdbcDataAdapter adapter = null;
                try
                {
                    cmd.Connection = conn;
                    adapter = new OdbcDataAdapter(cmd);
                    OdbcCommandBuilder commandBulider = new OdbcCommandBuilder(adapter);
                    commandBulider.ConflictOption = ConflictOption.CompareAllSearchableValues;
                    conn.Open();
                    adapter.SelectCommand.Transaction = conn.BeginTransaction();/////////////////开始事务 
                    int rtn = adapter.Update(table);
                    adapter.SelectCommand.Transaction.Commit();/////提交事务 
                    return rtn;
                }
                catch (Exception ex)
                {
                    if (adapter.SelectCommand != null && adapter.SelectCommand.Transaction != null)
                    {
                        adapter.SelectCommand.Transaction.Rollback();
                    }
                    throw ex;
                }
                finally
                {
                    conn.Close();
                    conn.Dispose();
                }
            }
        }

        internal static Int32 UpdateDataTableUsingTrans(DataTable table, OdbcTransaction tran, OdbcCommand cmd)
        {
            OdbcDataAdapter adapter = null;
            try
            {
                cmd.Connection = tran.Connection;
                cmd.Transaction = tran;
                adapter = new OdbcDataAdapter(cmd);
                OdbcCommandBuilder commandBulider = new OdbcCommandBuilder(adapter);
                commandBulider.ConflictOption = ConflictOption.CompareAllSearchableValues;
                int rtn = adapter.Update(table);
                return rtn;
            }
            catch (Exception ex)
            {
                tran.Rollback();
                tran.Dispose();
                if (tran.Connection != null)
                    tran.Connection.Dispose();
                throw ex;
            }
        }

        private static List<OdbcParameter> GetSqlParms(ref string cmdText, params object[] objs)
        {
            int index = 0;
            int pos = 0, pos2;
            string key;
            string sqlstr = cmdText;
            List<string> keys = new List<string>();
            sqlstr = sqlstr.Replace(';', ',');
            sqlstr = sqlstr.Replace(')', ',');

            pos = sqlstr.IndexOf(REPLACE_CHAR, pos);
            while (pos != -1)
            {
                pos2 = sqlstr.IndexOf(',', pos);
                if (pos2 < 0)
                {
                    key = sqlstr.Substring(pos + 1);
                }
                else
                {
                    key = sqlstr.Substring(pos + 1, pos2 - pos - 1);
                }
                if (key.Trim() == string.Empty)
                {
                    index++;
                    keys.Add(index.ToString());
                    sqlstr = sqlstr.Insert(pos + 1, index.ToString());
                    cmdText = cmdText.Insert(pos + 1, index.ToString());
                }
                pos = sqlstr.IndexOf(REPLACE_CHAR, pos + 1);
            }
            if (keys.Count != objs.Length)
            {
                throw new Exception("SQL参数列表数量错误");
            }
            List<OdbcParameter> list = new List<OdbcParameter>();
            for (int i = 0; i < keys.Count; i++)
            {
                list.Add(new OdbcParameter(keys[i].Trim(), objs[i]));
            }
            return list;
        }
        private static List<OdbcParameter> GenSqlParms(ref string cmdText, params object[] objs)
        {
            int pos = 0, index = 0;
            List<string> keys = new List<string>();
            pos = cmdText.IndexOf(REPLACE_CHAR);
            while (pos != -1)
            {
                index++;
                keys.Add("p" + index.ToString());
                cmdText = cmdText.Insert(pos + 1, HOLD_CHAR + "p" + index.ToString());
                cmdText = cmdText.Remove(pos, 1);
                pos = cmdText.IndexOf(REPLACE_CHAR);
            }
            if (keys.Count != objs.Length)
            {
                throw new Exception("SQL参数列表数量错误");
            }
            List<OdbcParameter> list = new List<OdbcParameter>();

            for (int i = 0; i < keys.Count; i++)
            {
                list.Add(new OdbcParameter(keys[i].Trim(), objs[i]));
            }
            return list;
        }
        public static OdbcCommand GetCommand(string sqlstr, params object[] commandParameters)
        {
            using (OdbcConnection conn = new OdbcConnection(ConnStr))
            {
                try
                {
                    OdbcCommand cmd = conn.CreateCommand();
                    PrepareCommand(cmd, conn, null, CommandType.Text, sqlstr, commandParameters);
                    cmd.Parameters.Clear();
                    conn.Close();
                    cmd.Connection.ConnectionString = conn.ConnectionString;//conn被释放后，cmd的连接字符串就被置空了
                    conn.Dispose();
                    return cmd;
                }
                catch (Exception e)
                {
                    conn.Dispose();
                    throw e;
                }
            }
        }

    }

    public class OdbcTransTool
    {
        private OdbcConnection conn;
        private OdbcConnection Conn
        {
            get { return conn; }
        }
        private OdbcTransaction tran;
        public OdbcTransTool() : this(OdbcTool.ConnStr) { }

        public OdbcTransTool(string connstr)
        {
            conn = new OdbcConnection(connstr);
        }
        public int ExecuteSqlUsingTrans(string sqlstr, params object[] commandParameters)
        {
            if (tran == null)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                tran = Conn.BeginTransaction();
            }
            return OdbcTool.ExecuteSqlUsingTrans(sqlstr, tran, commandParameters);
        }
        public int UpdateDataTableUsingTrans(DataTable table, OdbcCommand cmd)
        {
            if (tran == null)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                tran = Conn.BeginTransaction();
            }
            return OdbcTool.UpdateDataTableUsingTrans(table, tran, cmd);
        }
        public void Commit()
        {
            tran.Commit();
            if (tran.Connection != null)
                tran.Connection.Dispose();
        }
        public void RollBack()
        {
            tran.Rollback();
            if (tran.Connection != null)
                tran.Connection.Dispose();
        }
    }
}
