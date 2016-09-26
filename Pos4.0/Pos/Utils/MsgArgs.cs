using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Utils
{
    public class MsgArgs
    {
        public int Code { get; set; }
        public string MsgToken { get; set; }
        public string ErrMessage { get; set; }
        public string Content { get; set; }
        public Dictionary<string, object> Extra = new Dictionary<string, object>();

        public MsgArgs()
        {

        }
        public MsgArgs(int code)
        {
            this.Code = code;
        }
        public MsgArgs(int code, string err)
        {
            this.Code = code;
            this.ErrMessage = err;
        }
    }

    public static class MsgCode
    {
        public const int Succ = 10000;
        public const int Faild = 10001;
        public const int NoCare = 10002;
        public const int NoTheUser = 10003;
        public const int PasswordError = 10004;
    }
}
