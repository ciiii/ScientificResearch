$(function () {
    window.dAddVm = null;
    var xueShuDetails;
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            model: {},
            title: '',
            files: [],
            projectInfo: {},
            editType: vm.editType,
            projectId: vm.projectId,
            type: vm.type,
            funds: 0,
            shenHe: [],
            info: {
                基本资料: {
                    编号: 0,
                    流程模板编号: 0,
                    项目编号: vm.projectId,
                    报销编号: '',
                    报销金额: 0,
                    报销方式: '',
                    公务卡号: '',
                    公务卡所属人姓名: '',
                    报销人编号: 0,
                    报销人姓名: '',
                    报销时间: '',
                    相关文件路径: '',
                    建立时间: '',
                    报销经费用途: ''
                },
                报销详情列表: [
                    {
                        编号: 0,
                        报销编号: 0,
                        项目支出类型: '',
                        项目支出内容: '',
                        财务科目: '',
                        报销金额: 0,
                        备注: ''
                    }
                ],
                isHold: true
            },
            loadInfo: function () {
                if (dAddVm.editType) {
                    dAddVm.title = '修改报销';
                    xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
                    dAddVm.getFundsReimbursementDetails();
                } else {
                    dAddVm.title = '添加报销';
                    var projectInfo = JSON.parse(sessionStorage.projectInfo);
                    dAddVm.projectInfo = projectInfo;
                    dAddVm.info.基本资料.项目编号 = dAddVm.projectId;
                    switch (dAddVm.type) {
                        case 0:
                            dAddVm.getYFundsReimbursementDetails();
                            break;
                        case 1:
                            dAddVm.getXFundsReimbursementDetails();
                            break;
                        case 2:
                            dAddVm.getMeetingFundsReimbursementDetails();
                            break;
                        case 3:
                            dAddVm.getHostLectureReimbursementDetails();
                            break;
                    }
                }
            },
            getFundsReimbursementDetails: function () {
                FundsReimbursement.getFundsReimbursementDetails('get', xueShuDetails.id, function getFundsReimbursementDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            dAddVm.model = obj;
                            obj.报销基本信息.报销时间 = obj.报销基本信息.报销时间.slice(0, 10);
                            for (var i in obj.报销基本信息) {
                                if (obj.报销基本信息[i] == null || obj.报销基本信息[i] == 'undefined') {
                                    obj.报销基本信息[i] = '';
                                }
                            }
                            for (var j = 0; j < obj.本次报销项目列表.length; j++) {
                                if (obj.本次报销项目列表[j].报销金额 == null) {
                                    obj.本次报销项目列表[j].报销金额 = 0;
                                }
                                if (obj.本次报销项目列表[j].编制依据 == null) {
                                    obj.本次报销项目列表[j].编制依据 = '';
                                }
                                obj.本次报销项目列表[j].备注 = obj.本次报销项目列表[j].编制依据;
                                dAddVm.funds += obj.本次报销项目列表[j].报销金额;
                            }
                            dAddVm.info.基本资料 = obj.报销基本信息;
                            dAddVm.info.报销详情列表 = obj.本次报销项目列表;
                            if (obj.报销基本信息.相关文件路径 != '' && obj.报销基本信息.相关文件路径 != null) {
                                dAddVm.files = obj.报销基本信息.相关文件路径.split(',');
                            }
                        }
                    } else {
                        console.info('获取某报销详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getYFundsReimbursementDetails: function () {
                FundsReimbursement.getYFundsReimbursementDetails('get', dAddVm.projectId, function getYFundsReimbursementDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info.报销详情列表 = [];
                            return;
                        } else {
                            for (var i = 0; i < obj.length; i++) {
                                if (obj[i].报销金额 == null) {
                                    obj[i].报销金额 = 0;
                                }
                                if (obj[i].编制依据 == null) {
                                    obj[i].编制依据 = '';
                                }
                                obj[i].备注 = obj[i].编制依据;
                            }
                            dAddVm.info.报销详情列表 = obj;
                        }

                    } else {
                        console.info('获取某纵向项目预算已报销详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getXFundsReimbursementDetails: function () {
                FundsReimbursement.getXFundsReimbursementDetails('get', dAddVm.projectId, function getXFundsReimbursementDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info.报销详情列表 = [];
                            return;
                        } else {
                            for (var i = 0; i < obj.length; i++) {
                                if (obj[i].报销金额 == null) {
                                    obj[i].报销金额 = 0;
                                }
                                if (obj[i].编制依据 == null) {
                                    obj[i].编制依据 = '';
                                }
                                obj[i].备注 = obj[i].编制依据;
                            }
                            dAddVm.info.报销详情列表 = obj;
                        }

                    } else {
                        console.info('获取某横向项目预算已报销详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getMeetingFundsReimbursementDetails: function () {
                FundsReimbursement.getMeetingFundsReimbursementDetails('get', dAddVm.projectId, function getMeetingFundsReimbursementDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info.报销详情列表 = [];
                            return;
                        } else {
                            for (var i = 0; i < obj.length; i++) {
                                if (obj[i].报销金额 == null) {
                                    obj[i].报销金额 = 0;
                                }
                                if (obj[i].编制依据 == null) {
                                    obj[i].编制依据 = '';
                                }
                                obj[i].备注 = obj[i].编制依据;
                            }
                            dAddVm.info.报销详情列表 = obj;
                        }

                    } else {
                        console.info('获取某参会预算已报销详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getHostLectureReimbursementDetails: function () {
                FundsReimbursement.getHostLectureReimbursementDetails('get', dAddVm.projectId, function getHostLectureReimbursementDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info.报销详情列表 = [];
                            return;
                        } else {
                            for (var i = 0; i < obj.length; i++) {
                                if (obj[i].报销金额 == null) {
                                    obj[i].报销金额 = 0;
                                }
                                if (obj[i].编制依据 == null) {
                                    obj[i].编制依据 = '';
                                }
                                obj[i].备注 = obj[i].编制依据;
                            }
                            dAddVm.info.报销详情列表 = obj;
                        }

                    } else {
                        console.info('获取某主办讲座预算已报销详情失败！');
                        console.info(strErro);
                    }
                });
            },
            changeFunds: function () {
                var funds = 0;
                for (var i = 0; i < dAddVm.info.报销详情列表.length; i++) {
                    dAddVm.info.报销详情列表[i].报销金额 = parseInt(dAddVm.info.报销详情列表[i].报销金额);
                    funds += dAddVm.info.报销详情列表[i].报销金额;
                }
                dAddVm.funds = funds;
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
            postData: function () {
                var ReimbursementType = dAddVm.inputVal('.modal .reimbursement-type');
                var ReimbursementNumber = dAddVm.inputVal('.modal .reimbursement-number');
                var ReimbursementMoney = dAddVm.inputVal('.modal .reimbursement-money');
                var time = dAddVm.inputVal('.modal .reach-time');
                var name = dAddVm.inputVal('.modal .people-name');
                dAddVm.info.基本资料.相关文件路径 = dAddVm.files.join();

                if (!ReimbursementType) {
                    $.oaNotify.error('请选择报销方式！');
                    return;
                }
                if (!ReimbursementNumber) {
                    $.oaNotify.error('报销编号不能为空！');
                    return;
                }
                /*if (!ReimbursementMoney) {
                    $.oaNotify.error('报销金额不能为空！');
                    return;
                } else {
                    dAddVm.info.基本资料.报销金额 = parseInt(dAddVm.info.基本资料.报销金额);
                }*/
                if (!time) {
                    $.oaNotify.error('报销日期不能为空！');
                    return;
                }
                if (!name) {
                    $.oaNotify.error('报销人不能为空！');
                    return;
                }
                dAddVm.info.基本资料.报销金额 = dAddVm.funds;
                if (dAddVm.editType) {
                    var data = {
                        步骤编号: xueShuDetails.步骤编号,
                        状态值: dAddVm.stateVal,
                        备注: '',
                        附加数据: dAddVm.info.$model
                    }
                    dAddVm.editFundsReimbursement(data);
                } else {
                    switch (dAddVm.type) {
                        case 0:
                            dAddVm.addYFundsReimbursement(dAddVm.info.$model);
                            break;
                        case 1:
                            dAddVm.addXFundsReimbursement(dAddVm.info.$model);
                            break;
                        case 2:
                            dAddVm.addMeetingFundsReimbursement(dAddVm.info.$model);
                            break;
                        case 3:
                            dAddVm.addHostLectureReimbursement(dAddVm.info.$model);
                            break;
                    }
                }
            },
            clickSubmit: function () {
                dAddVm.stateVal = 1;
                dAddVm.info.isHold = false;
                dAddVm.postData();
            },
            temporary: function () {
                dAddVm.stateVal = 1;
                dAddVm.info.isHold = true;
                dAddVm.postData();
            },
            clickStop: function () {
                dAddVm.stateVal = -2;
                dAddVm.info.isHold = false;
                dAddVm.postData();
            },
            addYFundsReimbursement: function (data) {
                FundsReimbursement.addYFundsReimbursement('post', data, function addYFundsReimbursementListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            addXFundsReimbursement: function (data) {
                FundsReimbursement.addXFundsReimbursement('post', data, function addXFundsReimbursementListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            addMeetingFundsReimbursement: function (data) {
                FundsReimbursement.addMeetingFundsReimbursement('post', data, function addMeetingFundsReimbursementListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            addHostLectureReimbursement: function (data) {
                FundsReimbursement.addHostLectureReimbursement('post', data, function addHostLectureReimbursementListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editFundsReimbursement: function (data) {
                FundsReimbursement.editFundsReimbursement('post', data, function editFundsReimbursementListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            clickUpload: function (e) {
                var data = new FormData();
                data.append('coverFile', $('.fileUpload-flie .input-file').get(0).files[0]);
                $('.fileUpload-flie .loading').show();
                dAddVm.fileUpload(data);
            },
            fileUpload: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_FUNDS_REIMBURSEMENT_FILE,
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
                            for (var i = 0; i < e.data.length; i++) {
                                dAddVm.files.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-flie .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-flie .loading').hide();
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
                $('.modal-add').modal('hide');
            }
        });
        avalon.scan(document.body);
    });

    $('.modal-add .tab-pane').mCustomScrollbar({
        theme: 'dark-3',
    });
    $('.modal-add .form-time').datetimepicker({
        format: 'yyyy-mm-dd',
        minView: "month",
        todayBtn: 1,
        autoclose: 1,
        language: 'zh-CN'
    });
    dAddVm.loadInfo();
});
