$(function () {
    window.dAddVm = null;
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            model: {},
            files: [],
            declareFiles: [],
            otherFiles: [],
            fundsA: '',
            fundsB: '',
            info: {
                基本资料: {
                    编号: xueShuDetails.id,
                    纵向项目编号: 0,
                    结题验收编号: 0,
                    结题验收时间: '',
                    结题验收是否合格: true,
                    结题验收参与人数: 0,
                    结题资料路径: '',
                    备注: ''
                },
                参与人列表: [],
                isHold: true
            },
            getYProjectConclusionDetails: function (id) {
                ResearchProject.getYProjectConclusionDetails('get', id, function getYProjectConclusionDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.model = {};
                            return;
                        } else {
                            dAddVm.model = obj;
                            for (var i in obj.项目结题信息) {
                                if (obj.项目结题信息[i] == null || obj.项目结题信息[i] == 'undefined') {
                                    obj.项目结题信息[i] = '';
                                }
                            }

                            if (obj.立项基本信息.伦理批文路径 != '' && obj.立项基本信息.伦理批文路径 != null) {
                                dAddVm.files = obj.立项基本信息.伦理批文路径.split(',');
                            }
                            if (obj.立项基本信息.立项文件路径 != '' && obj.立项基本信息.立项文件路径 != null) {
                                dAddVm.declareFiles = obj.立项基本信息.立项文件路径.split(',');
                            }
                            if (obj.项目结题信息.结题资料路径 != '' && obj.项目结题信息.结题资料路径 != null) {
                                dAddVm.otherFiles = obj.项目结题信息.结题资料路径.split(',');
                            }
                            obj.项目结题信息.结题验收时间 = obj.项目结题信息.结题验收时间.slice(0, 10);
                            dAddVm.info.基本资料 = obj.项目结题信息;
                            dAddVm.info.参与人列表 = obj.结题参与人信息;
                            dAddVm.fundsA = obj.立项基本信息.批准经费;
                            dAddVm.fundsB = obj.立项基本信息.配套经费;
                        }

                    } else {
                        console.info('获取纵向项目结题详情失败！');
                        console.info(strErro);
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
            postData: function () {
                dAddVm.info.基本资料.结题资料路径 = dAddVm.otherFiles.join();
                var acceptanceTime = dAddVm.inputVal('.acceptance-time');

                if (dAddVm.otherFiles.length == 0) {
                    $.oaNotify.error(' 请上传结题资料！');
                    return;
                }
                if (!acceptanceTime) {
                    $.oaNotify.error(' 结题验收时间不能为空！');
                    return;
                }
                dAddVm.info.基本资料.纵向项目编号 = dAddVm.model.项目结题信息.纵向项目编号;
                dAddVm.info.基本资料.结题验收参与人数 = dAddVm.info.参与人列表.length;
                var data = {
                    步骤编号: xueShuDetails.步骤编号,
                    状态值: dAddVm.stateVal,
                    备注: '',
                    附加数据: dAddVm.info.$model
                }
                dAddVm.editYProjectConclusion(data);

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
            editYProjectConclusion: function (data) {
                ResearchProject.editYProjectConclusion('post', data, function editProjectConclusionListener(success, obj, strErro) {
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
                    url: Code.URL_POST_UPLOAD_Y_PROJECT_CONCLUSION_FILE,
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
                                dAddVm.otherFiles.push(e.data[i]);
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
    dAddVm.getYProjectConclusionDetails(xueShuDetails.id);
});
