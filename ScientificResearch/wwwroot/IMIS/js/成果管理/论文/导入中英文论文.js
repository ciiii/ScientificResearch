$(function () {
    var addVm = null;
    var icon;
    avalon.ready(function () {
        addVm = avalon.define({
            $id: 'Add',
            importType: vm.importType,
            title: '',
            downloadImoprtExcel: getUrl(Code.URL_GET_DOWNLOAD_CUSTOM_TEMPLET),
            clickSubmit: function () {
                var data = new FormData();
                data.append('file', $("#input-file").get(0).files[0]);
                $('.loading').show();
                var url;
                if (addVm.importType == 0) {
                    url = Code.URL_POST_IMPORT_PAPER_CN;
                } else {
                    url = Code.URL_POST_IMPORT_PAPER_EN
                }
                addVm.fileUpload(data, url);
            },
            fileUpload: function (data, url) {
                $.ajax({
                    url: url,
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: data,
                    dataType: 'text',
                    success: function (e) {
                        e = JSON.parse(e);
                        if (e.error) {
                            icon = 'icon-shibai1';
                            popover(icon, ' 上传失败：' + e.error);
                            setTimeout("$('.popover').remove()", 2000);
                        } else {
                            icon = 'icon-chenggong1';
                            popover(icon, ' 上传成功!');
                            setTimeout(function () {
                                $('.popover').remove();
                            }, 1000);
                            addVm.clickBtnReturn();
                            vm.query();
                        }
                        $('.loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        addVm.$watch('onReady', function () {
            if (addVm.importType == 0) {
                addVm.title = '中文';
            } else {
                addVm.title = '英文';
            }
        })
        avalon.scan(document.body);
    });
});

