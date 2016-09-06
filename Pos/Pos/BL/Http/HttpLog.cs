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
/// 日志上传
/// </summary>
    public class HttpLog : HttpBase
    {
        public MsgArgs Request(int code, string content)
        {
            init();
            Dictionary<string, object> json = new Dictionary<string, object>();

            if (code == 22 && content.IndexOf("upgrade-check.api") > 0)
            {//如果是检测升级接口，并返回22则不发送日志
                return new MsgArgs(MsgCode.Succ);
            }
            if (code == 44 && content.IndexOf("get-consume-pay-info.api") > 0)//如果是获取线上付款明细，并返回44则不发送日志
            {
                return new MsgArgs(MsgCode.Succ);
            }

            string ad = Tools.IniRead(App.MainIni, "HME", "lg", "");
            {
                ad = "aHR0cDovL2xvZy5obWUuY24vaHBmLWxvZw=="; //http:log.hme.cn/hpf-log
                Tools.IniWrite(App.MainIni, "HME", "lg", ad);
            }
            ad = Tools.Base64Decode(ad);
            string ls_url = "v1/put_log";
            if (ad.Substring(ad.Length - 1, 1) == "/")
            {
                ls_url = ad + ls_url + "?";
            }
            else
            {
                ls_url = ad + "/" + ls_url + "?";
            }
            string Level = "ERROR";
            json.Add("clientNo", is_ClientNo);
            json.Add("version", is_Version);
            json.Add("shopId", is_ShopId);
            json.Add("level", Level);
            json.Add("content", content);
            json.Add("timestamp", timestamp);
            json.Add("mac", Tools.MD5Encode(is_ClientNo + timestamp));
            string response = HttpTool.Post(ls_url, string.Empty, Tools.ParseHttpArg(json));
            return null;
        }
    }
}
