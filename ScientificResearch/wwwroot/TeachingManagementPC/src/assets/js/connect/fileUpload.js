// 上传文件
export function fileUpload(data, result, url) {
  $.ajax({
    url: url,
    type: 'POST',
    processData: false,
    contentType: false,
    data: data,
    dataType: 'text',

    success: function(e) {
      e = JSON.parse(e)
      if (e.error) {
        result(false, null, e.error)
      } else {
        let data = e.data[0]
        result(true, data, '上传成功！')
      }
    }, error: function(e) {
      e = JSON.parse(e)
      result(false, null, e)
    }
  })
}
