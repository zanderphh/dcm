using Lib;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using TestLib;

namespace ConsoleApplicationTest
{
    class Teacher
    {
        public string name { get; set; }
        public List<Student> stus;
    }
    class Student
    {
        public int age { get; set; }
        public string name;
    }
    class Program
    {
        public delegate void PrintDelegate(string s);
        public static void Print(string s)
        {
            Console.WriteLine("当前线程：" + s);
            Thread.Sleep(5000);
        }
        //回调方法要求
        //1.返回类型为void
        //2.只有一个参数IAsyncResult
        public static void PrintComeplete(IAsyncResult result)
        {
            (result.AsyncState as PrintDelegate).EndInvoke(result);
            Console.WriteLine("当前线程结束." + result.AsyncState.ToString());
        }

        public static void Main()
        {
            try
            {
                TestDelegate();
                //testAttr();
                //testODBCDataSet();
                //testMySqlDataSet();
                //testJson();
                //testMysql();
                //testOdbc();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            Console.WriteLine("Press any key to continue...");
            Console.Read();
        }

        static void TestDelegate()
        {
            PrintDelegate printDelegate = Print;
            Console.WriteLine("主线程.");
            printDelegate.BeginInvoke("Hello world.", PrintComeplete, printDelegate);
            Console.WriteLine("主线程继续执行...");

            Console.WriteLine("Press any key to continue...");
            Console.ReadKey(true);
        }

        static void testAttr()
        {
            TestAttr ta = new TestAttr();
            ta.Test();
        }
        static void testOdbc()
        {
            string sql; int rtn = 0;
            sql = "select * from bill where bill_id = ?";
            DataSet ds = OdbcTool.ExecuteDataSet(sql, "PT00000001");
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
                {
                    Console.Write(item[i].ToString().PadLeft(10, ' '));
                }
                Console.WriteLine(Environment.NewLine);
            }
        }

        static void testMysql()
        {
            string sql; int rtn = 0;
            sql = "insert into person(name,age)values(?,?)";
            MySqlTransTool t = new MySqlTransTool();
            rtn = t.ExecuteSqlUsingTrans(sql, new object[] { "Sb", 17 });
            Console.WriteLine(rtn);

            sql = "delete from person where id = ?";
            rtn = t.ExecuteSqlUsingTrans(sql, 12);
            Console.WriteLine(rtn);
            t.Commit();
            sql = "select * from person";
            DataSet ds = MySqlTool.ExecuteDataSet(sql);
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
                {
                    Console.Write(item[i].ToString().PadLeft(10, ' '));
                }
                Console.WriteLine(Environment.NewLine);
            }

            Console.WriteLine("Now Save File...");
            sql = "update person set photo = ? where ID = ?";
            object photo = FromPhoto(@"d:\test.png");
            rtn = MySqlTool.ExecuteSql(sql, new object[] { photo, 1 });
            Console.WriteLine("Set photo return {0}", rtn);

            Console.WriteLine(@"Now Create File...");
            sql = "select photo from person where ID = ?";
            photo = MySqlTool.ExecuteScalar(sql, new object[] { 1 });
            CreatePhoto(@"d:\test_copy.png", (byte[])photo);
        }

        public static byte[] FromPhoto(string photourl)
        {
            FileStream fs = new FileStream(photourl, FileMode.Open, FileAccess.Read);//创建FileStream对象，用于向BinaryReader写入字节数据流
            BinaryReader br = new BinaryReader(fs);//创建BinaryReader对象，用于写入下面的byte数组
            byte[] photo = br.ReadBytes((int)fs.Length);//新建byte数组，写入br中的数据
            br.Close();//记得要关闭br
            fs.Close();//还有fs
            return photo;
        }
        public static void CreatePhoto(string url, byte[] photo)
        {
            try
            {
                FileStream fs = new FileStream(url, FileMode.CreateNew); //创建FileStream对象，用于写入字节数据流
                fs.Write(photo, 0, photo.Length);//将byte数组中的数据写入fs
                fs.Close();//关闭fs
            }
            catch
            {
                throw;
            }
        }

