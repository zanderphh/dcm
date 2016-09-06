using Lib;
using Newtonsoft.Json.Linq;
using Pos.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.BL.Http
{
    public class HttpBase
    {
        public string is_ClientNo;
        public string is_Key;
        public string is_Account;
        public string is_password;
        //public string is_APIAddr;
        //public string is_APIPort;
        public string is_Version;
        public string is_ShopId;
        public string is_ShopName;
        public string is_yjgUrl;
        public string is_newdata;
        public string is_moddata;
        public string is_deldata;
        public bool ib_disableSave;
        public string timestamp;
        public string is_ServerMac;

        public string StatusCode;
        public string Message;

        /// <summary>
        /// Json返回值常规解析
        /// </summary>
        /// <param name="json"></param>
        public MsgArgs ParseResponse(string json)
        {
            try
            {
                JObject j = JObject.Parse(json);
                StatusCode = j["statusCode"].ToString();
                Message = j["message"].ToString();
                int code = int.Parse(StatusCode);
                if (code != 1)
                {
                    (new HttpLog()).Request(code, json); //如果返回CODE！=1,调用日志上传接口
                }
                return new MsgArgs(code, Message) { Content = json };
            }
            catch (Exception e)
            {
                (new HttpLog()).Request(1, json); //如果返回CODE！=1,调用日志上传接口
                throw new Exception("JSON解析失败\n" + e.Message + "\n\n" + json);
            }
        }
        public void init()
        {
            is_ClientNo = DbTool.GetDbValue(Hme.CONST_ClientNo);
            if (string.IsNullOrEmpty(is_ClientNo))
            {
                throw new Exception("获取渠道编号出错");
            }
            is_Account = DbTool.GetDbValue(Hme.CONST_Account);
            if (string.IsNullOrEmpty(is_Account))
            {
                throw new Exception("获取店铺登录账号出错");
            }
            is_password = DbTool.GetDbValue(Hme.CONST_password);
            if (string.IsNullOrEmpty(is_password))
            {
                throw new Exception("获取店铺登录密码出错");
            }
            is_Key = DbTool.GetDbValue(Hme.CONST_Key);
            if (string.IsNullOrEmpty(is_Key))
            {
                throw new Exception("获取请求密钥出错");
            }
            //is_APIAddr = DbTool.GetDbValue(Hme.CONST_APIAddr);
            //if (string.IsNullOrEmpty(is_APIAddr))
            //{
            //    throw new Exception("获取API接口地址出错");
            //}
            //is_APIPort = DbTool.GetDbValue(Hme.CONST_APIPort);
            //if (string.IsNullOrEmpty(is_APIPort))
            //{
            //    throw new Exception("获取API请求端口号出错");
            //}
            is_Version = App.Version;
            is_ShopId = DbTool.GetDbValue(Hme.CONST_ShopId);
            if (string.IsNullOrEmpty(is_ShopId))
            {
                throw new Exception("获取店铺编号出错");
            }
            is_ShopName = DbTool.GetDbValue(Hme.CONST_ShopName);
            if (string.IsNullOrEmpty(is_ShopName))
            {
                throw new Exception("获取店铺名称出错");
            }
            is_ServerMac = DbTool.GetDbValue(Hme.CONST_ServerMac);
            if (string.IsNullOrEmpty(is_ServerMac))
            {
                throw new Exception("获取服务器请求MAC出错");
            }
            timestamp = GetTimestamp(DateTime.Now).ToString();
        }

        public long GetTimestamp(System.DateTime time)
        {
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1, 0, 0, 0, 0));
            long t = (time.Ticks - startTime.Ticks) / 10000;   //除10000调整为13位      
            return t;
        }
    }

    //包含HTTP请求方法的常量类
    public static class HttpMethodInfo
    {
        public static string DefaultUrl
        {
            get
            {
                if (Tools.IniRead(App.MainIni, "HME", "TestEnv", "") == "1")
                {
                    return Tools.IniRead(App.MainIni, "HME", "TestEnv_Api", "http://192.168.0.10:8005/hpf-open-api/api/crm");
                }
                else
                {
                    Tools.IniWrite(App.MainIni, "HME", "TestEnv", "");
                    Tools.IniWrite(App.MainIni, "HME", "TestEnv_Api", "");
                    return @"http://api.hme.cn/hpf-open-api/api/crm";
                }
            }
        }
        //测试环境
        public const string CommonUrl = @"http://api.hme.cn/hpf-open-api/api/common";
        public const string JsonKey = "jsonStr";

        /// <summary>
        /// 获取当前时间
        /// </summary>
        public const string GetCurrentTime = "get-current-time.api";
        /// <summary>
        /// 登录
        /// </summary>
        public const string Login = "user-login.api";
        /// <summary>
        /// 提交消费流水
        /// </summary>
        public const string Submit_Consume_Serial = "submit-consume-serial.api";
        /// <summary>
        /// 提交刷卡支付
        /// </summary>
        public const string Micropay = "micropay.api";
        /// <summary>
        /// 升级检测
        /// </summary>
        public const string UpgradeCheck = "upgrade-check.api";
    }
}
