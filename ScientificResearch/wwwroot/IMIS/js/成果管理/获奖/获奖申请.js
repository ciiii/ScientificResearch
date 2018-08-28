$(function () {
    window.dAddVm = null;
    var xueShuDetails;
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            model: {},
            title: '',
            editType: vm.editType,
            files: [],
            companyFiles: [],
            commentFiles: [],
            shenHe: [],
            projectList: [],
            info: {
                基本资料: {
                    编号: 0,
                    获奖名称: '',
                    获奖级别: '',
                    获奖日期: '',
                    获奖等级: '',
                    获奖类别: '',
                    奖励情况: '',
                    联系人: '',
                    联系人手机: '',
                    项目开始时间: '',
                    项目结束时间: '',
                    应用开始时间: '',
                    应用结束时间: '',
                    年度: new Date().getFullYear(),
                    批文时间: '',
                    颁奖单位: '',
                    完成人数: 0,
                    获奖证书编号: '',
                    完成单位数量: 0,
                    获奖摘要: '',
                    备注: '',
                    相关文件路径: '',
                    获奖单位文件路径: '',
                    获奖批文: ''
                },
                相关纵向项目编号: [],
                相关横向项目编号: [],
                作者: [],
                isHold: true
            },
            loadInfo: function () {
                if (dAddVm.editType) {
                    dAddVm.title = '修改获奖';
                    xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
                    dAddVm.getAwardDetails(xueShuDetails.id);
                } else {
                    dAddVm.title = '添加获奖';
                }
            },
            getAwardDetails: function (id) {
                Award.getAwardDetails('get', id, function getAwardDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            dAddVm.shenHe = obj.审核情况;
                            obj.获奖详情.著作出版日期 = obj.获奖详情.著作出版日期.slice(0, 10);
                            obj.获奖详情.isbN = obj.获奖详情.isbN号;
                            for (var i in obj.获奖详情) {
                                if (obj.获奖详情[i] == null || obj.获奖详情[i] == 'undefined') {
                                    obj.获奖详情[i] = '';
                                }
                            }
                            dAddVm.info = {
                                基本资料: obj.获奖详情,
                                相关纵向项目编号: [],
                                相关横向项目编号: [],
                                作者: obj.成果作者,
                                isHold: true
                            };
                            dAddVm.projectList = obj.成果项目;
                            if (obj.获奖详情.相关文件路径 != '' && obj.获奖详情.相关文件路径 != null) {
                                dAddVm.files = obj.获奖详情.相关文件路径.split(',');
                            }
                            if (obj.获奖详情.获奖单位文件路径 != '' && obj.获奖详情.获奖单位文件路径 != null) {
                                dAddVm.companyFiles = obj.获奖详情.获奖单位文件路径.split(',');
                            }
                            if (obj.获奖详情.获奖批文 != '' && obj.获奖详情.获奖批文 != null) {
                                dAddVm.commentFiles = obj.获奖详情.获奖批文.split(',');
                            }
                            for (var j = 0; j < dAddVm.info.作者.length; j++) {
                                if (dAddVm.info.作者[j].工作量占比 == null) {
                                    dAddVm.info.作者[j].工作量占比 = '';
                                }
                            }
                        }
                    } else {
                        console.info('获取获奖详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getAwardAuxiliaryData: function () {
                Award.getAwardAuxiliaryData('get', function getAwardAuxiliaryDataListener(success, obj, strErro) {
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
            tel: function () {
                var tel = $('.contacts-tel').val();
                //判断手机号码是否正确
                var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
                if (myreg.test(tel)) {
                    $('.contacts-tel').next().hide();
                    $('.contacts-tel').removeClass('error-input');
                    return true;
                } else {
                    $('.contacts-tel').next().show();
                    $('.contacts-tel').addClass('error-input');
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
                var name = dAddVm.inputVal('.award-name');
                var level = dAddVm.inputVal('.award-level');
                var time = dAddVm.inputVal('.award-time');
                var grade = dAddVm.inputVal('.award-grade');
                var contacts = dAddVm.inputVal('.contacts');
                var tel = dAddVm.tel();
                var year = dAddVm.inputVal('.award-year');
                var people = dAddVm.inputVal('.people');

                dAddVm.info.基本资料.相关文件路径 = dAddVm.files.join();
                dAddVm.info.基本资料.获奖单位文件路径 = dAddVm.companyFiles.join();
                dAddVm.info.基本资料.获奖批文 = dAddVm.commentFiles.join();
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
                    $.oaNotify.error('获奖名称不能为空！');
                    return;
                }
                if (!level) {
                    $.oaNotify.error('获奖级别不能为空！');
                    return;
                }
                if (!time) {
                    $.oaNotify.error('获奖日期不能为空！');
                    return;
                }

                if (!grade) {
                    $.oaNotify.error('获奖等级不能为空！');
                    return;
                }

                if (!contacts) {
                    $.oaNotify.error('联系人不能为空！');
                    return;
                }

                if (!tel) {
                    $.oaNotify.error('联系人手机号格式错误！');
                    return;
                }

                if (!year) {
                    $.oaNotify.error('年度不能为空！');
                    return;
                }

                if (!people) {
                    $.oaNotify.error('完成人数不能为空！');
                    return;
                }
                if (dAddVm.files.length == 0) {
                    $.oaNotify.error('请上传相关文件！');
                    return;
                }
                if (dAddVm.companyFiles.length == 0) {
                    $.oaNotify.error('请上传获奖单位文件！');
                    return;
                }
                if (dAddVm.commentFiles.length == 0) {
                    $.oaNotify.error('请上传获奖批文文件！');
                    return;
                }
                if (dAddVm.info.作者.length > 0) {
                    var repeat = dAddVm.isRepeat();
                    if (repeat.isEmporty) {
                        $.oaNotify.error('完成人员排序不能为空，请选择完成人员排序！');
                        return;
                    }
                    if (repeat.repeat) {
                        $.oaNotify.error(repeat.notifyName + '所选择的排序重复，请重新选择!');
                        return;
                    }
                    if (!repeat.isFirst) {
                        $.oaNotify.error('排序必须要有第一！');
                        return;
                    }
                } else {
                    $.oaNotify.error('完成人员信息不能为空，请添加完成人员！');
                    return;
                }
                if (dAddVm.editType) {
                    var data = {
                        步骤编号: xueShuDetails.步骤编号,
                        状态值: dAddVm.stateVal,
                        备注: '',
                        附加数据: dAddVm.info.$model
                    }
                    dAddVm.editAward(data);
                } else {
                    dAddVm.addAward(dAddVm.info.$model);
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
            addAward: function (data) {
                Award.addAward('post', data, function addAwardListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editAward: function (data) {
                Award.editAward('post', data, function editAwardListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            clickUploadFiles: function (e) {
                console.info(e);
                var data = new FormData();
                data.append('files', $('.fileUpload-files .input-file').get(0).files[0]);
                $('.fileUpload-files .loading').show();
                dAddVm.fileUploadFiles(data);
            },
            fileUploadFiles: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_AWARD_FILE,
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
                            for (var i = 0; i < e.data.length; i++) {
                                dAddVm.files.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-files .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-files .loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            clickUploadCompany: function () {
                var data = new FormData();
                data.append('companyFile', $('.fileUpload-company .input-file').get(0).files[0]);
                $('.fileUpload-company .loading').show();
                dAddVm.fileUploadCompany(data);
            },
            fileUploadCompany: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_AWARD_COMPANY,
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
                            for (var i = 0; i < e.data.length; i++) {
                                dAddVm.companyFiles.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-company .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-company .loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            clickUploadComment: function () {
                var data = new FormData();
                data.append('commentFile', $('.fileUpload-comment .input-file').get(0).files[0]);
                $('.fileUpload-comment .loading').show();
                dAddVm.fileUploadComment(data);
            },
            fileUploadComment: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_AWARD_COMMENT,
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
                            for (var i = 0; i < e.data.length; i++) {
                                dAddVm.commentFiles.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-comment .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-comment .loading').hide();
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
        dAddVm.getAwardAuxiliaryData();
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

});
