﻿/// <summary>
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lib
        #region 数据导出至Excel文件
        /// <summary>

            if (dtData != null)
        /// <summary>

            if (dtData != null)
        /// <summary>

            if ((Table.TableName.Trim().Length == 0) || (Table.TableName.ToLower() == "table"))

            //数据表的列数
            int ColCount = Table.Columns.Count;

            //用于记数，实例化参数时的序号
            int i = 0;

            //创建参数
            OleDbParameter[] para = new OleDbParameter[ColCount];

            //创建表结构的SQL语句
            string TableStructStr = @"Create Table " + Table.TableName + "(";

            //连接字符串
            string connString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + ExcelFilePath + ";Extended Properties=Excel 8.0;";

            //创建表结构
            OleDbCommand objCmd = new OleDbCommand();

            //数据类型集合
            ArrayList DataTypeList = new ArrayList();

            //遍历数据表的所有列，用于创建表结构
            foreach (DataColumn col in Table.Columns)
                //如果列属于数字列，则设置该列的数据类型为double
                if (DataTypeList.IndexOf(col.DataType.ToString()) >= 0)

                    //如果是最后一列
                    if (i + 1 == ColCount)

                    //如果是最后一列
                    if (i + 1 == ColCount)

            //创建Excel文件及文件结构
            try

                if (objConn.State == ConnectionState.Closed)

            //插入记录的SQL语句
            string InsertSql_1 = "Insert into " + Table.TableName + " (";

            //遍历所有列，用于插入记录，在此创建插入记录的SQL语句
            for (int colID = 0; colID < ColCount; colID++)
                {

            InsertSql = InsertSql_1 + InsertSql_2;

            //遍历数据表的所有数据行
            for (int rowID = 0; rowID < Table.Rows.Count; rowID++)
        /// <summary>

            //如果数据列数大于表的列数，取数据表的所有列
            if (Columns.Count > Table.Columns.Count)
                }

            //遍历所有的数据列，如果有数据列的数据类型不是 DataColumn，则将它移除
            DataColumn column = new DataColumn();

            //数据表的列数
            int ColCount = Columns.Count;

            //创建参数
            OleDbParameter[] para = new OleDbParameter[ColCount];

            //创建表结构的SQL语句
            string TableStructStr = @"Create Table " + Table.TableName + "(";

            //连接字符串
            string connString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + ExcelFilePath + ";Extended Properties=Excel 8.0;";

            //创建表结构
            OleDbCommand objCmd = new OleDbCommand();

            //数据类型集合
            ArrayList DataTypeList = new ArrayList();

            DataColumn col = new DataColumn();

            //遍历数据表的所有列，用于创建表结构
            for (int k = 0; k < ColCount; k++)

                //列的数据类型是数字型
                if (DataTypeList.IndexOf(col.DataType.ToString().Trim()) >= 0)

                    //如果是最后一列
                    if (k + 1 == ColCount)

                    //如果是最后一列
                    if (k + 1 == ColCount)

            //创建Excel文件及文件结构
            try

                if (objConn.State == ConnectionState.Closed)

            //插入记录的SQL语句
            string InsertSql_1 = "Insert into " + Table.TableName + " (";

            //遍历所有列，用于插入记录，在此创建插入记录的SQL语句
            for (int colID = 0; colID < ColCount; colID++)
                {

            InsertSql = InsertSql_1 + InsertSql_2;

            //遍历数据表的所有数据行
            DataColumn DataCol = new DataColumn();
                    //因为列不连续，所以在取得单元格时不能用行列编号，列需得用列的名称
                    DataCol = (DataColumn)Columns[colID];
        #endregion
        /// <summary>

                    //获取数据表个数
                    int tablecount = dt.Rows.Count;
        /// <summary>

            //如果数据表名不存在，则数据表名为Excel文件的第一个数据表
            ArrayList TableList = new ArrayList();

            if (TableName.IndexOf(TableName) < 0)

            DataTable table = new DataTable();

            try
        /// <summary>

                    //获取列个数
                    int colcount = dt.Rows.Count;