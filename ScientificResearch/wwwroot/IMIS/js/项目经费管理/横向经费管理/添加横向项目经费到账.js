$(function () {
    window.dAddVm = null;
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            model: {},
            title: '',
            files: [],
            editType: vm.editType,
            projectId: vm.projectId,
            shenHe: [],
            info: {
                基本资料: {
                    项目编号: 0,
                    拨款单位: '',
                    到账日期: '',
                    到账金额: 0,
                    技术交易额: 0,
                    管理费用: 0,
                    技术合同认定服务费: 0,
                    增值税: 0,
                    到账单位: '',
                    经办人编号: 0,
                    经办人姓名: '',
                    到账凭证路径: '',
                    备注: ''
                },
                isHold: true
            },
            loadInfo: function () {
                if (dAddVm.editType) {
                    dAddVm.title = '修改到账';
                    dAddVm.getXFundsIncomingDetails();
                } else {
                    dAddVm.title = '添加到账';
                    dAddVm.info.基本资料.项目编号 = dAddVm.projectId;
                    dAddVm.getXProjectDetails();
                }
            },
            getXFundsIncomingDetails: function () {
                FundsIncoming.getXFundsIncomingDetails('get', xueShuDetails.id, function getXFundsIncomingDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            dAddVm.model = obj;
                            obj.横向项目到账详情.到账日期 = obj.横向项目到账详情.到账日期.slice(0, 10);
                            for (var i in obj.横向项目到账详情) {
                                if (obj.横向项目到账详情[i] == null || obj.横向项目到账详情[i] == 'undefined') {
                                    obj.横向项目到账详情[i] = '';
                                }
                            }
                            dAddVm.info.基本资料 = obj.横向项目到账详情;

                            if (obj.横向项目到账详情.到账凭证路径 != '' && obj.横向项目到账详情.到账凭证路径 != null) {
                                dAddVm.files = obj.横向项目到账详情.到账凭证路径.split(',');
                            }
                        }
                    } else {
                        console.info('获取横向项目经费到账详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getXProjectDetails: function () {
                XProject.getXProjectDetails('get', dAddVm.projectId, function getXProjectDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.model = [];
                            return;
                        } else {
                            obj.横向项目立项详情 = obj.基本信息;
                            dAddVm.model = obj;
                        }

                    } else {
                        console.info('获取横向项目详情失败！');
                        console.info(strErro);
                    }
                });
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
                var fromCompany = dAddVm.inputVal('.modal .from-company');
                var money = dAddVm.inputVal('.modal .money');
                var transactionMoney = dAddVm.inputVal('.transaction-money');
                var manageMoney = dAddVm.inputVal('.manage-money');
                var serviceMoney = dAddVm.inputVal('.service-money');
                debugger;
                var tax = dAddVm.inputVal('.modal .tax');
                var time = dAddVm.inputVal('.modal .reach-time');
                var reachCompany = dAddVm.inputVal('.modal .reach-company');
                var name = dAddVm.inputVal('.modal .people-name');
                dAddVm.info.基本资料.到账凭证路径 = dAddVm.files.join();

                if (!fromCompany) {
                    $.oaNotify.error('拨款单位不能为空！');
                    return;
                }
                if (!money) {
                    $.oaNotify.error('到账金额不能为空！');
                    return;
                }
                if (!transactionMoney) {
                    $.oaNotify.error('技术交易额不能为空！');
                    return;
                }
                if (!manageMoney) {
                    $.oaNotify.error('管理费用不能为空！');
                    return;
                }
                if (!serviceMoney) {
                    $.oaNotify.error('技术合同认定服务费不能为空！');
                    return;
                }
                if (!tax) {
                    $.oaNotify.error('增值税不能为空！');
                    return;
                }
                if (!time) {
                    $.oaNotify.error('到账日期不能为空！');
                    return;
                }
                if (!reachCompany) {
                    $.oaNotify.error('到账单位不能为空！');
                    return;
                }
                if (!name) {
                    $.oaNotify.error('经办人不能为空！');
                    return;
                }
                if (dAddVm.files.length == 0) {
                    $.oaNotify.error(' 请上传到账凭证！');
                    return;
                }

                if (dAddVm.editType) {
                    var data = {
                        步骤编号: xueShuDetails.步骤编号,
                        状态值: dAddVm.stateVal,
                        备注: '',
                        附加数据: dAddVm.info.$model
                    }
                    dAddVm.editXFundsIncoming(data);

                } else {
                    dAddVm.addXFundsIncoming(dAddVm.info.$model);
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
            addXFundsIncoming: function (data) {
                FundsIncoming.addXFundsIncoming('post', data, function addXFundsIncomingListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editXFundsIncoming: function (data) {
                FundsIncoming.editXFundsIncoming('post', data, function editXFundsIncomingListener(success, obj, strErro) {
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
                    url: Code.URL_POST_UPLOAD_FUNDS_INCOMING_FILE,
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
