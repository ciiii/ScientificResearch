$(function () {
    window.dAddVm = null;
    var xueShuDetails;
    var sourceTree = null;
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            model: {},
            title: '',
            userInfo: vm.userInfo,
            editType: vm.editType,
            isReceive: vm.isReceive,
            infoFiles: [],
            contentFiles: [],
            otherFiles: [],
            subjectOne: [],
            subjectTwo: [],
            subjectThree: [],
            oneSelect: '',
            twoSelect: '',
            projectList: [],
            publication: {
                刊物名称: '',
                收录情况: '',
                影响因子: '',
                特征因子分值: '',
                期刊系列: '',
                JCR: '',
                CN: '',
                ISSN: '',
                编目名称: '',
                编目类别: ''
            },
            department: '',
            source: [],
            shenHe: [],
            info: {
                基本资料: {
                    编号: 0,
                    认领人编号: 0,
                    论文标题: '',
                    论文标题类型: '中文标题',
                    论文在线日期: '',
                    论文Online日期: '',
                    论文正式出版日期: '',
                    他引次数: '',
                    年度: new Date().getFullYear(),
                    收稿日期: '',
                    论文所属栏目: '',
                    版面费: '',
                    超额版面费: '',
                    超额费用来源: '',
                    奖励情况: '',
                    论文字数: '',
                    计划来源: '',
                    论文版面: '',
                    学科门类: '',
                    一级学科: '',
                    二级学科: '',
                    三级学科: '',
                    作者人数: '',
                    通讯作者: '',
                    文献类型: '',
                    关键字: '',
                    论文摘要: '',
                    备注: '',
                    刊物编号: '',
                    卷号: '',
                    期号: '',
                    页码范围起: '',
                    页码范围止: '',
                    论文类型: '',
                    是否与行业联合发表: true,
                    是否与地方联合发表: true,
                    是否与国际联合发表: true,
                    是否跨学科: true,
                    是否与本专业相关: true,
                    检索信息页相关文件路径: '',
                    论文正文路径: '',
                    其他相关文件路径: ''
                },
                相关纵向项目编号: [],
                相关横向项目编号: [],
                作者: [],
                isHold: true
            },
            loadInfo: function () {
                if (dAddVm.editType) {
                    dAddVm.title = '修改论文';
                    xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
                    dAddVm.getPaperDetails(xueShuDetails.id);
                } else {
                    dAddVm.title = '添加论文';
                    dAddVm.getSubjectOne();
                    dAddVm.getsourceTree();
                }
            },
            getPaperDetails: function (id) {
                Paper.getPaperDetails('get', id, function getPaperDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            dAddVm.shenHe = obj.审核情况;
                            for (var i in obj.论文详情) {
                                if (obj.论文详情[i] == null || obj.论文详情[i] == 'undefined') {
                                    obj.论文详情[i] = '';
                                }
                            }
                            obj.论文详情.论文正式出版日期 = obj.论文详情.论文正式出版日期.slice(0, 10);
                            obj.论文详情.论文在线日期 = obj.论文详情.论文Online日期.slice(0, 10);
                            obj.论文详情.收稿日期 = obj.论文详情.收稿日期.slice(0, 10);
                            dAddVm.info = {
                                基本资料: obj.论文详情,
                                相关纵向项目编号: [],
                                相关横向项目编号: [],
                                作者: obj.成果作者,
                                isHold: true
                            };
                            dAddVm.projectList = obj.成果项目;
                            dAddVm.publication.刊物名称 = obj.论文详情.刊物名称;
                            dAddVm.publication.影响因子 = obj.论文详情.影响因子;
                            dAddVm.publication.特征因子分值 = obj.论文详情.特征因子分值;
                            dAddVm.publication.期刊系列 = obj.论文详情.期刊系列;
                            dAddVm.publication.编目名称 = obj.论文详情.编目名称;
                            dAddVm.publication.编目类别 = obj.论文详情.编目类别;
                            dAddVm.publication.JCR = obj.论文详情.JCR分区;
                            dAddVm.publication.CN = obj.论文详情.CN号;
                            dAddVm.publication.ISSN = obj.论文详情.ISSN号;
                            if (obj.论文详情.检索信息页相关文件路径 != '' && obj.论文详情.检索信息页相关文件路径 != null) {
                                dAddVm.infoFiles = obj.论文详情.检索信息页相关文件路径.split(',');
                            }
                            if (obj.论文详情.论文正文路径 != '' && obj.论文详情.论文正文路径 != null) {
                                dAddVm.contentFiles = obj.论文详情.论文正文路径.split(',');
                            }
                            if (obj.论文详情.其他相关文件路径 != '' && obj.论文详情.其他相关文件路径 != null) {
                                dAddVm.otherFiles = obj.论文详情.其他相关文件路径.split(',');
                            }

                            for (var j = 0; j < dAddVm.info.作者.length; j++) {
                                if (dAddVm.info.作者[j].工作量占比 == null) {
                                    dAddVm.info.作者[j].工作量占比 = '';
                                }
                                if (dAddVm.info.作者[j].完成字数 == null) {
                                    dAddVm.info.作者[j].完成字数 = '';
                                }
                            }
                            dAddVm.info.基本资料.认领人编号 = dAddVm.userInfo.人员.编号;
                            dAddVm.info.基本资料.作者人数 = dAddVm.info.作者.length;
                            dAddVm.getSubjectOne();
                            dAddVm.getsourceTree();
                        }
                    } else {
                        console.info('获取讲座详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getPaperAuxiliaryData: function () {
                Paper.getPaperAuxiliaryData('get', function getPaperAuxiliaryDataListener(success, obj, strErro) {
                    if (success) {

                        dAddVm.model = obj;
                        dAddVm.sourceList = obj.计划来源分类.concat(obj.计划来源)
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
            getsourceTree: function () {
                var setting = {
                    data: {
                        key: {
                            name: 'name'
                        },
                        simpleData: {
                            enable: true,
                            idKey: 'id',
                            pIdKey: 'pId',
                            rootPId: 0
                        },
                    },
                    callback: {
                        onClick: onClick
                    }
                };
                var nodes = dAddVm.sourceList;
                if (nodes != null) {
                    for (var i = 0, l = nodes.length; i < l; i++) {
                        nodes[i].id = nodes[i].编号;
                        nodes[i].name = nodes[i].值.replace(/\.n/g, '.');
                        nodes[i].pId = nodes[i].上级编号;
                    }
                    sourceTree = $.fn.zTree.init($('.sourceTree'), setting, nodes);
                }

                function onClick(e, treeId, treeNode) {
                    var nodes = sourceTree.getSelectedNodes(),
                        text = '';
                    nodes.sort(function compare(a, b) {
                        return a.id - b.id;
                    });
                    for (var i = 0, l = nodes.length; i < l; i++) {
                        text += nodes[i].name + ",";
                    }
                    if (text.length > 0) text = text.substring(0, text.length - 1);
                    var cityObj = $('.department-box .sourceTree');
                    cityObj.val(text);
                    dAddVm.info.基本资料.计划来源 = treeNode.值;
                    dAddVm.hideMenu();
                }
            },
            hideMenu: function () {
                $('.department-box .menuContent').fadeOut('fast');
                $('body').unbind('mousedown', dAddVm.onBodyDown);
            },
            showMenu: function () {
                var obj = $('.department-box .sourceTree');
                var offset = $('.department-box .sourceTree').offset();
                $('.department-box .menuContent').css({
                    left: offset.left + 'px',
                    top: offset.top + obj.outerHeight() + 'px'
                }).slideDown('fast');

                $('body').bind('mousedown', dAddVm.onBodyDown);
            },
            onBodyDown: function (event) {
                if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents(".department-box .menuContent").length > 0)) {
                    dAddVm.hideMenu();
                }
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
                var paperName = dAddVm.inputVal('.paper-name');
                var formYear = dAddVm.inputVal('.form-year');
                dAddVm.info.基本资料.作者人数 = dAddVm.info.作者.length;
                dAddVm.info.基本资料.检索信息页相关文件路径 = dAddVm.infoFiles.join();
                dAddVm.info.基本资料.论文正文路径 = dAddVm.contentFiles.join();
                dAddVm.info.基本资料.其他相关文件路径 = dAddVm.otherFiles.join();
                dAddVm.info.基本资料.论文Online日期 = dAddVm.info.基本资料.论文在线日期;
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
                if (paperName && formYear) {
                    if (dAddVm.publication.刊物名称 != null) {
                        if (dAddVm.info.作者.length > 0) {
                            var repeat = dAddVm.isRepeat();
                            if (repeat.isEmporty) {
                                $.oaNotify.error('作者级别不能为空，请选择作者级别！');
                                return;
                            }
                            if (!repeat.repeat) {
                                if (repeat.isFirst) {
                                    if (dAddVm.editType) {
                                        if (dAddVm.isReceive) {
                                            dAddVm.addPaper(dAddVm.info.$model);
                                        } else {
                                            var data = {
                                                步骤编号: xueShuDetails.步骤编号,
                                                状态值: dAddVm.stateVal,
                                                备注: '',
                                                附加数据: dAddVm.info.$model
                                            }
                                            dAddVm.editPaper(data);
                                        }
                                    } else {
                                        dAddVm.addPaper(dAddVm.info.$model);
                                    }
                                } else {
                                    $.oaNotify.error('必须要有第一作者！');
                                }
                            } else {
                                $.oaNotify.error(repeat.notifyName + '所选择的级别重复，请重新选择!');
                            }
                        } else {
                            $.oaNotify.error('作者信息不能为空，请添加作者！');
                        }
                    } else {
                        $.oaNotify.error(' 刊物信息不能为空，请选择刊物');
                    }
                } else {
                    $.oaNotify.error(' 论文标题、年度不能为空');
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
                    if (dAddVm.info.作者[0].作者级别 == '第一作者') {
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
                        if (targetNode.作者级别 == '第一作者' || dAddVm.info.作者[j].作者级别 == '第一作者') {
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
            addPaper: function (data) {
                Paper.addPaper('post', data, function addPaperListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editPaper: function (data) {
                Paper.editPaper('post', data, function editPaperListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            clickUploadInfo: function (e) {
                console.info(e);
                var data = new FormData();
                data.append('infoFile', $('.fileUpload-info .input-file').get(0).files[0]);
                $('.fileUpload-info .loading').show();
                dAddVm.fileUploadInfo(data);
            },
            fileUploadInfo: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_RETRIEVAL_INFO,
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
                                dAddVm.infoFiles.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-info .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-info .loading').hide();
                        $.oaNotify.error('上传失败：' + e.error);
                    }
                });
            },
            clickUploadContent: function () {
                var data = new FormData();
                data.append('contentFile', $('.fileUpload-content .input-file').get(0).files[0]);
                $('.fileUpload-content .loading').show();
                dAddVm.fileUploadContent(data);
            },
            fileUploadContent: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_PAPER,
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
                                dAddVm.contentFiles.push(e.data[i]);
                            }
                        }
                        $('.fileUpload-content .loading').hide();

                    }, error: function (e) {
                        e = JSON.parse(e);
                        $('.fileUpload-content .loading').hide();
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
                    url: Code.URL_POST_UPLOAD_PAPER_FILE,
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
        $('.modal-add .tab-pane,.menuContent').mCustomScrollbar({
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
        dAddVm.getPaperAuxiliaryData();
        avalon.scan(document.body);
    });


});
