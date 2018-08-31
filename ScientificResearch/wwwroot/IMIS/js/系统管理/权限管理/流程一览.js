$(function () {
    isOverdue();
    window.vm = null;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                Index: 1,
                Size: 16,
                OrderType: false
            },
            total: '',
            model: [],
            nothing: false,
            loaded: false,
            allchecked: false,
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                WorkFlow.WorkFlowTotalList('get', vm.req.$model, function WorkFlowTotalListListener(success, obj, strErro) {
                    if (success) {
                        vm.loaded = true;
                        vm.total = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            vm.model = [];
                            vm.nothing = true;
                            return;
                        } else {
                            obj = obj.list;
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].checked = false;
                            }
                            vm.model = obj;
                            vm.nothing = false;
                            vm.allchecked = false;
                        }
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取办事流程列表失败！');
                        console.info(strErro);
                    }
                });
            },
            checkAll: function (e) {
                var checked = e.target.checked

                vm.model.forEach(function (el) {
                    el.checked = checked
                })
            },
            checkOne: function (e) {
                var checked = e.target.checked
                if (checked === false) {
                    vm.allchecked = false
                } else {
                    vm.allchecked = vm.model.every(function (el) {
                        return el.checked
                    })
                }
            },
            details: function (el) {
                var details = {
                    id: el.编号,
                    name: el.名称
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
                $('.modal-details .detailsPage').attr('src', vm.getUrl('/IMIS/views/系统管理/权限管理/流程详情.html'));
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
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