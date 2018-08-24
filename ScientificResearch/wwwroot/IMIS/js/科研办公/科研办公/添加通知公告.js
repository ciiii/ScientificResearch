$(function () {
    window.addVm = null;
    var id;
    var departmentTree = null;
    var roleTree = null;
    var userName = JSON.parse(localStorage.info).data.人员.姓名;
    var um;
    var roleArr = [], departmentArr = [];
    var day = new Date();
    var Tomorrow = new Date(day.setTime(day.getTime() + 24 * 60 * 60 * 1000)).format('yyyy-MM-dd 00:00:00').slice(0, 10);
    var arrIds = [];
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            model: {},
            files: [],
            title: '',
            type: '普通通知',
            peopleType: 0,
            oldPeopleType: '',
            editType: vm.editType,
            deepartmentId: vm.deepartmentId,
            arr: [],
            name: '',
            department: '',
            role: '',
            people: '',
            peopleArr: [],
            users: [],
            loadInfo: function () {
                //实例化编辑器
                UM.delEditor('UMContent');
                um = UM.getEditor('UMContent');
                if (dAddVm.editType) {
                    dAddVm.title = '修改通知公告';
                    id = JSON.parse(sessionStorage.noticeId);
                    dAddVm.getDetails();
                } else {
                    dAddVm.title = '添加通知公告';
                    dAddVm.model = {
                        基本资料: {
                            编号: 0,
                            通知类型: '',
                            通知标识: '',
                            发送人编号: 0,
                            通知名称: '',
                            关闭时间: Tomorrow,
                            相关文件路径: '',
                            通知内容: '',
                            接收人数: 0,
                            已接收人数: 0,
                            是否启用: true,
                            建立时间: new Date().format('yyyy-MM-dd hh:mm:ss'),
                            备注: ''
                        },
                        通知公告接收条件列表: []
                    }
                    dAddVm.name = userName;
                    dAddVm.peopleType = 0;
                }
            },
            getDetails: function () {
                Notice.getNoticeDetails('get', id, function getNoticeDetailsListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.name = obj.通知公告.发送人姓名;
                        obj.通知公告.关闭时间 = obj.通知公告.关闭时间.slice(0, 10);

                        if (obj.通知公告.相关文件路径 != null && obj.通知公告.相关文件路径 != '') {
                            dAddVm.files = obj.通知公告.相关文件路径.split(',');
                        }

                        um.ready(function () {
                            um.setContent(obj.通知公告.通知内容);
                        });
                        dAddVm.type = obj.通知公告.通知类型;
                        var arr = [];

                        if (obj.接收条件.length > 0) {
                            dAddVm.peopleType = obj.接收条件[0].接收者类型;
                            dAddVm.oldPeopleType = obj.接收条件[0].接收者类型;

                            for (var i in obj.接收条件) {
                                arr.push(obj.接收条件[i].接收者名称);
                                arrIds.push(obj.接收条件[i].接收者编号);
                            }
                            arr = arr.join();
                        } else {
                            dAddVm.oldPeopleType = 0;
                        }
                        dAddVm.model = {
                            基本资料: obj.通知公告,
                            通知公告接收条件列表: obj.接收条件
                        }
                        switch (dAddVm.peopleType) {
                            case 0:
                                $('.configure-box').hide();
                                dAddVm.arrIds = '';
                                break;
                            case 10:
                                $('.configure-box').hide();
                                $('.configure-box:eq(2)').show();
                                dAddVm.people = arr;
                                dAddVm.peopleArr = arrIds;
                                break;
                            case 20:
                                $('.configure-box').hide();
                                $('.configure-box:eq(0)').show();
                                dAddVm.department = arr;
                                departmentArr = arrIds;
                                break;
                            case 30:
                                $('.configure-box').hide();
                                $('.configure-box:eq(1)').show();
                                dAddVm.role = arr;
                                roleArr = arrIds;
                                break;
                        }


                    } else {
                        console.info('获取通知详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            getHtmlDocName: function (url) {
                var arr = url.split('\\');
                return arr[arr.length - 1];
            },
            changePeopleType: function (val) {
                switch (val) {
                    case 0:
                        $('.configure-box').hide();
                        arrIds = [0];
                        break;
                    case 10:
                        $('.configure-box').hide();
                        $('.configure-box:eq(2)').show();
                        arrIds = dAddVm.peopleArr;
                        break;
                    case 20:
                        $('.configure-box').hide();
                        $('.configure-box:eq(0)').show();
                        arrIds = departmentArr;
                        break;
                    case 30:
                        $('.configure-box').hide();
                        $('.configure-box:eq(1)').show();
                        arrIds = roleArr;
                        break;
                }
                dAddVm.peopleType = parseInt(val);
            },
            showUser: function () {
                var url = dAddVm.getUrl('/IMIS/views/组织架构/选择人员.html');
                $.ajax({
                    url: url,
                    type: 'get',
                    success: function (data) {
                        $('.modal-choice .modal-dialog').html('');
                        $('.modal-choice .modal-dialog').append(data);
                    }
                });
            },
            getEnableDepartment: function () {
                var setting = {
                    check: {
                        enable: true,
                    },
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
                    view: {
                        dblClickExpand: false
                    },
                    callback: {
                        beforeClick: beforeClick,
                        onCheck: onCheck
                    }
                };
                var nodes = [];
                Department.getEnableDepartmentList('get', '', function getEnableDepartmentListListener(success, obj, strErro) {
                    if (success) {
                        nodes = obj.reverse();
                        if (nodes != null) {

                            for (var i = 0; i < nodes.length; i++) {

                                nodes[i].id = nodes[i].编号;
                                nodes[i].name = nodes[i].名称.replace(/\.n/g, '.');
                                nodes[i].pId = nodes[i].上级部门编号;
                            }
                            departmentTree = $.fn.zTree.init($('.departmentTree'), setting, nodes);
                        }
                    } else {
                        alert('获取部门列表数据失败');
                        console.info(strErro);
                    }
                });

                function beforeClick(treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("departmentTree");
                    zTree.checkNode(treeNode, !treeNode.checked, null, true);
                    return false;
                }

                function onCheck(e, treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("departmentTree");
                    var nodes = zTree.getCheckedNodes(true);
                    var text = [];
                    departmentArr = [];
                    for (var i = 0; i < nodes.length; i++) {
                        text.push(nodes[i].name);
                        departmentArr.push(nodes[i].id);
                    }
                    dAddVm.department = text.join();
                    arrIds = departmentArr;
                    console.info(departmentArr);
                }
            },
            getRole: function () {
                var setting = {
                    check: {
                        enable: true,
                    },
                    data: {
                        key: {
                            name: 'name'
                        },
                        simpleData: {
                            enable: true,
                            idKey: 'id'
                        },
                    },
                    view: {
                        dblClickExpand: false
                    },
                    callback: {
                        beforeClick: beforeClick,
                        onCheck: onCheck
                    }
                };
                var nodes = [];
                Role.getRoleList('get', function getRoleListListener(success, obj, strErro) {
                    if (success) {
                        nodes = obj.reverse();
                        if (nodes != null) {
                            for (var i = 0; i < nodes.length; i++) {
                                nodes[i].id = nodes[i].编号;
                                nodes[i].name = nodes[i].名称;
                            }
                            roleTree = $.fn.zTree.init($('.roleTree'), setting, nodes);
                        }
                    } else {
                        alert('获取职位列表数据失败');
                        console.info(strErro);
                    }
                });

                function beforeClick(treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("roleTree");
                    zTree.checkNode(treeNode, !treeNode.checked, null, true);
                    return false;
                }

                function onCheck(e, treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("roleTree");
                    var nodes = zTree.getCheckedNodes(true);
                    var text = [];
                    roleArr = [];
                    for (var i = 0; i < nodes.length; i++) {
                        text.push(nodes[i].name);
                        roleArr.push(nodes[i].id);
                    }
                    dAddVm.role = text.join();
                    arrIds = roleArr;
                    console.info(roleArr);
                }
            },
            hideMenu: function () {
                $('.modal .menuContent').fadeOut('fast');
                $('body').unbind('mousedown', dAddVm.onBodyDown);
            },
            onBodyDown: function (event) {
                if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents(".modal .menuContent").length > 0)) {
                    dAddVm.hideMenu();
                }
            },
            showMenu: function (name) {
                var cityObj = $(name);
                var cityOffset = $(name).offset();
                $(name).next().css({
                    left: cityOffset.left + "px",
                    top: cityOffset.top + cityObj.outerHeight() + "px"
                }).slideDown("fast");

                $("body").bind("mousedown", dAddVm.onBodyDown);
            },
            inputVal: function (name) {
                if ($(name).val() != '') {
                    $(name).next().hide();
                    $(name).removeClass('error-input');
                    return true;
                } else {
                    $(name).next().show();
                    $(name).addClass('error-input');
                    return false;
                }
            },
            clickSubmit: function () {
                if (dAddVm.peopleType == 10) {
                    arrIds = dAddVm.peopleArr;
                }
                if (dAddVm.peopleType == 0) {
                    arrIds = 0;
                }
                var newArr = [];
                for (var i = 0; i < arrIds.length; i++) {
                    var obj = {
                        编号: 0,
                        通知公告编号: dAddVm.model.基本资料.编号,
                        接收者类型: dAddVm.peopleType,
                        接收者编号: arrIds[i]
                    }
                    newArr.push(obj);
                }
                dAddVm.model.通知公告接收条件列表 = newArr;
                var noticeTitle = dAddVm.inputVal('.modal-add .notice-title');
                var endTime = dAddVm.inputVal('.modal-add .end-time');
                dAddVm.model.基本资料.相关文件路径 = dAddVm.files.join();
                dAddVm.model.基本资料.通知内容 = um.getContent();
                dAddVm.model.基本资料.通知类型 = dAddVm.type;
                if (!noticeTitle) {
                    $.oaNotify.error('通知名称不能为空！');
                    return;
                }
                if (!endTime) {
                    $.oaNotify.error('关闭时间不能为空！');
                    return;
                }
                if (dAddVm.model.通知公告接收条件列表.length == 0) {
                    $.oaNotify.error('接受者不能为空！');
                    return;
                }

                dAddVm.addNotice(dAddVm.model.$model);
            },
            clickUpload: function () {
                var data = new FormData();
                data.append('file', $("#input-file").get(0).files[0]);
                $('.loading').show();
                dAddVm.fileUpload(data);
            },
            fileUpload: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_NOTICE_FILE,
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: data,
                    dataType: 'text',
                    success: function (e) {
                        e = JSON.parse(e);
                        if (e.error) {
                            $.oaNotify.error(' 上传失败：' + e.error);
                        } else {
                            $.oaNotify.ok(' 上传成功!');
                            for (var i in e.data) {
                                dAddVm.files.push(e.data[i]);
                            }
                        }
                        $('.loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            addNotice: function (data) {
                Notice.addNotice('post', data, function addNoticeListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        dAddVm.loadInfo();
        avalon.scan(document.body);
    });
    $('.nav-tabs a').on('click', function (e) {
        e.preventDefault();
        $(this).tab('show');
    });
    $('.modal-add .modal-body').mCustomScrollbar({
        theme: 'dark-3',
    });
    $('.form-time').datetimepicker({
        format: 'yyyy-mm-dd',
        minView: "month", //选择日期后，不会再跳转去选择时分秒
        todayBtn: 1,
        autoclose: 1,
        startDate: Tomorrow, //开始时间
        language: 'zh-CN'
    });

    $('.menuContent').mCustomScrollbar({
        theme: 'dark-3'
    });
    dAddVm.getEnableDepartment();
    dAddVm.getRole();
});