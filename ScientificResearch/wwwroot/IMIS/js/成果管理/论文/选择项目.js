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
            allchecked: false,
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
            batchChoice: function () {
                choiceVm.arr = [];
                for (var i = 0; i < choiceVm.model.length; i++) {
                    if (choiceVm.model[i].checked) {
                        var data = {
                            编号:0,
                            项目类型:choiceVm.model[i].项目类型,
                            项目编号: choiceVm.model[i].编号,
                            是否项目带来成果: true
                        }
                        dAddVm.info.作者.push(data);
                        dAddVm.arr.push(data);
                    }
                }
                if (choiceVm.arr.length > 0) {
                    $('.modal-choice').modal('hide');
                } else {
                    $.oaNotify.error('请先勾选！');
                }
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
                                // nodes[i].name = nodes[i].名称.replace(/\.n/g, '.');
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
                var data = {
                    编号:0,
                    项目类型:el.项目类型,
                    项目编号: el.编号,
                    是否项目带来成果: true
                }
                dAddVm.info.作者.push(data);
            },
            del: function () {
                choiceVm.departmentName = '';
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