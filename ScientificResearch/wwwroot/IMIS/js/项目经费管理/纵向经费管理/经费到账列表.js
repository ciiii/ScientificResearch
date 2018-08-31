$(function () {
    isOverdue();
    window.vm = null;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req:{
                Index: 1,
                Size: 16,
                Like项目名称: '',
                Like经办人姓名: '',
                Like拨款单位: '',
                Like到账单位: '',
                Begin到账日期: '',
                End到账日期: '',
                状态: '',
                OrderType: false
            },
            title: '',
            name: '',
            fromCompany: '',
            reachCompany: '',
            total: '',
            model: [],
            startTime: '',
            endTime: '',
            nothing: false,
            loaded: false,
            editType: false,
            detailsUrl: '',
            allchecked: false,
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                FundsIncoming.getYFundsIncomingPagingList('get', vm.req.$model, function getYFundsIncomingPagingListListener(success, obj, strErro) {
                    if (success) {
                        vm.loaded = true;
                        vm.total = obj.list.length;
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
                        console.info('获取纵向项目经费列表失败！');
                        console.info(strErro);
                    }
                });

            },
            search: function () {
                vm.req.Index = 1;
                vm.req.Like项目名称 = vm.title;
                vm.req.Like经办人姓名 = vm.name;
                vm.req.Like拨款单位 = vm.fromCompany;
                vm.req.Like到账单位 = vm.reachCompany;
                vm.req.Begin到账日期 = vm.startTime;
                vm.req.End到账日期 = vm.endTime;
                vm.query();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    vm.search();
                }
            },
            state: function () {
                var val = $('.screen-box .state').val();
                if (val != '') {
                    vm.req.状态 = parseInt(val);
                } else {
                    vm.req.状态 = '';
                }
                vm.search();
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
            info: function (el) {
                sessionStorage.editInfo = JSON.stringify(el.$model);
                var details = {
                    id: el.编号,
                    name: el.项目名称,
                    shenHeUrl: el.步骤链接路径,
                    步骤编号: el.步骤编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
            },
            clickBtnEdit: function (el) {
                vm.editType = true;
                if (el.步骤链接名称 == '专家评审') {
                    vm.expertAuditing = 1;
                }
            },
            details: function (el) {
                $('.modal-details .detailsPage').attr('src', vm.getUrl(el.流程相关项目路径));
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            getStatusClass: function (name) {
                if (name.indexOf('申请') != -1) {
                    return 'btn-edit';
                } else {
                    if (name.indexOf('分配') != -1) {
                        return 'btn-users';
                    } else {
                        return 'btn-examine';
                    }
                }
            },
            getClass: function (statue) {
                switch (statue) {
                    case '审核通过':
                        return 'state-mark';
                    case '审核不通过':
                        return 'state-overdue';
                    case '审核已终止':
                        return 'state-overdue';
                    case '待审核':
                        return 'state-accomplish';
                    case '待分配专家':
                        return 'state-accomplish';
                    case '待专家评审':
                        return 'state-accomplish';
                    default:
                        return '';
                }
            },
            batchExport: function () {
                $('.btn-export').attr('href', '');
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