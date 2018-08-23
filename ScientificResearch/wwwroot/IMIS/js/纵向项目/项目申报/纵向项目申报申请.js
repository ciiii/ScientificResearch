$(function () {
    window.dAddVm = null;
    var xueShuDetails;
    var userInfo = vm.userInfo;
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            model: {},
            title: '',
            editType: vm.editType,
            type: vm.type,
            files: [],
            declareFiles: [],
            shenHe: [],
            projectOne: [],
            projectTwo: [],
            projectThree: [],
            projectFour: [],
            oneSelect: '',
            twoSelect: '',
            threeSelect: '',
            info: {
                基本资料: {
                    编号: 0,
                    分类: 0,
                    项目名称: '',
                    申报人编号: userInfo.人员.编号,
                    姓名: userInfo.人员.姓名,
                    学科门类: '',
                    学科类型: '',
                    申报年度: new Date().getFullYear(),
                    项目类型: '',
                    项目级别: '',
                    项目来源单位: '',
                    项目类别: '',
                    申报时间: '',
                    申请经费: 0,
                    计划开始日期: '',
                    计划完成日期: '',
                    项目等级: '',
                    是否委托外单位进行实验或实验分析: true,
                    实验委托检测内容: '',
                    项目摘要: '',
                    是否需要伦理评审: true,
                    是否需要伦理批文: true,
                    伦理批文编号: '',
                    伦理批文路径: '',
                    项目申报书路径: '',
                    备注: '',
                    建立时间: '',
                    是否立项: false
                },
                参与人列表: [],
                isHold: true
            },
            loadInfo: function () {
                if (dAddVm.editType) {
                    dAddVm.title = '修改申报信息';
                    xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
                    dAddVm.getYDeclareDetails(xueShuDetails.id);
                } else {
                    dAddVm.title = '添加申报信息';
                    dAddVm.getProjectTypeOne();
                }
            },
            getYDeclareDetails: function (id) {
                Declare.getYDeclareDetails('get', id, function getPatentDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            dAddVm.shenHe = obj.审核记录;
                            obj.申报基本信息.申报时间 = obj.申报基本信息.申报时间.slice(0, 10);
                            obj.申报基本信息.计划开始日期 = obj.申报基本信息.计划开始日期.slice(0, 10);
                            obj.申报基本信息.计划完成日期 = obj.申报基本信息.计划完成日期.slice(0, 10);
                            for (var i in obj.申报基本信息) {
                                if (obj.申报基本信息[i] == null || obj.申报基本信息[i] == 'undefined') {
                                    obj.申报基本信息[i] = '';
                                }
                            }
                            dAddVm.info = {
                                基本资料: obj.申报基本信息,
                                参与人列表: obj.参与人信息,
                                isHold: true
                            };

                            if (obj.申报基本信息.伦理批文路径 != '' && obj.申报基本信息.伦理批文路径 != null) {
                                dAddVm.files = obj.申报基本信息.伦理批文路径.split(',');
                            }
                            if (obj.申报基本信息.项目申报书路径 != '' && obj.申报基本信息.项目申报书路径 != null) {
                                dAddVm.declareFiles = obj.申报基本信息.项目申报书路径.split(',');
                            }

                            for (var i in dAddVm.info.参与人列表) {
                                if (dAddVm.info.参与人列表[i].工作量占比 == null) {
                                    dAddVm.info.参与人列表[i].工作量占比 = '';
                                }
                            }
                            dAddVm.getProjectTypeOne();
                        }
                    } else {
                        console.info('获取纵向项目申报详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getAuxiliaryData: function () {
                Declare.getYDeclareAuxiliaryData('get', function getYDeclareAuxiliaryDataListener(success, obj, strErro) {
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
            postData: function () {
                var project = dAddVm.inputVal('.project-name');
                var declare = dAddVm.inputVal('.declare-name');
                var year = dAddVm.inputVal('.modal-add .year');
                var projectOne = dAddVm.inputVal('.projectOne');
                var projectTwo = dAddVm.inputVal('.projectTwo');
                var applyTime = dAddVm.inputVal('.apply-time');
                var funds = dAddVm.inputVal('.funds');
                var startTime = dAddVm.inputVal('.start-time');
                var endTime = dAddVm.inputVal('.end-time');

                dAddVm.info.基本资料.伦理批文路径 = dAddVm.files.join();
                dAddVm.info.基本资料.项目申报书路径 = dAddVm.declareFiles.join();

                if (!project) {
                    $.oaNotify.error(' 项目名称不能为空！');
                    return;
                }
                if (!declare) {
                    $.oaNotify.error(' 申报人不能为空！');
                    return;
                }
                if (!year) {
                    $.oaNotify.error(' 申报年度不能为空！');
                    return;
                }
                if (!projectOne) {
                    $.oaNotify.error(' 项目类型不能为空！');
                    return;
                }
                if (!projectTwo) {
                    $.oaNotify.error(' 项目级别不能为空！');
                    return;
                }
                if (!applyTime) {
                    $.oaNotify.error(' 申报时间不能为空！');
                    return;
                }
                if (!funds) {
                    $.oaNotify.error(' 申请经费不能为空！');
                    return;
                }
                if (!startTime) {
                    $.oaNotify.error(' 计划开始时间不能为空！');
                    return;
                }
                if (!endTime) {
                    $.oaNotify.error(' 计划完成时间不能为空！');
                    return;
                }
                if (dAddVm.declareFiles.length == 0) {
                    $.oaNotify.error(' 请上传项目申报书！');
                    return;
                }
                if (dAddVm.editType) {
                    var data = {
                        步骤编号: xueShuDetails.步骤编号,
                        状态值: dAddVm.stateVal,
                        备注: '',
                        附加数据: dAddVm.info.$model
                    }
                    dAddVm.editYDeclare(data);
                } else {
                    switch (dAddVm.type) {
                        case 0:
                            dAddVm.addYSRDeclare(dAddVm.info.$model)
                            break;
                        case 1:
                            dAddVm.addYSubjectDeclare(dAddVm.info.$model)
                            break;
                        case 2:
                            dAddVm.addYPersonnelDeclare(dAddVm.info.$model)
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
            addYSRDeclare: function (data) {
                Declare.addYSRDeclare('post', data, function addYSRDeclareListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            addYSubjectDeclare: function (data) {
                Declare.addYSubjectDeclare('post', data, function addYSubjectDeclareListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            addYPersonnelDeclare: function (data) {
                Declare.addYPersonnelDeclare('post', data, function addYPersonnelDeclareListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editYDeclare: function (data) {
                Declare.editYDeclare('post', data, function editYDeclareListener(success, obj, strErro) {
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
                    url: Code.URL_POST_UPLOAD_Y_DECLARE_ETHIC,
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
            clickUploadDeclare: function (e) {
                var data = new FormData();
                data.append('declareFile', $('.fileUpload-declare .input-file').get(0).files[0]);
                $('.fileUpload-declare .loading').show();
                dAddVm.fileUploadDeclare(data);
            },
            fileUploadDeclare: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_Y_DECLARE_FILE,
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
                                dAddVm.declareFiles.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-declare .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-declare .loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            getProjectTypeOne: function () {
                ProjectType.getProjectType('get', 0, function getProjectTypeListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.projectOne = obj;
                        if (dAddVm.editType) {
                            $('.projectOne').find("option:contains('" + dAddVm.info.基本资料.项目类型 + "')").attr("selected", true);
                            dAddVm.oneSelect = $('.projectOne').val();
                            if (dAddVm.oneSelect != null && dAddVm.oneSelect != '') {
                                dAddVm.getProjectTypeTwo(dAddVm.oneSelect);
                            }
                        }
                        $('.projectOne').on('change', function () {
                            dAddVm.oneSelect = $(this).val();
                            dAddVm.info.基本资料.项目类型 = $(".projectOne option:selected").text();
                            dAddVm.getProjectTypeTwo(dAddVm.oneSelect);
                        });
                    } else {
                        console.info('获取项目分类失败！');
                        console.info(strErro);
                    }
                })
            },
            getProjectTypeTwo: function (id) {
                ProjectType.getProjectType('get', id, function getProjectTypeListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.projectTwo = obj;
                        if (dAddVm.editType) {
                            $('.projectTwo').find("option:contains('" + dAddVm.info.基本资料.项目级别 + "')").attr("selected", true);
                            dAddVm.twoSelect = $('.projectTwo').val();
                            if (dAddVm.twoSelect != null && dAddVm.twoSelect != '') {
                                dAddVm.getProjectTypeThree(dAddVm.twoSelect);
                            }
                        }
                        $('.projectTwo').on('change', function () {
                            dAddVm.twoSelect = $(this).val();
                            dAddVm.info.基本资料.项目级别 = $(".projectTwo option:selected").text();
                            dAddVm.getProjectTypeThree(dAddVm.twoSelect);
                        });

                    } else {
                        console.info('获取项目级别失败！');
                        console.info(strErro);
                    }
                })
            },
            getProjectTypeThree: function (id) {
                ProjectType.getProjectType('get', id, function getProjectTypeListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.projectThree = obj;
                        if (dAddVm.editType) {
                            $('.projectThree').find("option:contains('" + dAddVm.info.基本资料.项目来源单位 + "')").attr("selected", true);
                            dAddVm.threeSelect = $('.projectThree').val();
                            if (dAddVm.threeSelect != null && dAddVm.threeSelect != '') {
                                dAddVm.getProjectTypefour(dAddVm.threeSelect);
                            }
                        }
                        $('.projectThree').on('change', function () {
                            dAddVm.threeSelect = $(this).val();
                            dAddVm.info.基本资料.项目来源单位 = $(".projectThree option:selected").text();
                            dAddVm.getProjectTypefour(dAddVm.threeSelect);
                        });
                    } else {
                        console.info('获取项目来源单位失败！');
                        console.info(strErro);
                    }
                })
            },
            getProjectTypefour: function (id) {
                ProjectType.getProjectType('get', id, function getProjectTypeListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.projectFour = obj;
                        if (dAddVm.editType) {
                            $('.projectFour').find("option:contains('" + dAddVm.info.基本资料.项目类别 + "')").attr("selected", true);
                        }
                    } else {
                        console.info('获取项目类别失败！');
                        console.info(strErro);
                    }
                })
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
    dAddVm.getAuxiliaryData();
});
