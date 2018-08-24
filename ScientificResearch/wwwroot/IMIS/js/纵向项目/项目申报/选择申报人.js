$(function () {
    window.choiceVm = null;
    var departmentTree = null;
    avalon.ready(function () {
        window.choiceVm = avalon.define({
            $id: 'choiceRoot',
            req: {
                Index: 1,
                Size: 10,
                LikeAllName: '',
                部门编号: '',
                是否启用: '',
                OrderType: false
            },
            total: '',
            model: [],
            arr: [],
            LikeValue: '',
            loaded: false,
            departmentName: '',
            query: function () {
                choiceVm.loaded = false;
                $.support.cors = true;
                User.getEnableUsersList('get', choiceVm.req.$model, function getEnableUsersListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.loaded = true;
                        choiceVm.total = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            $('.modal-choice .pager').hide();
                            choiceVm.model = [];
                            return;
                        } else {
                            obj = obj.list;
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].checked = false;
                            }
                            choiceVm.model = obj;
                            $('.modal-choice .pager').show();
                        }
                        $('.modal-choice .pager').mamPager({
                            pageSize: choiceVm.req.Size,                           //页大小
                            pageIndex: choiceVm.req.Index,                     //当前页
                            recordTotal: choiceVm.total,                      //数据总数
                            type: 1,
                            prevText: "&laquo;",                       //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                choiceVm.req.Index = index;
                                choiceVm.loaded = false;
                                choiceVm.allchecked = false;
                                choiceVm.query();
                            }
                        });
                        $('.modal-choice .bs-tooltip').tooltip();
                    } else {
                        console.info('获取' + mCategory + '列表失败！');
                        console.info(strErro);
                    }
                });
            },
            search: function () {
                choiceVm.req.Index = 1;
                choiceVm.query();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    choiceVm.search();
                }
            },
            delInput: function () {
                choiceVm.departmentName = '';
                choiceVm.req.部门编号 = '';
                choiceVm.search();
                choiceVm.hideMenu();
            },
            getDepartmentList: function () {
                var setting = {
                    data: {
                        key: {
                            name: '名称'
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
                        nodes = obj;
                        if (nodes != null) {
                            for (var i = 0, l = nodes.length; i < l; i++) {
                                nodes[i].id = nodes[i].编号;
                                nodes[i].pId = nodes[i].上级部门编号;
                            }
                            departmentTree = $.fn.zTree.init($('.modal-choice .departmentTree'), setting, nodes);
                        }
                    } else {
                        console.in('获取部门数据失败！' + strErro)
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
                    var cityObj = $('.modal-choice .departmentTree');
                    cityObj.val(text);
                    choiceVm.departmentName = treeNode.名称;
                    choiceVm.req.部门编号 = treeNode.id;
                    choiceVm.hideMenu();
                    choiceVm.search();
                }
            },
            hideMenu: function () {
                $('.modal-choice .menuContent').fadeOut('fast');
                $('body').unbind('mousedown', choiceVm.onBodyDown);
            },
            onBodyDown: function (event) {
                if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents(".department-box .menuContent").length > 0)) {
                    choiceVm.hideMenu();
                }
            },
            showMenu: function () {
                var obj = $('.modal-choice .departmentTree');
                var offset = $('.modal-choice .departmentTree').offset();
                $('.modal-choice .menuContent').css({
                    left: offset.left + 'px',
                    top: offset.top + obj.outerHeight() + 'px'
                }).slideDown('fast');

                $('body').bind('mousedown', choiceVm.onBodyDown);
            },
            clickChoice: function (el) {
                $('.modal-choice').modal('hide');
                dAddVm.info.基本资料.申报人编号 = el.编号;
                dAddVm.info.基本资料.姓名 = el.姓名;
                dAddVm.info.基本资料.负责人编号 = el.编号;
                dAddVm.info.基本资料.负责人姓名 = el.姓名;
                dAddVm.info.基本资料.项目负责人编号 = el.编号;
                dAddVm.info.基本资料.项目负责人姓名 = el.姓名;
                dAddVm.info.基本资料.项目负责人部门名称 = el.部门名称;
                dAddVm.info.基本资料.经办人编号 = el.编号;
                dAddVm.info.基本资料.经办人姓名 = el.姓名;
            }
        })
        $('.modal-choice .modal-body,.menuContent').mCustomScrollbar({
            theme: 'dark-3',
        });
        choiceVm.query();
        choiceVm.getDepartmentList();
        avalon.scan(document.body);
    });
});