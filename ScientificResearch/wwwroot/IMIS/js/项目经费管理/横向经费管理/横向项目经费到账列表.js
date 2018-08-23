$(function () {
    window.vm = null;
    var id = parseInt(oa.getUrlParam('id'));
    var name = oa.getUrlParam('name');
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            total: '',
            model: [],
            startTime: '',
            endTime: '',
            name: name,
            projectId: id,
            nothing: false,
            loaded: false,
            editType: false,
            detailsUrl: '',
            allchecked: false,
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                FundsIncoming.getXFundsIncomingList('get', id, function getXFundsIncomingListListener(success, obj, strErro) {
                    if (success) {
                        vm.loaded = true;
                        vm.total = obj.length;
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            vm.nothing = true;
                            return;
                        } else {
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].checked = false;
                            }
                            vm.model = obj;
                            vm.nothing = false;
                            vm.allchecked = false;
                        }
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取某个横向项目经费列表失败！');
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
            clickBtnAdd: function () {
                vm.editType = false;
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