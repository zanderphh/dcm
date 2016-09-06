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
/// 登录
/// </summary>
    public class HttpUpgradeCheck : HttpBase
    {
        public MsgArgs Request()
        {
            init();
            JObject json = new JObject();
            json.Add(new JProperty("clientNo", is_ClientNo));
            json.Add(new JProperty("version", is_Version));
            json.Add(new JProperty("shopId", is_ShopId));
            json.Add(new JProperty("timestamp", timestamp));
            json.Add(new JProperty("mac", Tools.MD5Encode(is_ClientNo + is_Version + timestamp + is_Key)));
            json.Add(new JProperty("system", is_Account));

            string response = HttpTool.PostDefault(HttpMethodInfo.UpgradeCheck, json.ToString());
            return ParseResponse(response);
        }
    }
}
