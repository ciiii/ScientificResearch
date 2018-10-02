using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScientificResearch.Business
{
    public class UploadBusiness
    {
        async public Task<object> 上传并返回text类型的结果(Microsoft.AspNetCore.Http.IFormFileCollection files, string absolutePath,
            string relativePath, int uploadFileMaxSize)
        {

            var filesNameList = await MyLib.UploadFile.Upload(
                files,
                absolutePath,
                relativePath,
                uploadFileMaxSize);

            var obj = new
            {
                state = "SUCCESS",
                url = filesNameList.FirstOrDefault(),
                //title = "new.png",
                //original = file.FileName,
                //type = ".png",
                //size = 1000

            };

            var objString = Newtonsoft.Json.JsonConvert.SerializeObject(obj);

            var result = new Microsoft.AspNetCore.Mvc.ContentResult();
            result.Content = objString;
            result.ContentType = "text/html";

            return result;

            //return filesNameList.FirstOrDefault();
        }
    }
}
