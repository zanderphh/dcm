using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.BL
{/// <summary>
 /// 好觅网OpenAPI服务
 /// </summary>
    class HmeService
    {
        string LogFile; //日志文件

        string CONST_yjgUrl = "Hme_YjgURL"; //YJG URL
        string CONST_checkNet = "Hme_checkNet";    //网络检测IP
        string CONST_enableNotify = "Hme_enableNotify";    //启用通知

        //HTTP调用参数
        string CONST_ClientNo = "HME_ClientNo";
        string CONST_Key = "HME_Key";
        string CONST_Account = "HME_Account";
        string CONST_password = "HME_Password";
        string CONST_APIAddr = "HME_APIAddr";
        string CONST_APIPort = "HME_APIPort";
        string CONST_Version = "HME_Version";
        string CONST_ShopId = "HME_ShopId";
        string CONST_ShopName = "HME_ShopName";
        string CONST_License = "HME_License";
        string CONST_Validdate = "HME_Validdate";

        //SOCKET通讯参数
        string CONST_SocketAdd = "HME_SocketAdd";
        string CONST_SocketPort = "HME_SocketPort";
        string CONST_LinkLicense = "HME_linkLicense";

        //HME充值送积分规则参数
        string CONST_BaseCharge = "HME_BaseCharge";    //充值额度	
        string CONST_BaseIntegral = "HME_BaseIntegral";//积分基数

        //HME赠送积分类型
        string CONST_JFTYPE_Expend = "1";  //消费送积分	
        string CONST_JFTYPE_Recharge = "2";    //充值送积分	
        string CONST_JPTYPE_Transfer = "3";    //会员积分导入,将会员在商家中的积分转换为HME积分	

        string is_ClientNo;
        string is_Key;
        string is_Account;
        string is_password;
        string is_APIAddr;
        string is_APIPort;
        string is_Version;
        string is_ShopId;
        string is_ShopName;
        string is_yjgUrl;
        string is_newdata;
        string is_moddata;
        string is_deldata;
        bool ib_disableSave;
        public HmeService()
        {

        }
    }
}