        public static void testJson()
        {
            //序列化对象
            Teacher t = new Teacher();
            t.name = "zs";
            t.stus = new List<Student>() { new Student() { name = "a", age = 1 }, new Student() { name = "a", age = 1 }, new Student() { name = "a", age = 1 } };
            string str = JsonTool.SerializeObject(t);
            p(str);

            //Json数组操作
            JObject root = new JObject();
            root.Add(new JProperty("Name", "zs"));
            JArray ar = new JArray();
            for (int i = 0; i < 5; i++)
            {
                JObject o = new JObject();
                o.Add(new JProperty(i.ToString(), (i * i).ToString()));
                o.Add(new JProperty(i.ToString() + "a", (i * i).ToString()));
                o.Add(new JProperty(i.ToString() + "b", (i * i).ToString()));
                ar.Add(o);
            }
            root.Add(new JProperty("detail", ar));
            p(root.ToString());


            JObject staff = new JObject();
            staff.Add(new JProperty("Name", "Jack"));
            staff.Add(new JProperty("Age", 33));
            staff.Add(new JProperty("Department", "Personnel Department"));
            staff.Add(new JProperty("Leader", new JObject(new JProperty("Name", "Tom"), new JProperty("Age", 44), new JProperty("Department", "Personnel Department"))));
            p(staff.ToString());

            string json = "{\"Name\" : \"Jack\", \"Age\" : 34, \"Colleagues\" : [{\"Name\" : \"Tom\" , \"Age\":44},{\"Name\" : \"Abel\",\"Age\":29}] }";
            /*获取该员工的姓名*/
            //将json转换为JObject
            JObject jObj = JObject.Parse(json);
            //通过属性名或者索引来访问，仅仅是自己的属性名，而不是所有的
            JToken ageToken = jObj["Age"];
            p(ageToken.ToString());

            /*获取该员工同事的所有姓名*/
            //将json转换为JObject
            jObj = JObject.Parse(json);
            var names = from staff1 in jObj["Colleagues"].Children()
                        select (string)staff1["Name"];
            foreach (var name1 in names)
                p(name1);


            var names1 = jObj["Colleagues"];
            var xxx = names1[1]["Name"];
            p(xxx.ToString());
            /*现在我们发现获取的json字符串中Jack的年龄应该为35*/
            //将json转换为JObject
            jObj = JObject.Parse(json);
            jObj["Age"] = 35;
            p(jObj.ToString());
            /*现在我们发现Jack的同事Tom的年龄错了，应该为45*/
            //将json转换为JObject
            jObj = JObject.Parse(json);
            JToken colleagues = jObj["Colleagues"];
            colleagues[0]["Age"] = 45;
            jObj["Colleagues"] = colleagues;//修改后，再赋给对象
            p(jObj.ToString());
            /*现在我们想删除Jack的同事*/
            jObj = JObject.Parse(json);
            jObj.Remove("Colleagues");//跟的是属性名称
            p(jObj.ToString());
            /*现在我们发现Abel不是Jack的同事，要求从中删除*/
            jObj = JObject.Parse(json);
            jObj["Colleagues"][1].Remove();
            p(jObj.ToString());
            /*我们发现Jack的信息中少了部门信息，要求我们必须添加在Age的后面*/
            jObj = JObject.Parse(json);
            jObj["Age"].Parent.AddAfterSelf(new JProperty("Department", "Personnel Department"));
            p(jObj.ToString());
            /*现在我们又发现，Jack公司来了一个新同事Linda*/
            jObj = JObject.Parse(json);
            JObject linda = new JObject(new JProperty("Name", "Linda"), new JProperty("Age", "23"));
            jObj["Colleagues"].Last.AddAfterSelf(linda);
            p(jObj.ToString());
            /*利用SelectToken来查询名称*/
            jObj = JObject.Parse(json);
            JToken name = jObj.SelectToken("Name");
            p(name.ToString());
            /*利用SelectToken来查询所有同事的名字*/
            jObj = JObject.Parse(json);
            var namess = jObj.SelectToken("Colleagues").Select(p => p["Name"]).ToList();
            foreach (var name1 in namess)
                p(name1.ToString());
            /*查询最后一名同事的年龄*/
            jObj = JObject.Parse(json);
            var age = jObj.SelectToken("Colleagues[1].Age");
            Console.WriteLine(age.ToString());

            /*如果Json中的Key是变化的但是结构不变，如何获取所要的内容?*/
            string jstr = "{\"trends\":{\"2013-05-31 14:31\":[{\"name\":\"我不是谁的偶像\",\"query\":\"我不是谁的偶像\",\"amount\":\"65172\",\"delta\":\"1596\"},{\"name\":\"世界无烟日\",\"query\":\"世界无烟日\",\"amount\":\"33548\",\"delta\":\"1105\"},{\"name\":\"最萌身高差\",\"query\":\"最萌身高差\",\"amount\":\"32089\",\"delta\":\"1069\"},{\"name\":\"中国合伙人\",\"query\":\"中国合伙人\",\"amount\":\"25634\",\"delta\":\"2\"},{\"name\":\"exo回归\",\"query\":\"exo回归\",\"amount\":\"23275\",\"delta\":\"321\"},{\"name\":\"新一吻定情\",\"query\":\"新一吻定情\",\"amount\":\"21506\",\"delta\":\"283\"},{\"name\":\"进击的巨人\",\"query\":\"进击的巨人\",\"amount\":\"20358\",\"delta\":\"46\"},{\"name\":\"谁的青春没缺失\",\"query\":\"谁的青春没缺失\",\"amount\":\"17441\",\"delta\":\"581\"},{\"name\":\"我爱幸运七\",\"query\":\"我爱幸运七\",\"amount\":\"15051\",\"delta\":\"255\"},{\"name\":\"母爱10平方\",\"query\":\"母爱10平方\",\"amount\":\"14027\",\"delta\":\"453\"}]},\"as_of\":1369981898}";
            jObj = JObject.Parse(jstr);
            var tends = from c in jObj.First.First.First.First.Children()
                        select JsonConvert.DeserializeObject<Trend>(c.ToString());
            p(tends.ToString());

        }
        public static void p(string str)
        {
            Console.WriteLine(str);
            Console.Read();
        }

        public static void testMySqlDataSet()
        {
            String sqlstr = "select * from uoption where opt_id = '900002'";
            OdbcDataAdapter mysqlad = new OdbcDataAdapter(sqlstr, OdbcTool.ConnStr);
            new OdbcCommandBuilder(mysqlad);
            DataSet ds = new DataSet();
            mysqlad.Fill(ds, "Table1");
            DataRow dr = ds.Tables["Table1"].Rows[0];
            dr["note"] = "test1";
            int rtn = mysqlad.Update(ds, "Table1");
            p(rtn.ToString());
        }

        public static void testODBCDataSet()
        {
            String sql = "select * from uoption where opt_id = ?";
            OdbcCommand cmd;
            DataTable table = OdbcTool.ExecuteDataTable(sql, out cmd, "900002");
            table.Rows[0][3] = table.Rows[0][3].ToString() + "c";
            int rtn = OdbcTool.UpdateDataTable(table, cmd);
            Console.WriteLine(rtn.ToString());
        }
    }
    public class Trend
    {
        public string Name { get; set; }
        public string Query { get; set; }
        public string Amount { get; set; }
        public string Delta { get; set; }
    }
}
