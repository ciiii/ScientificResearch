$(function () {
    window.addVm = null;
    var departmentTree = null;
    var xueShuDetails;
    var userInfo = vm.userInfo;
    var templateId;
    avalon.ready(function () {
        window.addVm = avalon.define({
            $id: 'Add',
            req: {
                Index: 1,
                Size: 16,
                Like名称: '',
                OrderType: true
            },
            flieName: '',
            files: [],
            userName: '',
            department: '',
            title: '',
            editType: vm.editType,
            types: [],
            shenHe: [],
            stateVal: '',
            funds: 0,
            info: {
                基本资料: {
                    编号: 0,
                    活动名称: '',
                    所属部门编号: 0,
                    活动经费: 0,
                    会议类型: '',
                    活动对象: '',
                    开始时间: '',
                    结束时间: '',
                    主办人编号: userInfo.人员.编号,
                    主讲人姓名: '',
                    主讲人国别: '',
                    主讲人单位: '',
                    主讲人学位: '',
                    主讲人职称: '',
                    主讲人简历路径: '',
                    讲座地点: '',
                    内容概述: ''
                },
                经费预算列表: [],
                isHold: true
            },
            onLoad: function () {
                addVm.getMeetingType();
                if (addVm.editType) {
                    addVm.title = '修改讲座';
                    xueShuDetails = JSON.parse(sessionStorage.xueShuDetails)
                    addVm.getDetails(xueShuDetails.id);
                } else {
                    addVm.title = '添加讲座';
                    addVm.userName = userInfo.人员.姓名;
                    addVm.files = [];
                    addVm.getTemplateList();
                }
            },
            getDetails: function (id) {
                Lecture.getHostLectureDetails('get', id, function getHostLectureDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            addVm.info = [];
                            return;
                        } else {
                            addVm.shenHe = obj.审核情况;
                            obj.学术任职详情.开始时间 = obj.学术任职详情.开始时间.slice(0, 10);
                            obj.学术任职详情.结束时间 = obj.学术任职详情.结束时间.slice(0, 10);

                            for (var i in obj.学术任职详情) {
                                if (obj.学术任职详情[i] == null || obj.学术任职详情[i] == 'undefined') {
                                    obj.学术任职详情[i] = '';
                                }
                            }
                            if (obj.学术任职详情.主讲人简历路径 != '' && obj.学术任职详情.主讲人简历路径 != null) {
                                addVm.files = obj.学术任职详情.主讲人简历路径.split(',');
                            }
                            addVm.userName = obj.学术任职详情.主办人姓名;
                            if (obj.学术任职详情.所属部门名称 != null) {
                                addVm.department = obj.学术任职详情.所属部门名称;
                            }
                            for (var j = 0; j < obj.财务信息.length; j++) {
                                addVm.funds += obj.财务信息[j].批准经费;
                            }
                            addVm.info = {
                                基本资料: obj.学术任职详情,
                                经费预算列表: obj.财务信息,
                                isHold: true
                            };
                            $('.meeting-type').val(obj.学术任职详情.会议类型);

                            addVm.getMeetingType();
                            addVm.getTemplateList();
                        }

                    } else {
                        console.info('获取讲座详情失败！');
                        console.info(strErro);
                    }
                });
            },
            initMultiselect: function (obj) {
                $(obj).multiselect({
                    multiple: true,
                    buttonWidth: '100%',
                    maxHeight: '400px',
                    nonSelectedText: '请选择',
                    enableFiltering: true,//是否显示搜索
                    filterPlaceholder: '输入关键字...',
                    onChange: function (option, checked, select) {
                        templateId = $(option).val();
                        addVm.getTemplateTypesAndContent(templateId);
                    }
                });
            },
            getTemplateList: function () {
                ExpenditureTemplate.getTemplateList('get', addVm.req.$model, function getTemplateListListener(success, obj, strErro) {
                    if (success) {
                        addVm.total = obj.total;
                        obj = obj.list;
                        if (obj.length == 0) {
                            obj = [{name: '无数据', id: 0}];
                        }

                        addVm.initMultiselect('#template');
                        var options = [];
                        for (var i = 0; i < obj.length; i++) {
                            var option = {
                                label: obj[i].名称,
                                title: obj[i].名称,
                                value: obj[i].编号
                            }
                            options.push(option);
                        }
                        addVm.templateList = obj;
                        $('#template').multiselect('dataprovider', options);
                        if (templateId != 0 && templateId != null) {
                            $('#template').multiselect('select', templateId);
                        }
                        console.info(333)
                        console.info(templateId)
                        $('.multiselect-search').val(addVm.req.Like名称);
                        $('.multiselect-search').focus();
                        var pager = $('<li><div class="page paging text-center">' +
                            '<div class="pager paging"></div></div></li>');

                        $('.template-box .page').remove();
                        $('.multiselect-container.dropdown-menu').append(pager);

                        $('.multiselect-search').on('keyup', debounce(function () {
                            addVm.req.Like名称 = $(this).val();
                            addVm.req.Index = 1;
                            addVm.getTemplateList();
                        }, 500));

                        $('.template-box .pager').mamPager({
                            pageSize: addVm.req.Size,                           //页大小
                            pageIndex: addVm.req.Index,                     //当前页
                            recordTotal: addVm.total,                  //数据总数
                            type: 1,
                            prevText: "&laquo;",                       //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                addVm.req.Index = index;
                                addVm.getTemplateList();
                            }
                        });
                    } else {
                        console.info(strErro);
                    }
                });
            },
            getTemplateTypesAndContent: function (templateId) {
                ExpenditureTemplate.getTemplateTypesAndContent('get', templateId, function getTemplateTypesAndContentListener(success, obj, strErro) {
                    if (success) {
                        if (obj.length == 0) {
                            addVm.info.经费预算列表 = [];
                        }
                        for (var i = 0; i < obj.length; i++) {
                            var data = {
                                编号: 0,
                                项目支出类型: obj[i].项目支出类型,
                                项目支出内容: obj[i].项目支出内容,
                                财务科目: obj[i].财务科目,
                                批准经费: 0
                            }
                            addVm.info.经费预算列表.push(data);
                            addVm.funds = 0;
                        }
                    } else {
                        console.info(strErro);
                    }
                });
            },
            changeFunds: function () {
                var funds = 0;
                for (var i = 0; i < addVm.info.经费预算列表.length; i++) {
                    funds += parseInt(addVm.info.经费预算列表[i].批准经费);
                }
                addVm.funds = funds;
            },
            getHtmlDocName: function (url) {
                var arr = url.split('\\');
                return arr[arr.length - 1];
            },
            getMeetingType: function () {
                Dictionary.getDictionaryList('get', '会议类型', function getDictionaryListListener(success, obj, strErro) {
                    if (success) {
                        addVm.types = obj;
                        console.info('types');
                        console.info(obj);

                    } else {
                        console.info('获取会议类型失败：' + strErro);
                    }
                })
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
                addVm.stateVal = 1;
                addVm.postData();
            },
            temporary: function () {
                addVm.stateVal = 1;
                addVm.info.isHold = true;
                addVm.postData();
            },
            clickStop: function () {
                addVm.stateVal = -2;
                addVm.postData();
            },
            postData: function () {
                var activityName = addVm.inputVal('.activity-name');
                var department = addVm.inputVal('.department');
                var starttime = addVm.inputVal('.start-time');
                var endTime = addVm.inputVal('.end-time');

                addVm.info.基本资料.主讲人简历路径 = addVm.files.join();
                if (addVm.info.经费预算列表.length == 0) {
                    $.oaNotify.error('请在讲座预算里选择经费预算模板！');
                    return;
                } else {
                    for (var i = 0; i < addVm.info.经费预算列表.length; i++) {
                        addVm.info.经费预算列表[i].批准经费 = parseInt(addVm.info.经费预算列表[i].批准经费);
                    }
                }
                if (activityName && department && starttime && endTime) {
                    if (addVm.files.length > 0) {
                        if (addVm.editType) {
                            var data = {
                                步骤编号: xueShuDetails.步骤编号,
                                状态值: addVm.stateVal,
                                备注: '',
                                附加数据: addVm.info.$model
                            }
                            addVm.editHostLecture(data);

                        } else {
                            addVm.addHostLecture(addVm.info.$model);
                        }
                    } else {
                        $.oaNotify.error(' 请上传简历！');
                    }

                }
            },
            addHostLecture: function (data) {
                Lecture.addHostLecture('post', data, function addHostLectureListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editHostLecture: function (data) {
                Lecture.editHostLecture('post', data, function editHostLectureListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            clickUpload: function () {
                var data = new FormData();
                data.append('file', $("#input-file").get(0).files[0]);
                $('.fileUpload-box .loading').show();
                addVm.fileUpload(data);
            },
            fileUpload: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_SPONSOR_RESUME,
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: data,
                    dataType: 'text',
                    beforeSend: function (request) {
                        request.setRequestHeader('Authorization', JSON.parse(sessionStorage.Authorization));
                    },
                    success: function (e) {
                        e = JSON.parse(e);
                        if (e.error) {
                            $.oaNotify.error(' 上传失败：' + e.error);
                        } else {
                            $.oaNotify.ok(' 上传成功!');
                            addVm.type = true;
                            for (var i = 0; i < e.data.length; i++) {
                                addVm.files.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-box .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-box .loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            getEnableDepartment: function () {
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
                        nodes = obj.reverse();
                        if (nodes != null) {

                            for (var i = 0, l = nodes.length; i < l; i++) {

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
                    var cityObj = $('.department-box .department');
                    cityObj.val(text);
                    addVm.info.基本资料.所属部门编号 = treeNode.编号;
                    addVm.department = treeNode.名称;
                    addVm.hideMenu();
                }
            },
            hideMenu: function () {
                $('.department-box #menuContent').fadeOut('fast');
                $('body').unbind('mousedown', addVm.onBodyDown);
            },
            onBodyDown: function (event) {
                if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents(".department-box #menuContent").length > 0)) {
                    addVm.hideMenu();
                }
            },
            showMenu: function () {
                var obj = $('.department-box .department');
                var offset = $('.department-box .department').offset();
                $('.department-box #menuContent').css({
                    left: offset.left + 'px',
                    top: offset.top + obj.outerHeight() + 'px'
                }).slideDown('fast');

                $('body').bind('mousedown', addVm.onBodyDown);
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        $('.modal-add .tab-pane,.menuContent').mCustomScrollbar({
            theme: 'dark-3',
        });
        $('.form-time').datetimepicker({
            format: 'yyyy-mm-dd',
            minView: "month", //选择日期后，不会再跳转去选择时分秒
            todayBtn: 1,
            autoclose: 1,
            startDate: new Date(), //开始时间
            language: 'zh-CN'
        });
        addVm.onLoad();
        addVm.getEnableDepartment();
        avalon.scan(document.body);
    });
});
