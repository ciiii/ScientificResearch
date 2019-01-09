$(function () {
    window.dAddVm = null;
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            req: {
                人员编号: mUserId,
                Index: 1,
                Size: 10,
                OrderType: false,
                是否已接收: false,
                是否必读: true,
            },
            model: '',
            userInfo: vm.userInfo,
            total: '',
            nothing: false,
            getUserNoticeMustReadList: function () {
                Notice.getUserNoticeList('get', dAddVm.req.$model, function getUserNoticeListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.total = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            $('.modal-choice .pager').hide();
                            dAddVm.model = [];
                            dAddVm.nothing = true;
                            return;
                        } else {
                            obj = obj.list;
                            var number = (dAddVm.req.Index - 1) * dAddVm.req.Size + 1;
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].number = number;
                                number++;
                            }
                            dAddVm.model = obj;
                            dAddVm.nothing = false;
                            $('.modal-choice .pager').show();
                            $('.modal-choice .pager').mamPager({
                                pageSize: dAddVm.req.Size,                       //页大小
                                pageIndex: dAddVm.req.Index,                     //当前页
                                recordTotal: dAddVm.total,                       //数据总数
                                type: 1,
                                prevText: "&laquo;",                         //上一页显示内容
                                nextText: "&raquo;",
                                noData: "暂无数据",
                                pageChange: function (index) {
                                    dAddVm.req.Index = index;
                                    dAddVm.getUserNoticeMustReadList();
                                }
                            });
                        }
                    } else {
                        console.info('获取必读的通知公告列表失败！');
                        console.info(strErro);
                    }
                });
            },
            getStateClass: function (state) {
                switch (state) {
                    case 0:
                        return 'not-received';
                }
            },
            noticeDetails: function (id, el) {
                sessionStorage.noticeId = JSON.stringify(id);
                dAddVm.model.remove(el);
                dAddVm.total--;
                if (dAddVm.total == 0) {
                    dAddVm.model = [];
                    dAddVm.nothing = true;
                }
            },
            getUrl: function (url) {
                return decodeURI(url);
            },
            clickBtnReturn: function () {
                $('.modal-choice').modal('hide');
            }
        });
        $('.modal-choice .tab-pane,.menuContent').mCustomScrollbar({
            theme: 'dark-3',
        });
        dAddVm.getUserNoticeMustReadList();
        avalon.scan(document.body);
    });


});
