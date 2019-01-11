$(function () {
    window.dAddVm = null;
    var xueShuDetails;
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            model: {},
            title: '',
            editType: vm.editType,
            patentType: [],
            patentLevel: [],
            files: [],
            shenHe: [],
            projectList: [],
            info: {
                基本资料: {
                    编号: 0,
                    专利名称: '',
                    专利国别: '',
                    专利类型: '',
                    专利范围: '',
                    是否授权: true,
                    代理机构: '',
                    年度: new Date().getFullYear(),
                    专利权人名称: '',
                    申请号: '',
                    申请日期: '',
                    公开号: '',
                    公开日期: '',
                    授权机构: '',
                    专利号: '',
                    国际专利主分类号: '',
                    授权公告日: '',
                    证书号: '',
                    是否职务发明: true,
                    是否生效: true,
                    发明人数: 0,
                    奖励金额: 0,
                    超额费用: 0,
                    超额费用来源: '',
                    专利摘要: '',
                    备注: '',
                    相关文件路径: '',
                    代理费金额: 0,
                    代理费发票号: '',
                    代理费付款日期: '',
                    代理资助金额: 0,
                    代理办理资助日期: '',
                    代理费到账日期: '',
                    申请费是否减缓: true,
                    申请费金额: 0,
                    申请费收据号: '',
                    申请费支付日期: '',
                    申请费资助金额: 0,
                    申请费办理资助日期: '',
                    申请费到账日期: '',
                    申请审查费是否延缓: true,
                    申请审查费用: 0,
                    申请审查费收据编号: '',
                    申请审查费付款日期: '',
                    申请审查费资助金额: 0,
                    申请审查费资助日期: '',
                    申请审查费到账日期: '',
                    授权费是否减缓: true,
                    授权费用金额: 0,
                    授权费收据号: '',
                    授权费付款日期: '',
                    授权费资助金额: 0,
                    授权费办理资助日期: '',
                    授权费到账日期: ''
                },
                相关纵向项目编号: [],
                相关横向项目编号: [],
                作者: [],
                isHold: true
            },
            loadInfo: function () {
                if (dAddVm.editType) {
                    dAddVm.title = '修改专利';
                    xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
                    dAddVm.getPatentDetails(xueShuDetails.id);
                } else {
                    dAddVm.title = '添加专利';
                }
            },
            getPatentDetails: function (id) {
                Patent.getPatentDetails('get', id, function getPatentDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            dAddVm.shenHe = obj.审核情况;
                            for (var i in obj.专利详情) {
                                if (obj.专利详情[i] == null || obj.专利详情[i] == 'undefined') {
                                    obj.专利详情[i] = '';
                                }
                            }
                            obj.专利详情.申请日期 = obj.专利详情.申请日期.slice(0, 10);
                            obj.专利详情.申请日期 = obj.专利详情.申请日期.slice(0, 10);
                            obj.专利详情.公开日期 = obj.专利详情.公开日期.slice(0, 10);
                            obj.专利详情.授权公告日 = obj.专利详情.授权公告日.slice(0, 10);
                            obj.专利详情.代理费付款日期 = obj.专利详情.代理费付款日期.slice(0, 10);
                            obj.专利详情.代理办理资助日期 = obj.专利详情.代理办理资助日期.slice(0, 10);
                            obj.专利详情.代理费到账日期 = obj.专利详情.代理费到账日期.slice(0, 10);
                            obj.专利详情.申请费支付日期 = obj.专利详情.申请费支付日期.slice(0, 10);
                            obj.专利详情.申请费办理资助日期 = obj.专利详情.申请费办理资助日期.slice(0, 10);
                            obj.专利详情.申请费到账日期 = obj.专利详情.申请费到账日期.slice(0, 10);
                            obj.专利详情.申请审查费付款日期 = obj.专利详情.申请审查费付款日期.slice(0, 10);
                            obj.专利详情.申请审查费资助日期 = obj.专利详情.申请审查费资助日期.slice(0, 10);
                            obj.专利详情.申请审查费到账日期 = obj.专利详情.申请审查费到账日期.slice(0, 10);
                            obj.专利详情.授权费付款日期 = obj.专利详情.授权费付款日期.slice(0, 10);
                            obj.专利详情.授权费办理资助日期 = obj.专利详情.授权费办理资助日期.slice(0, 10);
                            obj.专利详情.授权费到账日期 = obj.专利详情.授权费到账日期.slice(0, 10);

                            dAddVm.info = {
                                基本资料: obj.专利详情,
                                相关纵向项目编号: [],
                                相关横向项目编号: [],
                                作者: obj.成果作者,
                                isHold: true
                            };
                            dAddVm.projectList = obj.成果项目;
                            if (obj.专利详情.相关文件路径 != '' && obj.专利详情.相关文件路径 != null) {
                                dAddVm.files = obj.专利详情.相关文件路径.split(',');
                            }

                            for (var j = 0; j < dAddVm.info.作者.length; j++) {
                                if (dAddVm.info.作者[j].工作量占比 == null) {
                                    dAddVm.info.作者[j].工作量占比 = '';
                                }
                            }
                        }
                    } else {
                        console.info('获取著作详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getPatentAuxiliaryData: function () {
                Patent.getPatentAuxiliaryData('get', function getPatentAuxiliaryDataListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.model = obj;
                        dAddVm.loadInfo();
                    } else {
                        console.info('获取辅助数据失败' + strErro);
                    }
                });
            },
            inputVal: function (name) {
                if ($(name).val() != '' && $(name).val() != 0) {
                    $(name).next().hide();
                    $(name).removeClass('error-input');
                    return true;
                } else {
                    $(name).next().show();
                    $(name).addClass('error-input');
                    return false;
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
            postData: function () {
                var name = dAddVm.inputVal('.paper-name');
                var patentType = dAddVm.inputVal('.patentType');
                var year = dAddVm.inputVal('.modal-add .year');
                var patentee = dAddVm.inputVal('.patentee');
                var requestNumber = dAddVm.inputVal('.request-number');
                var applyTime = dAddVm.inputVal('.apply-time');
                var publicNumber = dAddVm.inputVal('.public-number');
                var inventorNumber = dAddVm.inputVal('.inventor-number');
                var abstract = dAddVm.inputVal('.abstract');

                dAddVm.info.基本资料.相关文件路径 = dAddVm.files.join();
                dAddVm.info.相关横向项目编号 = [];
                dAddVm.info.相关纵向项目编号 = [];
                for (var i = 0; i < dAddVm.projectList.length; i++) {
                    if (dAddVm.projectList[i].项目类型名称 == '横向项目') {

                        dAddVm.info.相关横向项目编号.push(dAddVm.projectList[i].项目编号);
                    }
                    if (dAddVm.projectList[i].项目类型名称 == '纵向项目') {
                        dAddVm.info.相关纵向项目编号.push(dAddVm.projectList[i].项目编号);
                    }
                }
                dAddVm.isRepeat(dAddVm.info.相关横向项目编号);
                dAddVm.isRepeat(dAddVm.info.相关纵向项目编号);
                if (!name) {
                    $.oaNotify.error(' 专利名称不能为空！');
                    return;
                }
                if (!patentType) {
                    $.oaNotify.error(' 专利类型不能为空！');
                    return;
                }
                if (!year) {
                    $.oaNotify.error(' 年度不能为空！');
                    return;
                }
                if (!patentee) {
                    $.oaNotify.error(' 专利权人名称不能为空！');
                    return;
                }
                if (!requestNumber) {
                    $.oaNotify.error(' 申请号不能为空！');
                    return;
                }
                if (!applyTime) {
                    $.oaNotify.error(' 申请日期不能为空！');
                    return;
                }
                if (!publicNumber) {
                    $.oaNotify.error(' 公开号不能为空！');
                    return;
                }
                if (!inventorNumber) {
                    $.oaNotify.error(' 发明人数不能为空！');
                    return;
                }
                if (!abstract) {
                    $.oaNotify.error(' 专利摘要不能为空！');
                    return;
                }
                if (dAddVm.files.length == 0) {
                    $.oaNotify.error(' 请上传相关文件！');
                    return;
                }
                if (dAddVm.info.作者.length > 0) {
                    var repeat = dAddVm.isRepeat();
                    if (repeat.isEmporty) {
                        $.oaNotify.error('发明人排序不能为空，请选择发明人排序！');
                        return;
                    }
                    if (repeat.repeat) {
                        $.oaNotify.error(repeat.notifyName + '所选择的排序重复，请重新选择!');
                        return;
                    }
                    if (!repeat.isFirst) {
                        $.oaNotify.error('发明人排序必须要有第一！');
                        return;
                    }
                } else {
                    $.oaNotify.error('发明人信息不能为空，请添加发明人！');
                    return;
                }
                if (dAddVm.editType) {
                    var data = {
                        步骤编号: xueShuDetails.步骤编号,
                        状态值: dAddVm.stateVal,
                        备注: '',
                        附加数据: dAddVm.info.$model
                    }
                    dAddVm.editPatent(data);
                } else {
                    dAddVm.addPatent(dAddVm.info.$model);
                }
            },
            isRepeat: function () {
                var obj = {
                    repeat: false,
                    isFirst: false,
                    isEmporty: false,
                    notifyName: '',
                };
                if (dAddVm.info.作者.length == 1) {
                    if (dAddVm.info.作者[0].作者级别 == '第一') {
                        obj.isFirst = true;
                    }
                }
                for (var i = dAddVm.info.作者.length - 1; i >= 0; i--) {
                    var targetNode = dAddVm.info.作者[i];
                    for (var j = 0; j < i; j++) {
                        if (targetNode.作者级别 == '' || dAddVm.info.作者[j].作者级别 == '') {
                            obj.isEmporty = true;
                            break;
                        }
                        if (targetNode.作者级别 == dAddVm.info.作者[j].作者级别) {
                            obj.repeat = true;
                            obj.notifyName += targetNode.姓名 + ',' + dAddVm.info.作者[j].姓名 + ',';
                            break;
                        }
                        if (targetNode.作者级别 == '第一' || dAddVm.info.作者[j].作者级别 == '第一') {
                            obj.isFirst = true;
                        }
                    }
                    if (obj.isEmporty) {
                        break;
                    }
                }
                return obj;
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
            addPatent: function (data) {
                Patent.addPatent('post', data, function addPatentListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editPatent: function (data) {
                Patent.editPatent('post', data, function editPatentListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            clickUpload: function (e) {
                console.info(e);
                var data = new FormData();
                data.append('coverFile', $('.fileUpload-box .input-file').get(0).files[0]);
                $('.fileUpload-box .loading').show();
                dAddVm.fileUpload(data);
            },
            fileUpload: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_PATENT_FILE,
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: data,
                    dataType: 'text',
                    beforeSend : function(request) {
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
    $('.form-year').datetimepicker({
        format: 'yyyy',
        todayBtn: 1,
        autoclose: 1,
        startView: 4,
        minView: 4,
        language: 'zh-CN',
    });
    dAddVm.getPatentAuxiliaryData();
});
