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
                Like主办人姓名: '',
                Like活动名称: '',
                OrderType: false
            },
            title: '',
            name: '',
            total: '',
            model: [],
            projectId: '',
            nothing: false,
            loaded: false,
            type: '',
            editType: false,
            detailsUrl: '',
            allchecked: false,
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                FundsReimbursement.getHostLectureReimbursementTotalList('get', vm.req.$model, function getHostLectureReimbursementTotalListListener(success, obj, strErro) {
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
                                obj[i].isAdd = false;
                                if (userInfo.人员.编号 == obj[i].主办人编号) {
                                    obj[i].isAdd = true;
                                }
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
                        console.info('获取主办讲座报销列表失败！');
                        console.info(strErro);
                    }
                });

            },
            search: function () {
                vm.req.Index = 1;
                vm.req.Like主办人姓名 = vm.name;
                vm.req.Like活动名称 = vm.title;
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
            info: function (el) {
                var details = {
                    项目名称: el.活动名称,
                    项目编号: el.编号,
                    项目负责人: el.主办人姓名,
                    项目负责人部门: el.主办人部门名称,
                    项目经费: el.活动经费,
                    已审核报销: el.已审核报销,
                    待审核报销: el.待审核报销,
                }
                sessionStorage.projectInfo = JSON.stringify(details);
            },
            clickBtnAdd: function (id) {
                vm.editType = false;
                vm.projectId = id;
                vm.type = 3;
            },
            clickBtnNext: function () {
                vm.editType = true;
            },
            details: function (el) {
                var details = {
                    id: el.编号,
                    name: el.活动名称,
                    shenHeUrl: el.步骤链接路径,
                    步骤编号: el.步骤编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
                $('.modal-details .detailsPage').attr('src', vm.getUrl('/IMIS/views/学术活动/申请学术讲座/主办讲座详情.html'));

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
