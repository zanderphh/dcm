using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Reflection;

namespace TestLib
{
    [Table("Student", Tel = "ew")]
    public class SampleClass
    {
        [Column("Age", typeof(int))]
        public int MyAge { get; set; }

    }
    public class TestAttr
    {
        public void Test()
        {
            SampleClass ta = new SampleClass();
            Type type = ta.GetType();
            GetTableName(type);

            PropertyInfo[] propertys = type.GetProperties(BindingFlags.Public | BindingFlags.Instance);
            FieldInfo[] fields = type.GetFields(BindingFlags.Public | BindingFlags.Instance);

            foreach (PropertyInfo p in propertys)
            {
                //此处用了PropertyInfo.GetCustomAttributes方法，该方法继承至MemberInfo
                object[] objs = p.GetCustomAttributes(false);
                foreach (object obj in objs)
                {
                    object Value = "abc";
                    //string PK = GetPrimaryKey(obj);
                    string ColumnName = GetColumnName(obj);
                    Type t = GetColumnType(obj);
                    p.SetValue(ta, Value);
                    Console.WriteLine(ta.MyAge);
                }
            }
        }

        public static string GetTableName(Type classType)
        {
            string strTableName = string.Empty;
            string strEntityName = string.Empty;
            string strTableTel = string.Empty;

            strEntityName = classType.FullName;//类的全名




            //此处用了System.Type.GetCustomAttributes 方法，该方法继承至MemberInfo

            object classAttr = classType.GetCustomAttributes(false)[0];

            if (classAttr is TableAttribute)
            {
                TableAttribute tableAttr = classAttr as TableAttribute;
                strTableName = tableAttr.Name;
                strTableTel = tableAttr.Tel;
            }
            if (string.IsNullOrEmpty(strTableName))
            {
                throw new Exception("实体类:" + strEntityName + "的属性配置[Table(name=\"tablename\")]错误或未配置");
            }
            if (string.IsNullOrEmpty(strTableTel))
            {
                throw new Exception("实体类:" + strEntityName + "的属性配置[Table(tel=\"telname\")]错误或未配置");
            }

            return strTableName;
        }

        public static string GetPrimaryKey(object attribute)
        {
            string strPrimary = string.Empty;
            IdAttribute attr = attribute as IdAttribute;
            switch (attr.Strategy)
            {
                case GenerationType.INDENTITY:
                    break;
                case GenerationType.SEQUENCE:
                    strPrimary = System.Guid.NewGuid().ToString();
                    break;
                case GenerationType.TABLE:
                    break;
            }

            return strPrimary;
        }

        public static string GetColumnName(object attribute)
        {
            string columnName = string.Empty;
            if (attribute is ColumnAttribute)
            {
                ColumnAttribute columnAttr = attribute as ColumnAttribute;
                columnName = columnAttr.Name;
            }
            else if (attribute is IdAttribute)
            {
                IdAttribute idAttr = attribute as IdAttribute;
                columnName = idAttr.Name;
            }

            return columnName;
        }

        public static Type GetColumnType(object attribute)
        {
            Type columnType = null;
            if (attribute is ColumnAttribute)
            {
                ColumnAttribute columnAttr = attribute as ColumnAttribute;
                columnType = columnAttr.ColType;
            }
            return columnType;
        }
    }

    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = false)]
    public class TableAttribute : Attribute
    {
        public TableAttribute()
        {
        }
        public TableAttribute(string name)
        {
            _Name = name;
        }

        private string _Name = string.Empty;
        public string Name
        {
            get { return _Name; }
            set { _Name = value; }
        }

        private string _Tel = string.Empty;
        public string Tel
        {
            get { return _Tel; }
            set { _Tel = value; }
        }
    }

    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property, AllowMultiple = false, Inherited = false)]
    public class IdAttribute : Attribute
    {
        private string _Name = string.Empty;
        private int _Strategy = GenerationType.INDENTITY;

        public string Name
        {
            get { return _Name; }
            set { _Name = value; }
        }

        public int Strategy
        {
            get { return _Strategy; }
            set { _Strategy = value; }
        }
    }

    public class GenerationType
    {
        public const int INDENTITY = 1;//自动增长
        public const int SEQUENCE = 2;//序列
        public const int TABLE = 3;//TABLE

        private GenerationType() { }//私有构造函数，不可被实例化对象
    }

    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property,
        AllowMultiple = false, Inherited = false)]
    public class ColumnAttribute : Attribute
    {
        public ColumnAttribute() { }
        public ColumnAttribute(string name, Type type)
        {
            _Name = name;
            _ColType = type;
        }

        private string _Name = string.Empty;//列名   
        private Type _ColType = null;//列类型     
        private bool _IsUnique = false;//是否唯一        
        private bool _IsNull = true;//是否允许为空
        private bool _IsInsert = true;//是否插入到表中
        private bool _IsUpdate = true;//是否修改到表中

        public string Name
        {
            get { return _Name; }
            set { _Name = value; }
        }

        public bool IsUnique
        {
            get { return _IsUnique; }
            set { _IsUnique = value; }
        }

        public bool IsNull
        {
            get { return _IsNull; }
            set { _IsNull = value; }
        }

        public bool IsInsert
        {
            get { return _IsInsert; }
            set { _IsInsert = value; }
        }

        public bool IsUpdate
        {
            get { return _IsUpdate; }
            set { _IsUpdate = value; }
        }
        public Type ColType
        {
            get { return _ColType; }
            set { _ColType = value; }
        }
    }
}
