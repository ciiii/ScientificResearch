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
                    到账单位: '',
                    经办人编号: 0,
                    经办人姓名: 0,
                    到账凭证路径: '',
                    备注: ''
                },
                isHold: true
            },
            loadInfo: function () {
                if (dAddVm.editType) {
                    dAddVm.title = '修改到账';
                    dAddVm.getYFundsIncomingDetails();
                } else {
                    dAddVm.title = '添加到账';
                    dAddVm.info.基本资料.项目编号 = dAddVm.projectId;
                    dAddVm.getYProjectEstablishDetails();
                }
            },
            getYFundsIncomingDetails: function () {
                FundsIncoming.getYFundsIncomingDetails('get', xueShuDetails.id, function getYFundsIncomingDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            obj.纵向项目立项详情.项目分类 = obj.纵向项目立项详情.分类名称;
                            dAddVm.model = obj;
                            obj.纵向项目到账详情.到账日期 = obj.纵向项目到账详情.到账日期.slice(0, 10);
                            for (var i in obj.纵向项目到账详情) {
                                if (obj.纵向项目到账详情[i] == null || obj.纵向项目到账详情[i] == 'undefined') {
                                    obj.纵向项目到账详情[i] = '';
                                }
                            }
                            dAddVm.info.基本资料 = obj.纵向项目到账详情;

                            if (obj.纵向项目到账详情.到账凭证路径 != '' && obj.纵向项目到账详情.到账凭证路径 != null) {
                                dAddVm.files = obj.纵向项目到账详情.到账凭证路径.split(',');
                            }
                        }
                    } else {
                        console.info('获取纵向项目经费到账详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getYProjectEstablishDetails: function () {
                ProjectEstablish.getYProjectEstablishDetails('get', dAddVm.projectId, function getYProjectEstablishDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.model = [];
                            return;
                        } else {
                            obj.纵向项目立项详情 = obj.立项基本信息;
                            dAddVm.model = obj;
                        }

                    } else {
                        console.info('获取纵向项目立项详情失败！');
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
                    dAddVm.editYFundsIncoming(data);

                } else {
                    dAddVm.addYFundsIncoming(dAddVm.info.$model);
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
            addYFundsIncoming: function (data) {
                FundsIncoming.addYFundsIncoming('post', data, function addYFundsIncomingListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editYFundsIncoming: function (data) {
                FundsIncoming.editYFundsIncoming('post', data, function editYFundsIncomingListener(success, obj, strErro) {
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
