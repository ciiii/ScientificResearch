$(function () {
    window.choiceZJ = null;
    var departmentTree = null;
    avalon.ready(function () {
        window.choiceZJ = avalon.define({
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
                choiceZJ.loaded = false;
                $.support.cors = true;
                ExpertTalents.getExpertTalentshUsers('get', choiceZJ.req.$model, function getExpertTalentshUsersListener(success, obj, strErro) {
                    if (success) {
                        choiceZJ.loaded = true;
                        choiceZJ.total = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            $('.modal-choice .pager').hide();
                            choiceZJ.model = [];
                            return;
                        } else {
                            obj = obj.list;
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].checked = false;
                            }
                            choiceZJ.model = obj;
                            console.info(choiceZJ.model);
                            $('.modal-choice .pager').show();
                        }
                        $('.modal-choice .pager').mamPager({
                            pageSize: choiceZJ.req.Size,                           //页大小
                            pageIndex: choiceZJ.req.Index,                     //当前页
                            recordTotal: choiceZJ.total,                      //数据总数
                            type: 1,
                            prevText: "&laquo;",                       //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                choiceZJ.req.Index = index;
                                choiceZJ.loaded = false;
                                choiceZJ.allchecked = false;
                                choiceZJ.query();
                            }
                        });
                        $('.modal-add .bs-tooltip').tooltip();
                    } else {
                        console.info('获取' + mCategory + '列表失败！');
                        console.info(strErro);
                    }
                });
            },
            search: function () {
                choiceZJ.req.Index = 1;
                choiceZJ.query();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    choiceZJ.search();
                }
            },
            checkAll: function (e) {
                var checked = e.target.checked

                choiceZJ.model.forEach(function (el) {
                    el.checked = checked
                })
            },
            checkOne: function (e) {
                var checked = e.target.checked
                if (checked === false) {
                    choiceZJ.allchecked = false
                } else {
                    choiceZJ.allchecked = choiceZJ.model.every(function (el) {
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
                choiceZJ.arr = [];
                for (var i = 0; i < choiceZJ.model.length; i++) {
                    if (choiceZJ.model[i].checked) {
                        var data = {
                            编号: choiceZJ.model[i].编号,
                            姓名: choiceZJ.model[i].姓名,
                            部门名称: choiceZJ.model[i].部门名称,
                            岗位名称: choiceZJ.model[i].岗位名称,
                            学位: choiceZJ.model[i].学位
                        }
                        AssignorVm.experts.push(data);
                        choiceZJ.arr.push(data);
                    }
                }
                choiceZJ.isRepeat(AssignorVm.experts);
                if (choiceZJ.arr.length > 0) {
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
                    choiceZJ.departmentName = treeNode.名称;
                    choiceZJ.req.部门编号 = treeNode.id;
                    choiceZJ.hideMenu();
                    choiceZJ.search();
                }
            },
            hideMenu: function () {
                $('.modal-choice .menuContent').fadeOut('fast');
                $('body').unbind('mousedown', choiceZJ.onBodyDown);
            },
            onBodyDown: function (event) {
                if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents(".department-box .menuContent").length > 0)) {
                    choiceZJ.hideMenu();
                }
            },
            showMenu: function () {
                var obj = $('.modal-choice .departmentTree');
                var offset = $('.modal-choice .departmentTree').offset();
                $('.modal-choice .menuContent').css({
                    left: offset.left + 'px',
                    top: offset.top + obj.outerHeight() + 'px'
                }).slideDown('fast');

                $('body').bind('mousedown', choiceZJ.onBodyDown);
            },
            clickChoice: function (el) {
                $('.modal-choice').modal('hide');
                var data = {
                    编号: el.编号,
                    姓名: el.姓名,
                    部门名称: el.部门名称,
                    岗位名称: el.岗位名称,
                    学位: el.学位
                }
                AssignorVm.experts.push(data);
                choiceZJ.isRepeat(AssignorVm.experts);
            },
            del: function () {
                choiceZJ.departmentName = '';
            }
        })
        $('.menuContent').mCustomScrollbar({
            theme: 'dark-3',
        });
        choiceZJ.query();
        choiceZJ.getDepartmentList();
        avalon.scan(document.body);
    });
});