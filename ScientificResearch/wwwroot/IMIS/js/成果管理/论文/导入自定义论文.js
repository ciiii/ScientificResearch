$(function () {
    var addVm = null;
    var icon;
    avalon.ready(function () {
        addVm = avalon.define({
            $id: 'Add',
            downloadImoprtExcel: getUrl(Code.URL_GET_DOWNLOAD_CUSTOM_TEMPLET),
            clickSubmit: function () {
                var data = new FormData();
                data.append('file', $("#input-file").get(0).files[0]);
                $('.submit-wrapper .loading').show();
                addVm.fileUpload(data);
            },
            fileUpload: function (data) {
                $.ajax({
                    url: Code.URL_POST_IMPORT_CUSTOM_PAPER,
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: data,
                    dataType: 'text',
                    beforeSend : function(request) {
                        request.setRequestHeader('Authorization', JSON.parse(sessionStorage.Authorization));
                    },
                    success: function (e) {
                        e = JSON.parse(e);
                        if (e.error) {
                            icon = 'icon-shibai1';
                            popover(icon, ' 上传失败：' + e.error);
                            setTimeout("$('.popover').remove()", 4000);
                        } else {
                            icon = 'icon-chenggong1';
                            popover(icon, ' 上传成功!');
                            setTimeout(function () {
                                $('.popover').remove();
                            }, 1000);
                            addVm.clickBtnReturn();
                            vm.query();
                        }
                        $('.submit-wrapper .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.submit-wrapper .loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        avalon.scan(document.body);
    });
});

