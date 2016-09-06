using Lib;
using Newtonsoft.Json.Linq;
using Pos.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utils;

namespace Pos.BL.Http
{/// <summary>
/// 提交刷卡支付
/// </summary>
    public class HttpMicropay : HttpBase
    {/// <summary>
     /// 扫码支付请求
     /// </summary>
     /// <param name="orderNo"></param>
     /// <param name="channel"></param>
     /// <param name="authCode"></param>
     /// <returns></returns>
        public MsgArgs Request(string orderNo, int channel, string authCode)
        {
            init();
            JObject json = new JObject();
            json.Add(new JProperty("clientNo", is_ClientNo));
            json.Add(new JProperty("version", is_Version));
            json.Add(new JProperty("shopId", is_ShopId));
            json.Add(new JProperty("account", is_Account));
            json.Add(new JProperty("timestamp", timestamp));
            json.Add(new JProperty("orderNo", orderNo));
            json.Add(new JProperty("channel", channel));
            json.Add(new JProperty("authCode", authCode));
            json.Add(new JProperty("mac", Tools.MD5Encode(is_ClientNo + is_Version + is_ShopId + is_Account + orderNo + authCode + timestamp + is_Key)));
            ///////////////////////////////////////////// MD5(clientNo + version + shopId + account + orderNo + authCode + timestamp + key)
            string response = HttpTool.PostDefault(HttpMethodInfo.Micropay, json.ToString());
            return ParseResponse(response);
        }
    }
}
