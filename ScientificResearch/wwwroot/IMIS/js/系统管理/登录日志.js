$(function () {
    isOverdue();
    window.vm = null;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                Index: 1,
                Size: 18,
                工号: '',
                Like姓名: '',
                Begin登录时间: '',
                End登录时间: ''
            },
            name: '',
            number: '',
            total: '',
            startTime: '',
            endTime: '',
            model: [],
            loaded: false,
            nothing: false,
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                Log.getLoginLog('get', vm.req.$model, function getLoginLogListener(success, obj, strErro) {
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
                            var number = (vm.req.Index - 1) * vm.req.Size + 1;
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].number = number;
                                number++;
                            }
                            vm.model = obj;
                            vm.nothing = false;
                            $('.pager').show();
                        }
                        $('.pager').mamPager({
                            pageSize: vm.req.Size,                           //页大小
                            pageIndex: vm.req.Index,                     //当前页
                            recordTotal: vm.total,                      //数据总数
                            type: 1,
                            prevText: "&laquo;",                       //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                vm.req.Index = index;
                                vm.loaded = false;
                                vm.query();
                            }
                        });
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取日志列表失败！');
                        console.info(strErro);
                    }
                });

            },
            search: function () {
                vm.req.Index = 1;
                vm.req.Like姓名 = vm.name;
                vm.req.工号 = vm.number;
                vm.req.Begin登录时间 = vm.startTime;
                if (vm.endTime != '') {
                    vm.req.End登录时间 = vm.endTime + ' 23:59:59';
                } else {
                    vm.req.End登录时间 = '';
                }
                vm.query();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    vm.search();
                }
            },
        });
        vm.query();
        avalon.scan(document.body);
    });
});