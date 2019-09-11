using Qiniu.IO;
using Qiniu.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyLib
{
    public class MyQiniu
    {
        public static string GetPrivateUrl(string AccessKey,string SecretKey, string domain, string key)
        {
            Mac mac = new Mac(AccessKey, SecretKey);
            string url = MyPath.Combine(domain, key);
            return DownloadManager.CreateSignedUrl(mac, url);
        }
    }
}
