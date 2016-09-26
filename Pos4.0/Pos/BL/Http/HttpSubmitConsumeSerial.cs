using Lib;
using Newtonsoft.Json.Linq;
using Pos.Model;
using Pos.Utils;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utils;

namespace Pos.BL.Http
{/// <summary>
/// 提交消费流水
/// </summary>
    public class HttpSubmitConsumeSerial : HttpBase
    {
        private string payState;
        public HttpSubmitConsumeSerial(string paystate)
        {
            payState = paystate;
        }
        public MsgArgs Request(Curorder order, IList<CurorderDetail> details)
        {
            init();
            JObject json = new JObject();
            json.Add(new JProperty("clientNo", is_ClientNo));
            json.Add(new JProperty("version", is_Version));
            json.Add(new JProperty("shopId", is_ShopId));
            json.Add(new JProperty("account", is_Account));
            json.Add(new JProperty("timestamp", timestamp));

            string serialNo = order.CurorderId;
            string totalMoney = order.Shouldpay.ToString("0.00");
            string mac = Tools.MD5Encode(is_ClientNo + is_Version + is_ShopId + serialNo + totalMoney + payState + is_Account + timestamp + is_Key);
            json.Add(new JProperty("mac", mac));
            json.Add(new JProperty("serialNo", serialNo));
            json.Add(new JProperty("userId", order.HmeUserId));
            json.Add(new JProperty("giveIntegral", 0));
            json.Add(new JProperty("tableId", order.HmeTableId));
            json.Add(new JProperty("tableName", order.TableName));
            json.Add(new JProperty("shopAreaName", order.Posname + "-" + order.TableName));
            json.Add(new JProperty("consumeTime", order.OrderDate.ToString("yyyy-MM-dd HH:mm:ss")));
            json.Add(new JProperty("endTime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")));
            json.Add(new JProperty("containOrderNos", order.HmeOrderId));
            json.Add(new JProperty("mealFee", 0));
            json.Add(new JProperty("serviceFeeRatio", order.SrvRate));
            json.Add(new JProperty("roomFee", order.Roomfee));
            json.Add(new JProperty("serviceFee", order.Srvfee));
            json.Add(new JProperty("nonZero", order.FreeCharge));
            json.Add(new JProperty("totalMoney", order.Shouldpay));
            json.Add(new JProperty("offLinePayMoney", 0));
            json.Add(new JProperty("isWholeBill", order.AllDiscount));
            json.Add(new JProperty("ratePerson", order.DiscountRate));
            json.Add(new JProperty("payState", payState));

            JArray array = new JArray();
            foreach (var item in details)
            {
                JObject o = new JObject();
                o.Add(new JProperty("dishId", item.DetailId));
                o.Add(new JProperty("dishName", item.DishName));
                o.Add(new JProperty("quantity", item.Quantity));
                o.Add(new JProperty("price", item.Price));
                o.Add(new JProperty("orderType", item.OrderType));
                o.Add(new JProperty("unit", item.Unit));
                o.Add(new JProperty("orderDetailId", 0));
                array.Add(o);
            }
            json.Add(new JProperty("detail", array));
            string response = HttpTool.PostDefault(HttpMethodInfo.Submit_Consume_Serial, json.ToString());
            return ParseResponse(response);
        }
    }
}
