$(function () {
    isOverdue();
    window.vm = null;
    var userInfo = JSON.parse(localStorage.info).data;
    var departmentTree;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                年度:'',
                部门编号:''
            },
            userInfo: userInfo,
            departmentId: '',
            department: '',
            total: '',
            model: [],
            nothing: false,
            loaded: false,
            data: {},
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                UsersStatistics.getMajorLevelStatisticsUsers('get', vm.req.$model, function getMajorLevelStatisticsUsersListener(success, obj, strErro) {
                    if (success) {
                        vm.loaded = true;
                        vm.total = obj.total;
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            vm.nothing = true;
                            return;
                        } else {
                            vm.model = obj;
                            vm.nothing = false;
                            vm.allchecked = false;
                        }
                    } else {
                        console.info('获取人员专业技术级别统计失败！');
                        console.info(strErro);
                    }
                });
            },
            search: function () {
                vm.query();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    vm.search();
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
            getClass: function (val) {
                if (val == '总计') {
                    return 'sum';
                }
            },
            printView: function () {
                $('.btn-printing,.screen-box,.chart-box').hide();
                window.print();
                $('.btn-printing,.screen-box,.chart-box').show();
            }
        });
        vm.search();
        vm.getTheDeparments();
        avalon.scan(document.body);
    });
});