using Lib;
using Newtonsoft.Json.Linq;
using Pos.BL.Http;
using Pos.Model;
using Pos.Utils;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Utils;

namespace Pos.BL
{
    public class CurorderService : IDataService
    {
        public List<Curorder> GetList()
        {
            string sql = "select * from curorder";
            DataTable dt = OdbcTool.ExecuteDataTable(sql);
            dt.TableName = "curorder";
            List<Curorder> list = dt.ToEntityList<Curorder>();
            return list;
        }
        public Curorder GetByCurorderId(string id)
        {
            Curorder o = new Curorder();
            string sql = "select * from curorder where curorder_id = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql, id);
            dt.TableName = "curorder";
            o = dt.ToEntity<Curorder>();
            return o;
        }

        public Curorder GetByTablename(string tablename)
        {
            string sql = "select * from curorder where tablename = ?";
            DataTable dt = OdbcTool.ExecuteDataTable(sql, tablename);
            dt.TableName = "curorder";
            Curorder o = dt.ToEntity<Curorder>();
            return o;
        }

        /// <summary>
        /// 添加客单
        /// </summary>
        /// <returns></returns>
        public bool AddOrder(Curorder order, IList<CurorderDetail> details, int channel, string paycode)
        {
            int UserId = 0;
            string Phone = string.Empty;
            string HmeFlowId_Last = string.Empty;
            if (order == null || details.Count < 1)
            {
                throw new Exception("客单或客单明细不能为空");
            }

            if (channel > 0)  //如果非现金支付
            {
                Debug.WriteLine(DateTime.Now.ToString()+ "\r\n开始提交预结账流水","结账");
                //提交消费流水(预流水)
                MsgArgs msg = (new HttpSubmitConsumeSerial("0")).Request(order, details);
                if (msg.Code != 1)
                {
                    throw new Exception("提交流水失败\n" + msg.ErrMessage);
                }
                Debug.WriteLine(DateTime.Now.ToString() + "\r\n开始支付", "结账");
                //提交扫码支付
                msg = (new HttpMicropay()).Request(order.HmeOrderId, channel, paycode);
                if (msg.Code != 1)
                {
                    throw new Exception("付款失败\n" + msg.ErrMessage);
                }
                Debug.WriteLine(DateTime.Now.ToString() + "\r\n支付返回", "结账");
                JObject jobj = JObject.Parse(msg.Content);
                if (string.IsNullOrEmpty(jobj["data"]["userId"].ToString()))
                {
                    UserId = 0;
                }
                else
                {
                    UserId = int.Parse(jobj["data"]["userId"].ToString());
                }
                Phone = jobj["data"]["phone"].ToString();
            }

            //转换当前客单及明细为历史客单及明细
            Hisorder h = CurorderToHisorder(order);
            order.HmeUserId = UserId;
            h.HmeUserId = UserId;
            List<HisorderDetail> hlist = new List<HisorderDetail>();
            Bill bill = CreateBill(h);
            for (int i = 0; i < details.Count; i++)
            {
                hlist.Add(CurorderDetailToHisorderDetail(details[i]));
            }
            try
            {
                Debug.WriteLine(DateTime.Now.ToString() + "\r\n开始保存本地账单", "结账");
                OdbcTransTool tran = new OdbcTransTool();
                OdbcCommand cmd;
                DataTable dtHisorder = EntityTool.EntityToDataTable<Hisorder>(h, out cmd);
                tran.UpdateDataTableUsingTrans(dtHisorder, cmd);
                DataTable dtHisorderDetail = EntityTool.EntityListToDataTable(hlist, out cmd);
                tran.UpdateDataTableUsingTrans(dtHisorderDetail, cmd);
                DataTable dtBill = EntityTool.EntityToDataTable<Bill>(bill, out cmd);
                tran.UpdateDataTableUsingTrans(dtBill, cmd);
                tran.Commit();
                Debug.WriteLine(DateTime.Now.ToString() + "\r\n本地账单保存完成", "结账");
                try
                {
                    Debug.WriteLine(DateTime.Now.ToString() + "\r\n开始提交最终结账流水", "结账");
                    //提交消费流水(最终流水),就算失败也不影响结账流程
                    MsgArgs msg = (new HttpSubmitConsumeSerial("1")).Request(order, details);
                    if (msg.Code != 1)
                    {
                        MessageBox.Show("结账成功但提交流水失败\n" + msg.ErrMessage, "提示信息");
                    }
                    Debug.WriteLine(DateTime.Now.ToString() + "\r\n最终结账流水提交完成", "结账");
                    HmeFlowId_Last = JObject.Parse(msg.Content)["data"].ToString();
                }
                catch (Exception e)
                {
                    MessageBox.Show("结账成功但提交流水失败\n" + e.Message, "提示信息");
                }
                string sql = "update hisorder set hme_id = ? where hisorder_id = ?";
                OdbcTool.ExecuteSql(sql,HmeFlowId_Last,h.HisorderId.Substring(0,18));
                return true;
            }
            catch (Exception e)
            {
                throw new Exception("添加客单失败\n" + e.Message);
            }
        }
        private Hisorder CurorderToHisorder(Curorder order)
        {
            Hisorder h = new Hisorder();
            h.AllDiscount = order.AllDiscount;
            h.Amount = order.Amount;
            h.BillDate = DateTime.Now;
            h.Discount = order.Discount;
            h.DiscountRate = order.DiscountRate;
            h.DishAmount = order.DishAmount;
            h.FreeCharge = order.FreeCharge;
            h.HisorderId = order.CurorderId;
            h.HmeOrderId = order.HmeOrderId;
            h.HmeTableId = order.HmeTableId;
            h.HmeUserId = order.HmeUserId;
            h.Operatorname = order.Operatorname;
            h.OrderDate = order.OrderDate;
            h.Paytype = order.Paytype;
            h.PeopleNum = order.PeopleNum;
            h.Posname = order.Posname;
            h.PrepayAmount = order.PrepayAmount;
            h.Roomfee = order.Roomfee;
            h.Shift = order.Shift;
            h.Shouldpay = order.Shouldpay;
            h.Srvfee = order.Srvfee;
            h.TableName = order.TableName;
            h.Waiter = order.Waiter;
            h.Yetpay = order.Yetpay;
            return h;
        }
        private HisorderDetail CurorderDetailToHisorderDetail(CurorderDetail detail)
        {
            HisorderDetail d = new HisorderDetail();
            d.AfterDiscount = detail.AfterDiscount;
            d.DiscountRate = detail.DiscountRate;
            d.DishId = detail.DishId;
            d.DishName = detail.DishName;
            d.DishRequest = detail.DishRequest;
            d.DishTime = detail.DishTime;
            d.DishType = detail.DishType;
            d.DishTypeId = detail.DishTypeId;
            d.HisorderDetailId = detail.CurrderDetailId;
            d.HisorderId = detail.CurorderId;
            d.HmeFlowId = detail.HmeFlowId;
            d.KillId = detail.KillId;
            d.OrderFlag = detail.OrderFlag;
            d.OrderType = detail.OrderType;
            d.Price = detail.Price;
            d.Quantity = detail.Quantity;
            d.Unit = detail.Unit;
            d.Waiter = detail.Waiter;
            return d;
        }
        private Bill CreateBill(Hisorder h)
        {
            Bill bill = new Bill();
            bill.BillId = "PT" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
            bill.OrderId = h.HisorderId;
            bill.PayDate = h.BillDate;
            bill.Payee = h.Operatorname;
            bill.PayType = h.Paytype;
            bill.PayUsage = "营业收入";
            bill.RealPay = h.Shouldpay;
            bill.is_statics = "Y";
            return bill;
        }
    }
}
