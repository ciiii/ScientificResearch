$(function () {
    window.addVm = null;
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
            model: {},
            title: '',
            flieName: '',
            files: [],
            templateList: [],
            templateContent: [],
            funds: 0,
            userName: '',
            department: '',
            title: '',
            editType: vm.editType,
            subjectOne: [],
            types: [],
            shenHe: [],
            stateVal: '',
            info: {
                基本资料: {
                    编号: 0,
                    会议名称: '',
                    会议主办单位: '',
                    会议承办单位: '',
                    研讨领域: '',
                    学科类型: '',
                    会议地址: '',
                    会议开始时间: '',
                    会议结束时间: '',
                    往返时间: 0,
                    会议网址: '',
                    会议简介及申请理由: '',
                    申请人编号: userInfo.人员.编号,
                    申请人姓名: userInfo.人员.姓名,
                    申请人部门名称: userInfo.人员.部门名称,
                    参会相关文件路径: ''
                },
                经费预算列表: [],
                isHold: true
            },
            onLoad: function () {
                if (addVm.editType) {
                    addVm.title = '修改会议';
                    xueShuDetails = JSON.parse(sessionStorage.xueShuDetails)
                    addVm.getMeetingDetails(xueShuDetails.id);
                } else {
                    addVm.title = '添加会议';
                    addVm.getSubjectOne();
                    addVm.getMeetingType();
                    addVm.getTemplateList();
                }
            },
            getMeetingDetails: function (id) {
                Meeting.getMeetingDetails('get', id, function getMeetingDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            addVm.info = [];
                            return;
                        } else {
                            addVm.shenHe = obj.申请情况;
                            obj.参加会议详情.会议开始时间 = obj.参加会议详情.会议开始时间.slice(0, 10);
                            obj.参加会议详情.会议结束时间 = obj.参加会议详情.会议结束时间.slice(0, 10);
                            for (var i in obj.参加会议详情) {
                                if (obj.参加会议详情[i] == null || obj.参加会议详情[i] == 'undefined') {
                                    obj.参加会议详情[i] = '';
                                }
                            }
                            for (var j = 0; j < obj.财务信息.length; j++) {
                                addVm.funds += obj.财务信息[j].批准经费;
                            }
                            addVm.info = {
                                基本资料: obj.参加会议详情,
                                经费预算列表: obj.财务信息,
                                isHold: true
                            };
                            if (obj.参加会议详情.参会相关文件路径 != '' && obj.参加会议详情.参会相关文件路径 != null) {
                                addVm.files = obj.参加会议详情.参会相关文件路径.split(',');
                            }
                            addVm.getSubjectOne();
                            addVm.getMeetingType();
                            addVm.getTemplateList();
                        }

                    } else {
                        console.info('获取会议详情失败！');
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
            getSubjectOne: function () {
                var data = {
                    上级编号: 0
                }
                Subject.getSubjectList('get', data, function getSubjectListListener(success, obj, strErro) {
                    if (success) {
                        addVm.subjectOne = obj;
                    } else {
                        console.info('获取一级学科失败！');
                        console.info(strErro);
                    }
                })
            },
            getMeetingType: function () {
                Dictionary.getDictionaryList('get', '学术活动类型', function getDictionaryListListener(success, obj, strErro) {
                    if (success) {
                        addVm.types = obj;

                    } else {
                        console.info('获取学术活动类型失败：' + strErro);
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
                addVm.info.isHold = false;
                addVm.postData();
            },
            temporary: function () {
                addVm.stateVal = 1;
                addVm.info.isHold = true;
                addVm.postData();
            },
            clickStop: function () {
                addVm.stateVal = -2;
                addVm.info.isHold = false;
                addVm.postData();
            },
            postData: function () {
                var activityName = addVm.inputVal('.activity-name');
                var hostUnit = addVm.inputVal('.host-unit');
                var address = addVm.inputVal('.meeting-address');
                var starttime = addVm.inputVal('.start-time');
                var endTime = addVm.inputVal('.end-time');

                addVm.info.基本资料.参会相关文件路径 = addVm.files.join();
                if (addVm.info.经费预算列表.length == 0) {
                    $.oaNotify.error('请在参会预算里选择经费预算模板！');
                    return;
                } else {
                    for (var i = 0; i < addVm.info.经费预算列表.length; i++) {
                        addVm.info.经费预算列表[i].批准经费 = parseInt(addVm.info.经费预算列表[i].批准经费);
                    }
                }
                if (activityName && hostUnit && address && starttime && endTime) {
                    if (addVm.editType) {
                        var data = {
                            步骤编号: xueShuDetails.步骤编号,
                            状态值: addVm.stateVal,
                            备注: '',
                            附加数据: addVm.info.$model
                        }
                        addVm.editMeeting(data);

                    } else {
                        addVm.addMeeting(addVm.info.$model);
                    }
                }
            },
            addMeeting: function (data) {
                Meeting.addMeeting('post', data, function addMeetingListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editMeeting: function (data) {
                Meeting.editMeeting('post', data, function editMeetingListener(success, obj, strErro) {
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
                    url: Code.URL_POST_UPLOAD_MEETING_FILE,
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
            getHtmlDocName: function (url) {
                var arr = url.split('\\');
                return arr[arr.length - 1];
            },
            getUrl: function (url) {
                return decodeURI(url);
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        avalon.scan(document.body);
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
});