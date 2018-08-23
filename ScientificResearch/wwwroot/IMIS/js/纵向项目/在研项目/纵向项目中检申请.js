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
            info: {
                基本资料: {
                    编号: xueShuDetails.id,
                    纵向项目编号: 0,
                    中检资料路径: ''
                },
                isHold: true
            },
            getYProjectMiddleInspectionDetails: function () {
                ResearchProject.getYProjectMiddleInspectionDetails('get', xueShuDetails.id,function getYProjectMiddleInspectionDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.model = {};
                            return;
                        } else {
                            dAddVm.model = obj;
                            if (obj.立项基本信息.伦理批文路径 != '' && obj.立项基本信息.伦理批文路径 != null) {
                                dAddVm.files = obj.立项基本信息.伦理批文路径.split(',');
                            }
                            if (obj.立项基本信息.立项文件路径 != '' && obj.立项基本信息.立项文件路径 != null) {
                                dAddVm.declareFiles = obj.立项基本信息.立项文件路径.split(',');
                            }
                        }

                    } else {
                        console.info('获取纵向项目中检详情失败！');
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
                dAddVm.info.基本资料.中检资料路径 = dAddVm.otherFiles.join();
                dAddVm.info.基本资料.纵向项目编号 = dAddVm.model.立项基本信息.编号;

                if (dAddVm.otherFiles.length == 0) {
                    $.oaNotify.error(' 请上传中检资料！');
                    return;
                }
                var data = {
                    步骤编号: xueShuDetails.步骤编号,
                    状态值: dAddVm.stateVal,
                    备注: '',
                    附加数据: dAddVm.info.$model
                }
                dAddVm.editYProjectMiddleInspection(data);

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
            editYProjectMiddleInspection: function (data) {
                ResearchProject.editYProjectMiddleInspection('post', data, function editProjectMiddleInspectionListener(success, obj, strErro) {
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
                    url: Code.URL_POST_UPLOAD_Y_PROJECT_MIDDLE_INSPECTION_FILE,
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
    dAddVm.getYProjectMiddleInspectionDetails();
});
