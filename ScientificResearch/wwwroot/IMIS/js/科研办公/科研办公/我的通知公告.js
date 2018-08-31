$(function () {
    isOverdue();
    window.vm = null;
    var userInfo = JSON.parse(localStorage.info).data;
    var userId = userInfo.人员.编号;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                Index: 1,
                Size: 16,
                人员编号: userId,
                通知类型: '',
                Like通知名称: '',
                Like通知内容: '',
                Like发送人姓名: '',
                OrderType: false
            },
            type: '',
            name: '',
            tName: '',
            content: '',
            receive: '',
            total: '',
            model: [],
            arr: {},
            text: '',
            deepartmentId: '',
            department: '',
            editType: false,
            nothing: false,
            loaded: false,
            allchecked: false,
            postName: '',
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                Notice.getUserNoticeList('get', vm.req.$model, function getUserNoticeListListener(success, obj, strErro) {
                    if (success) {
                        vm.loaded = true;
                        vm.total = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            $('.pager').hide();
                            vm.model = [];
                            vm.nothing = true;
                            return;
                        } else {
                            obj = obj.list;
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].checked = false;
                            }
                            vm.model = obj;
                            $('.pager').show();
                            vm.nothing = false;
                            vm.allchecked = false;
                        }
                        $('.pager').mamPager({
                            pageSize: vm.req.Size,                       //页大小
                            pageIndex: vm.req.Index,                     //当前页
                            recordTotal: vm.total,                       //数据总数
                            type: 1,
                            prevText: "&laquo;",                         //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                vm.req.Index = index;
                                vm.loaded = false;
                                vm.nothing = false;
                                vm.query();
                            }
                        });
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取通知公告列表失败！');
                        console.info(strErro);
                    }
                });

            },
            search: function () {
                vm.req.Index = 1;
                vm.req.Like发送人姓名 = vm.name;
                vm.req.Like通知名称 = vm.tName;
                vm.req.Like通知内容 = vm.content;
                vm.query();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    vm.search();
                }
            },
            change: function () {
                vm.req.通知类型 = $('.screen-box .type').val();
                vm.search();
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            details: function (id) {
                sessionStorage.noticeId = JSON.stringify(id);
            },
            getStateClass: function (state) {
                switch (state) {
                    case 1:
                        return 'not-received';
                }
            },
            getStatusClass: function (status) {
                if (!status)
                    return 'disable';
            },
            clickName: function (index) {
                $('table tbody tr:eq(' + index + ')').removeClass('not-received');
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        $('.modal-add .tab-pane').mCustomScrollbar({
            theme: 'dark-3',
        });
        vm.query();
        avalon.scan(document.body);
    });
});