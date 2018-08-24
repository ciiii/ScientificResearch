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
            nothing: false,
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
                            choiceVm.nothing = true;
                            return;
                        } else {
                            obj = obj.list;
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].checked = false;
                            }
                            choiceVm.model = obj;
                            $('.modal-choice .pager').show();
                            choiceVm.nothing = false;
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
                                choiceVm.nothing = false;
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

                choiceVm.model.forEach(function (el) {
                    el.checked = checked
                })
            },
            checkOne: function (e) {
                var checked = e.target.checked
                if (checked === false) {
                    choiceVm.allchecked = false
                } else {
                    choiceVm.allchecked = choiceVm.model.every(function (el) {
                        return el.checked
                    });
                }
            },
            delInput: function () {
                choiceVm.departmentName = '';
                choiceVm.req.部门编号 = '';
                choiceVm.search();
                choiceVm.hideMenu();
            },
            batchChoice: function () {
                choiceVm.arr = [];
                for (var i = 0; i < choiceVm.model.length; i++) {
                    if (choiceVm.model[i].checked) {
                        var data = {
                            编号: choiceVm.model[i].编号,
                            姓名: choiceVm.model[i].姓名,
                            部门名称: choiceVm.model[i].部门名称,
                        }
                        choiceVm.arr.push(data);
                        dAddVm.users.push(data);
                        dAddVm.peopleArr.push(choiceVm.model[i].编号);
                    }
                }
                choiceVm.isRepeat(choiceVm.arr);
                choiceVm.isRepeat(dAddVm.users);
                choiceVm.isRepeatNumber(dAddVm.peopleArr);
                var arrNames = [];

                for (var i in choiceVm.arr) {
                    arrNames.push(choiceVm.arr[i].姓名);
                }
                if (dAddVm.people.length > 0) {
                    dAddVm.people = dAddVm.people + ',' + arrNames.join();
                } else {
                    dAddVm.people = arrNames.join();
                }

                if (choiceVm.arr.length > 0) {
                    $('.modal-choice').modal('hide');
                } else {
                    $.oaNotify.error('请先勾选！');
                }
            },
            isRepeat: function (newArr) {
                for (var i = newArr.length - 1; i >= 0; i--) {
                    var targetNode = newArr[i];
                    for (var j = 0; j < i; j++) {
                        if (targetNode.编号 == newArr[j].编号) {
                            newArr.splice(i, 1);
                            break;
                        }
                    }
                }
            },
            isRepeatNumber: function (newArr) {
                for (var i = newArr.length - 1; i >= 0; i--) {
                    var targetNode = newArr[i];
                    for (var j = 0; j < i; j++) {
                        if (targetNode == newArr[j]) {
                            newArr.splice(i, 1);
                            break;
                        }
                    }
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
                                nodes[i].pId = nodes[i].上级部门编号;
                            }
                            departmentTree = $.fn.zTree.init($('.choiceRoot .departmentTreeTwo'), setting, nodes);
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
                    var cityObj = $('.choiceRoot .department-box .departmentTreeTwo');
                    cityObj.val(text);
                    choiceVm.departmentName = treeNode.名称;
                    choiceVm.req.部门编号 = treeNode.id;
                    choiceVm.hideMenu();
                    choiceVm.search();
                }
            },
            hideMenu: function () {
                $('.choiceRoot .menuContent').fadeOut('fast');
                $('body').unbind('mousedown', choiceVm.onBodyDown);
            },
            onBodyDown: function (event) {
                if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents(".choiceRoot .menuContent").length > 0)) {
                    choiceVm.hideMenu();
                }
            },
            showMenu: function () {
                var obj = $('.choiceRoot .departmentTreeTwo');
                var offset = $('.choiceRoot .departmentTreeTwo').offset();
                $('.choiceRoot .menuContent').css({
                    left: offset.left + 'px',
                    top: offset.top + obj.outerHeight() + 'px'
                }).slideDown('fast');

                $('body').bind('mousedown', choiceVm.onBodyDown);
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