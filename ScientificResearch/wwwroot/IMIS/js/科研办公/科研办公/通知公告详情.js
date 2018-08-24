$(function () {
    window.noticeVm = null;
    var id = JSON.parse(sessionStorage.noticeId);
    avalon.ready(function () {
        window.noticeVm = avalon.define({
            $id: 'details',
            model: [],
            files: [],
            names: '',
            getDetails: function () {
                Notice.getNoticeDetails('get', id, function getNoticeDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            noticeVm.model = [];
                            return;
                        } else {

                            noticeVm.model = obj;
                            if (obj.通知公告.相关文件路径 != null && obj.通知公告.相关文件路径 != '') {
                                noticeVm.files = obj.通知公告.相关文件路径.split(',');
                            }
                            debugger;
                            if (obj.接收条件.length > 0) {
                                debugger;
                                obj.通知公告.接收者类型名称 = obj.接收条件[0].接收者类型名称;
                                var arr = [];
                                for (var i in obj.接收条件) {
                                    arr.push(obj.接收条件[i].接收者名称);
                                }
                                noticeVm.names = arr.join();
                                debugger;
                            }
                            $('.detailsPage').contents().find("body").html(noticeVm.model.通知公告.通知内容);
                            $('.detailsPage').contents().find("body").css('font-size', '12px');
                        }
                    } else {
                        console.info('获取通知详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            getHtmlDocName: function (url) {
                var arr = url.split('\\');
                return arr[arr.length - 1];
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        $('.nav-tabs a').on('click', function (e) {
            e.preventDefault();
            $(this).tab('show');
        });
        noticeVm.getDetails();
        avalon.scan(document.body);
    });
});