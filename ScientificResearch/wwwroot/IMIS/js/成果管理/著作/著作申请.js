$(function () {
    window.dAddVm = null;
    var xueShuDetails;
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            model: {},
            title: '',
            editType: vm.editType,
            coverFiles: [],
            copyrightFiles: [],
            prefaceFiles: [],
            catalogFiles: [],
            otherFiles: [],
            subjectOne: [],
            subjectTwo: [],
            subjectThree: [],
            oneSelect: '',
            twoSelect: '',
            shenHe: [],
            projectList: [],
            info: {
                基本资料: {
                    编号: 0,
                    著作名称: '',
                    出版社名称: '',
                    著作形式: '',
                    年度: new Date().getFullYear(),
                    著作出版日期: '',
                    isbN号: '',
                    著作字数: 0,
                    奖励情况: '',
                    出版地: '',
                    出版社级别: '',
                    著作类型: '',
                    是否译为外文: true,
                    语种: '',
                    学科门类: '',
                    一级学科: '',
                    二级学科: '',
                    三级学科: '',
                    作者人数: 0,
                    发行价: 0,
                    备注: '',
                    封面相关文件路径: '',
                    版权页相关文件路径: '',
                    前言页相关文件路径: '',
                    完整目录页相关文件路径: '',
                    其他相关文件路径: ''
                },
                相关纵向项目编号: [],
                相关横向项目编号: [],
                作者: [],
                isHold: true
            },
            loadInfo: function () {
                if (dAddVm.editType) {
                    dAddVm.title = '修改著作';
                    xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
                    dAddVm.getWorkDetails(xueShuDetails.id);
                } else {
                    dAddVm.title = '添加著作';
                    dAddVm.getSubjectOne();
                }
            },
            getWorkDetails: function (id) {
                Work.getWorkDetails('get', id, function getWorkDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            dAddVm.shenHe = obj.审核情况;
                            for (var i in obj.著作详情) {
                                if (obj.著作详情[i] == null || obj.著作详情[i] == 'undefined') {
                                    obj.著作详情[i] = '';
                                }
                            }
                            obj.著作详情.著作出版日期 = obj.著作详情.著作出版日期.slice(0, 10);
                            obj.著作详情.isbN = obj.著作详情.isbN号;
                            dAddVm.info = {
                                基本资料: obj.著作详情,
                                相关纵向项目编号: [],
                                相关横向项目编号: [],
                                作者: obj.成果作者,
                                isHold: true
                            };
                            dAddVm.projectList = obj.成果项目;
                            if (obj.著作详情.封面相关文件路径 != '' && obj.著作详情.封面相关文件路径 != null) {
                                dAddVm.coverFiles = obj.著作详情.封面相关文件路径.split(',');
                            }
                            if (obj.著作详情.版权页相关文件路径 != '' && obj.著作详情.版权页相关文件路径 != null) {
                                dAddVm.copyrightFiles = obj.著作详情.版权页相关文件路径.split(',');
                            }
                            if (obj.著作详情.前言页相关文件路径 != '' && obj.著作详情.前言页相关文件路径 != null) {
                                dAddVm.prefaceFiles = obj.著作详情.前言页相关文件路径.split(',');
                            }
                            if (obj.著作详情.完整目录页相关文件路径 != '' && obj.著作详情.完整目录页相关文件路径 != null) {
                                dAddVm.catalogFiles = obj.著作详情.完整目录页相关文件路径.split(',');
                            }
                            if (obj.著作详情.其他相关文件路径 != '' && obj.著作详情.其他相关文件路径 != null) {
                                dAddVm.otherFiles = obj.著作详情.其他相关文件路径.split(',');
                            }

                            for (var j = 0; j < dAddVm.info.作者.length; j++) {
                                if (dAddVm.info.作者[j].工作量占比 == null) {
                                    dAddVm.info.作者[j].工作量占比 = '';
                                }
                                if (dAddVm.info.作者[j].完成字数 == null) {
                                    dAddVm.info.作者[j].完成字数 = '';
                                }
                            }
                            dAddVm.getSubjectOne();
                            console.info(obj);
                            console.info(dAddVm.info);
                        }
                    } else {
                        console.info('获取著作详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getWorkAuxiliaryData: function () {
                Work.getWorkAuxiliaryData('get', function getWorkAuxiliaryDataListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.model = obj;
                        dAddVm.loadInfo();
                    } else {
                        console.info('获取辅助数据失败' + strErro);
                    }
                });
            },
            getSubjectOne: function () {
                var data = {
                    上级编号: 0
                }
                Subject.getSubjectList('get', data, function getSubjectListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.subjectOne = obj;
                        if (dAddVm.editType) {
                            $('.subjectOne').find("option:contains('" + dAddVm.info.基本资料.一级学科 + "')").attr("selected", true);
                            dAddVm.oneSelect = $('.subjectOne').val();
                            if (dAddVm.oneSelect != null && dAddVm.oneSelect != '') {
                                dAddVm.getSubjectTwo(dAddVm.oneSelect);
                            }
                        }
                        $('.subjectOne').on('change', function () {
                            dAddVm.oneSelect = $(this).val();
                            dAddVm.info.基本资料.一级学科 = $(".subjectOne option:selected").text();
                            dAddVm.getSubjectTwo(dAddVm.oneSelect);
                        });
                    } else {
                        console.info('获取一级学科失败！');
                        console.info(strErro);
                    }
                })
            },
            getSubjectTwo: function (id) {
                var data = {
                    上级编号: id
                }
                Subject.getSubjectList('get', data, function getSubjectListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.subjectTwo = obj;
                        if (dAddVm.editType) {
                            $('.subjectTwo').find("option:contains('" + dAddVm.info.基本资料.二级学科 + "')").attr("selected", true);
                            dAddVm.twoSelect = $('.subjectTwo').val();
                            if (dAddVm.twoSelect != null && dAddVm.twoSelect != '') {
                                dAddVm.getSubjectThree(dAddVm.twoSelect);
                            }
                        }
                        $('.subjectTwo').on('change', function () {
                            dAddVm.twoSelect = $(this).val();
                            dAddVm.info.基本资料.二级学科 = $(".subjectTwo option:selected").text();
                            dAddVm.getSubjectThree(dAddVm.twoSelect);
                        });

                    } else {
                        console.info('获取二级学科失败！');
                        console.info(strErro);
                    }
                })
            },
            getSubjectThree: function (id) {
                var data = {
                    上级编号: id
                }
                Subject.getSubjectList('get', data, function getSubjectListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.subjectThree = obj;
                        if (dAddVm.editType) {
                            $('.subjectThree').find("option:contains('" + dAddVm.info.基本资料.三级学科 + "')").attr("selected", true);
                        }
                    } else {
                        console.info('获取三级学科失败！');
                        console.info(strErro);
                    }
                })
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
                var press = dAddVm.inputVal('.press-name');
                var year = dAddVm.inputVal('.year');
                var time = dAddVm.inputVal('.publish-time');
                var isbN = dAddVm.inputVal('.form-isbN');
                var number = dAddVm.inputVal('.work-number');

                dAddVm.info.基本资料.isbN号 = dAddVm.info.基本资料.isbN;
                dAddVm.info.基本资料.封面相关文件路径 = dAddVm.coverFiles.join();
                dAddVm.info.基本资料.版权页相关文件路径 = dAddVm.copyrightFiles.join();
                dAddVm.info.基本资料.前言页相关文件路径 = dAddVm.prefaceFiles.join();
                dAddVm.info.基本资料.完整目录页相关文件路径 = dAddVm.catalogFiles.join();
                dAddVm.info.基本资料.其他相关文件路径 = dAddVm.otherFiles.join();
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
                    $.oaNotify.error('著作名称不能为空！');
                    return;
                }
                if (!press) {
                    $.oaNotify.error('出版社名称不能为空！');
                    return;
                }
                if (!year) {
                    $.oaNotify.error('年度不能为空！');
                    return;
                }
                if (!time) {
                    $.oaNotify.error('出版日期不能为空！');
                    return;
                }
                if (!isbN) {
                    $.oaNotify.error('ISBN号不能为空！');
                    return;
                }
                if (!number) {
                    $.oaNotify.error('著作字数不能为空！');
                    return;
                }
                if (dAddVm.info.基本资料.著作类型 == '') {
                    $.oaNotify.error(' 著作类型不能为空！');
                    return;
                }
                if (dAddVm.info.基本资料.语种 == '') {
                    $.oaNotify.error(' 语种类型不能为空！');
                    return;
                }
                if (dAddVm.coverFiles.length == 0) {
                    $.oaNotify.error(' 请上传封面相关文件！');
                    return;
                }
                if (dAddVm.copyrightFiles.length == 0) {
                    $.oaNotify.error(' 请上传版权页相关文件！');
                    return;
                }
                if (dAddVm.prefaceFiles.length == 0) {
                    $.oaNotify.error(' 请上传前言页相关文件！');
                    return;
                }
                if (dAddVm.catalogFiles.length == 0) {
                    $.oaNotify.error(' 请上传完整目录页相关文件！');
                    return;
                }
                if (dAddVm.info.作者.length > 0) {
                    var repeat = dAddVm.isRepeat();
                    if (repeat.isEmporty) {
                        $.oaNotify.error('作者级别不能为空，请选择作者级别！');
                        return;
                    }
                    if (repeat.repeat) {
                        $.oaNotify.error(repeat.notifyName + '所选择的级别重复，请重新选择!');
                        return;
                    }
                    if (!repeat.isFirst) {
                        $.oaNotify.error('必须要有主编！');
                        return;
                    }
                } else {
                    $.oaNotify.error('作者信息不能为空，请添加作者！');
                    return;
                }
                if (dAddVm.editType) {
                    var data = {
                        步骤编号: xueShuDetails.步骤编号,
                        状态值: dAddVm.stateVal,
                        备注: '',
                        附加数据: dAddVm.info.$model
                    }
                    dAddVm.editWork(data);
                } else {
                    dAddVm.addWork(dAddVm.info.$model);
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
                    if (dAddVm.info.作者[0].作者级别 == '主编') {
                        obj.isFirst = true;
                    }
                }
                for (var i = dAddVm.info.作者.length - 1; i >= 0; i--) {
                    var targetNode = dAddVm.info.作者[i];

                    for (var j = 0; j < i; j++) {

                        console.info(targetNode.姓名 + '   ' + targetNode.作者级别);
                        console.info(dAddVm.info.作者[j].姓名 + '   ' + dAddVm.info.作者[j].作者级别);

                        if (targetNode.作者级别 == '' || dAddVm.info.作者[j].作者级别 == '') {
                            obj.isEmporty = true;
                            break;
                        }
                        if (targetNode.作者级别 == dAddVm.info.作者[j].作者级别) {
                            obj.repeat = true;
                            obj.notifyName += targetNode.姓名 + ',' + dAddVm.info.作者[j].姓名 + ',';
                            break;
                        }
                        if (targetNode.作者级别 == '主编' || dAddVm.info.作者[j].作者级别 == '主编') {
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
            addWork: function (data) {
                Work.addWork('post', data, function addWorkListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editWork: function (data) {
                Work.editWork('post', data, function editWorkListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            clickUploadCover: function (e) {
                console.info(e);
                var data = new FormData();
                data.append('coverFile', $('.fileUpload-cover .input-file').get(0).files[0]);
                $('.fileUpload-cover .loading').show();
                dAddVm.fileUploadCover(data);
            },
            fileUploadCover: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_WORK_COVER,
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
                                dAddVm.coverFiles.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-cover .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-cover .loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            clickUploadCopyright: function () {
                var data = new FormData();
                data.append('copyrightFile', $('.fileUpload-copyright .input-file').get(0).files[0]);
                $('.fileUpload-copyright .loading').show();
                dAddVm.fileUploadCopyright(data);
            },
            fileUploadCopyright: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_WORK_COPYRIGHT,
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
                                dAddVm.copyrightFiles.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-copyright .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-copyright .loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            clickUploadPreface: function () {
                var data = new FormData();
                data.append('prefaceFile', $('.fileUpload-preface .input-file').get(0).files[0]);
                $('.fileUpload-preface .loading').show();
                dAddVm.fileUploadPreface(data);
            },
            fileUploadPreface: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_WORK_PREFACE,
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
                                dAddVm.prefaceFiles.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-preface .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-preface .loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            clickUploadCatalog: function () {
                var data = new FormData();
                data.append('catalogFile', $('.fileUpload-catalog .input-file').get(0).files[0]);
                $('.fileUpload-catalog .loading').show();
                dAddVm.fileUploadCatalog(data);
            },
            fileUploadCatalog: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_WORK_CATALOG,
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
                                dAddVm.catalogFiles.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-catalog .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-catalog .loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            clickUploadOther: function () {
                var data = new FormData();
                data.append('otherFiles', $('.fileUpload-other .input-file').get(0).files[0]);
                $('.fileUpload-other .loading').show();
                dAddVm.fileUploadOther(data);
            },
            fileUploadOther: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_WORK_OTHER,
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
                                dAddVm.otherFiles.push(e.data[i]);
                            }
                            dAddVm.otherFiles = e.data;
                        }
                        $('.fileUpload-other .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-other .loading').hide();
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
        dAddVm.getWorkAuxiliaryData();
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
