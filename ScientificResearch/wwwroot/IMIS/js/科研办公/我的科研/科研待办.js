$(function () {
    isOverdue();
    window.vm = null;
    var userInfo = JSON.parse(localStorage.info).data;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                Index: 1,
                Size: 16,
                Like流程名称: '',
                Like发起人姓名: '',
                Like项目名称: '',
                Begin流程创建时间: '',
                End流程创建时间: '',
                OrderType: false
            },
            userInfo: userInfo,
            name: '',
            time: '',
            title: '',
            post: '',
            startTime: '',
            endTime: '',
            total: '',
            model: [],
            MatterType: '',
            editType: false,
            nothing: false,
            loaded: false,
            allchecked: false,
            detailsUrl: '',
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                ScientificResearch.getScientificResearchUntreated('get', vm.req.$model, function getScientificResearchUntreatedListener(success, obj, strErro) {
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
                                obj[i].checked = false;
                                number++;
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
                        console.info('获取科研人员列表失败！');
                        console.info(strErro);
                    }
                });

            },
            search: function () {
                vm.req.Index = 1;
                vm.req.Like发起人姓名 = vm.name;
                vm.req.Like项目名称 = vm.title;
                vm.req.Like流程名称 = vm.MatterType;
                vm.req.Begin流程创建时间 = vm.startTime;
                vm.req.End流程创建时间 = vm.endTime + ' 23:59:59';
                vm.query();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    vm.search();
                }
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
            clickBtnEdit: function (el) {
                vm.editType = true;
                sessionStorage.editInfo = JSON.stringify(el.$model);
                var details = {
                    id: el.项目编号,
                    name: el.发起人姓名,
                    shenHeUrl: el.步骤链接路径,
                    步骤编号: el.步骤编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            details: function (el) {
                var details = {
                    id: el.项目编号,
                    name: el.发起人姓名,
                    shenHeUrl: el.步骤链接路径,
                    步骤编号: el.步骤编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
                $('.modal-details .detailsPage').attr('src', vm.getUrl(el.流程相关项目路径));
            },
            getStatusClass: function (name) {
                if (name.indexOf('申请') != -1) {
                    return 'btn-edit';
                } else {
                    if (name.indexOf('分配') != -1) {
                        return 'btn-users';
                    }
                    if (name.indexOf('报销') != -1) {
                        return 'btn-baoxiao';
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
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        $('.modal-add .tab-pane').mCustomScrollbar({
            theme: 'dark-3',
        });
        vm.search();
        avalon.scan(document.body);
    });
});