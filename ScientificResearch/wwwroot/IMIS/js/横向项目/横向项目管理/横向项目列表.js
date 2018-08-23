$(function () {
    window.vm = null;
    if (localStorage.getItem('info') == null) {
        location.href = '/IMIS/views/login.html';
    }
    var userInfo = JSON.parse(localStorage.info).data;
    var departmentTree;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                Index: 1,
                Size: 16,
                Like合同名称: '',
                Like合同编号: '',
                Like负责人姓名: '',
                部门编号: '',
                Begin签订时间: '',
                End签订时间: '',
                状态:'',
                OrderType: false
            },
            userInfo: userInfo,
            title: '',
            name: '',
            number: '',
            departmentId: '',
            department: '',
            total: '',
            model: [],
            startTime: '',
            endTime: '',
            nothing: false,
            loaded: false,
            editType: false,
            detailsUrl: '',
            allchecked: false,
            data: {},
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                XProject.getXProjectList('get', vm.req.$model, function getXProjectListListener(success, obj, strErro) {
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
                        console.info('获取横向项目列表失败！');
                        console.info(strErro);
                    }
                });
            },
            search: function () {
                vm.req.Index = 1;
                vm.req.Like合同名称 = vm.title;
                vm.req.Like合同编号 = vm.number;
                vm.req.Like负责人姓名 = vm.name;
                vm.req.Begin签订时间 = vm.startTime;
                vm.req.End签订时间 = vm.endTime;
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
                }else{
                    vm.req.状态='';
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
                    name: el.合同名称,
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
                $('.modal-details .detailsPage').attr('src', vm.getUrl('/IMIS/views/横向项目/横向项目管理/横向项目详情.html'));
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            batchExport: function () {
                $('.btn-export').attr('href', '');
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
            getFeedbackClass: function (statue) {
                if (statue) {
                    return 'btn-feedback';
                }
            },
            getTheDeparments: function () {
                var setting = {
                    data: {
                        key: {
                            name: 'name'
                        },
                        simpleData: {
                            enable: true,
                            idKey: 'id',
                            pIdKey: 'pId',
                            rootPId: 0
                        },
                    },
                    callback: {
                        onClick: onClick
                    }
                };

                var nodes = [];
                Department.getEnableDepartmentList('get', '', function getEnableDepartmentListListener(success, obj, strErro) {
                    if (success) {
                        obj = obj.reverse();
                        if (obj != null) {
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].id = obj[i].编号;
                                obj[i].pId = obj[i].上级部门编号;
                                obj[i].name = obj[i].名称;
                            }

                            nodes = obj;
                            departmentTree = $.fn.zTree.init($('.departmentTree'), setting, nodes);
                        }
                    } else {
                        alert('获取部门列表数据失败');
                        console.info(strErro);
                    }
                });

                function onClick(e, treeId, treeNode) {
                    var nodes = departmentTree.getSelectedNodes(),
                        text = '';
                    nodes.sort(function compare(a, b) {
                        return a.id - b.id;
                    });
                    for (var i = 0, l = nodes.length; i < l; i++) {
                        text += nodes[i].name + ",";
                    }
                    if (text.length > 0) text = text.substring(0, text.length - 1);
                    var cityObj = $('.screen-box .department');
                    cityObj.val(text);
                    vm.req.部门编号 = treeNode.编号;
                    vm.department = treeNode.名称;
                    vm.hideMenu();
                    vm.query();
                }
            },
            hideMenu: function () {
                $('.screen-box #menuContent').fadeOut('fast');
                $('body').unbind('mousedown', vm.onBodyDown);
            },
            onBodyDown: function (event) {
                if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents(".screen-box #menuContent").length > 0)) {
                    vm.hideMenu();
                }
            },
            showMenu: function () {
                var obj = $('.screen-box .department');
                var offset = $('.screen-box .department').offset();
                $('.screen-box #menuContent').css({
                    left: offset.left + 'px',
                    top: offset.top + obj.outerHeight() + 'px'
                }).slideDown('fast');

                $('body').bind('mousedown', vm.onBodyDown);
                $('.screen-box .btn-del').show();
            },
            delInput: function () {
                vm.department = '';
                vm.req.部门编号 = '';
                vm.query();
                vm.hideMenu();
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        $('.modal-add .tab-pane').mCustomScrollbar({
            theme: 'dark-3',
        });
        vm.search();
        vm.getTheDeparments();
        avalon.scan(document.body);
    });
});