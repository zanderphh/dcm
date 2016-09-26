using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.BL
{/// <summary>
 /// 好觅网OpenAPI服务
 /// </summary>
    public static class Hme
    {
        public static string LogFile; //日志文件

        public static string CONST_yjgUrl = "Hme_YjgURL"; //YJG URL
        public static string CONST_checkNet = "Hme_checkNet";    //网络检测IP
        public static string CONST_enableNotify = "Hme_enableNotify";    //启用通知

        //HTTP调用参数
        public static string CONST_ClientNo = "HME_ClientNo";
        public static string CONST_Key = "HME_Key";
        public static string CONST_Account = "HME_Account";
        public static string CONST_password = "HME_Password";
        public static string CONST_APIAddr = "HME_APIAddr";
        public static string CONST_APIPort = "HME_APIPort";
        public static string CONST_Version = "HME_Version";
        public static string CONST_ShopId = "HME_ShopId";
        public static string CONST_ShopName = "HME_ShopName";
        public static string CONST_License = "HME_License";
        public static string CONST_Validdate = "HME_Validdate";
        public static string CONST_ServerMac = "server_mac";
        public static string CONST_QrCodeAd = "qrCodeAd";

        //SOCKET通讯参数
        public static string CONST_SocketAdd = "HME_SocketAdd";
        public static string CONST_SocketPort = "HME_SocketPort";
        public static string CONST_LinkLicense = "HME_linkLicense";

        //HME充值送积分规则参数
        public static string CONST_BaseCharge = "HME_BaseCharge";    //充值额度	
        public static string CONST_BaseIntegral = "HME_BaseIntegral";//积分基数

        //HME赠送积分类型
        public static string CONST_JFTYPE_Expend = "1";  //消费送积分	
        public static string CONST_JFTYPE_Recharge = "2";    //充值送积分	
        public static string CONST_JPTYPE_Transfer = "3";    //会员积分导入,将会员在商家中的积分转换为HME积分	

        public static string is_ClientNo;
        public static string is_Key;
        public static string is_Account;
        public static string is_password;
        public static string is_APIAddr;
        public static string is_APIPort;
        public static string is_Version;
        public static string is_ShopId;
        public static string is_ShopName;
        public static string is_yjgUrl;
        public static string is_newdata;
        public static string is_moddata;
        public static string is_deldata;
        public static bool ib_disableSave;
    }
}
