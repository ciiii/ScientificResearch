$(function () {
    window.dAddVm = null;
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
    var templateId;
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            req: {
                Index: 1,
                Size: 16,
                Like名称: '',
                OrderType: true
            },
            model: {},
            title: '',
            files: [],
            declareFiles: [],
            editType: vm.editType,
            shenHe: [],
            projectOne: [],
            projectTwo: [],
            projectThree: [],
            projectFour: [],
            oneSelect: '',
            twoSelect: '',
            threeSelect: '',
            templateList: [],
            templateContent: [],
            total: '',
            arr: [],
            info: {
                基本资料: {
                    编号: 0,
                    变更内容简介: '',
                    变更事由: '',
                    变更备注: '',
                    变更时间: '',
                    纵向项目编号: 0,
                    分类: 0,
                    项目登记情况: '',
                    项目编号: '',
                    项目中文名称: '',
                    项目英文名称: '',
                    项目分类: '',
                    成果归属部门: '',
                    负责人编号: 0,
                    立项年度: 0,
                    登记日期: '',
                    登记人编号: 0,
                    批准日期: '',
                    批准经费: 0,
                    配套经费: 0,
                    经费卡号: '',
                    项目等级: '',
                    计划开始日期: '',
                    计划完成日期: '',
                    学科门类: '',
                    学科类型: '',
                    研究类型: '',
                    项目类型: '',
                    项目级别: '',
                    项目来源单位: '',
                    项目类别: '',
                    档案编号: '',
                    财务简称: '',
                    亚类说明: '',
                    附注说明: '',
                    纵向项目合同类型: '',
                    国民经济行业: '',
                    合作形式: '',
                    社会经济目标: '',
                    是否需要伦理评审: true,
                    是否需要伦理批文: true,
                    伦理批文编号: '',
                    伦理批文时间: '',
                    伦理批文路径: '',
                    立项文件路径: '',
                    备注: '',
                    建立时间: ''
                },
                isHold: true
            },
            getYProjectEstablishDetails: function () {
                ProjectEstablish.getYProjectEstablishDetails('get', xueShuDetails.idB, function getYProjectEstablishDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            obj.立项基本信息.登记日期 = obj.立项基本信息.登记日期.slice(0, 10);
                            obj.立项基本信息.批准日期 = obj.立项基本信息.批准日期.slice(0, 10);
                            obj.立项基本信息.计划开始日期 = obj.立项基本信息.计划开始日期.slice(0, 10);
                            obj.立项基本信息.计划完成日期 = obj.立项基本信息.计划完成日期.slice(0, 10);
                            for (var i in obj.立项基本信息) {
                                if (obj.立项基本信息[i] == null || obj.立项基本信息[i] == 'undefined') {
                                    obj.立项基本信息[i] = '';
                                }
                            }
                            dAddVm.shenHe = obj.审核记录;
                            obj.立项基本信息.变更内容简介 = '';
                            obj.立项基本信息.变更事由 = '';
                            obj.立项基本信息.变更备注 = '';
                            obj.立项基本信息.变更时间 = '';
                            obj.立项基本信息.纵向项目编号 = xueShuDetails.idB;
                            obj.立项基本信息.isHold = true;
                            dAddVm.info.基本资料 = obj.立项基本信息;
                            dAddVm.info.基本资料.编号 = 0;
                            if (obj.立项基本信息.伦理批文路径 != '' && obj.立项基本信息.伦理批文路径 != null) {
                                dAddVm.files = obj.立项基本信息.伦理批文路径.split(',');
                            }
                            if (obj.立项基本信息.立项文件路径 != '' && obj.立项基本信息.立项文件路径 != null) {
                                dAddVm.declareFiles = obj.立项基本信息.立项文件路径.split(',');
                            }
                            dAddVm.getProjectTypeOne();
                            dAddVm.getTemplateList();
                        }

                    } else {
                        console.info('获取纵向项目立项详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getYProjectAlterationDetails: function () {
                ResearchProject.getYProjectAlterationDetails('get', xueShuDetails.id, function getYProjectAlterationDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            obj.变更后.登记日期 = obj.变更后.登记日期.slice(0, 10);
                            obj.变更后.批准日期 = obj.变更后.批准日期.slice(0, 10);
                            obj.变更后.计划开始日期 = obj.变更后.计划开始日期.slice(0, 10);
                            obj.变更后.计划完成日期 = obj.变更后.计划完成日期.slice(0, 10);
                            obj.变更时间 = obj.变更时间.slice(0, 10);
                            for (var i in obj.变更前) {
                                if (obj.变更前[i] != obj.变更后[i]) {
                                    var data = {
                                        名称: i,
                                        变更前: obj.变更前[i],
                                        变更后: obj.变更后[i],
                                    }
                                    dAddVm.arr.push(data);
                                }
                                if (obj.变更后[i] == null || obj.变更后[i] == 'undefined') {
                                    obj.变更后[i] = '';
                                }
                            }
                            dAddVm.shenHe = obj.审核记录;
                            obj.变更后.变更内容简介 = obj.变更内容简介;
                            obj.变更后.变更事由 = obj.变更事由;
                            obj.变更后.变更备注 = obj.变更备注;
                            obj.变更后.变更时间 = obj.变更时间;
                            obj.变更后.纵向项目编号 = obj.变更后.编号;
                            obj.变更后.isHold = true;
                            dAddVm.info.基本资料 = obj.变更后;
                            dAddVm.info.基本资料.编号 = obj.编号;

                            if (obj.变更后.伦理批文路径 != '' && obj.变更后.伦理批文路径 != null) {
                                dAddVm.files = obj.变更后.伦理批文路径.split(',');
                            }
                            if (obj.变更后.立项文件路径 != '' && obj.变更后.立项文件路径 != null) {
                                dAddVm.declareFiles = obj.变更后.立项文件路径.split(',');
                            }
                            dAddVm.getProjectTypeOne();
                            dAddVm.getTemplateList();

                        }
                    } else {
                        console.info('获取纵向项目变更详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getYProjectAuxiliaryData: function () {
                ProjectEstablish.getYProjectAuxiliaryData('get', function getYProjectAuxiliaryDataListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.model = obj;
                        if (dAddVm.editType) {
                            dAddVm.title = '完善变更资料';
                            dAddVm.getYProjectAlterationDetails();
                        } else {
                            dAddVm.title = '项目变更申请';
                            dAddVm.getYProjectEstablishDetails();
                        }

                    } else {
                        console.info('获取辅助数据失败' + strErro);
                    }
                });
            },
            initMultiselect: function (obj) {
                $(obj).multiselect({
                    multiple: true,
                    buttonWidth: '100%',
                    maxHeight: '400px',
                    nonSelectedText: '请选择',
                    enableFiltering: true,//是否显示搜索
                    filterPlaceholder: '输入关键字...',
                    onChange: function (option, checked, select) {
                        templateId = $(option).val();
                        dAddVm.getTemplateTypesAndContent(templateId);
                    }
                });
            },
            getTemplateList: function () {
                ExpenditureTemplate.getTemplateList('get', dAddVm.req.$model, function getTemplateListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.total = obj.total;
                        obj = obj.list;
                        if (obj.length == 0) {
                            obj = [{name: '无数据', id: 0}];
                        }

                        dAddVm.initMultiselect('#template');
                        var options = [];
                        for (var i = 0; i < obj.length; i++) {
                            var option = {
                                label: obj[i].名称,
                                title: obj[i].名称,
                                value: obj[i].编号
                            }
                            options.push(option);
                        }
                        dAddVm.templateList = obj;
                        $('#template').multiselect('dataprovider', options);
                        if (templateId != 0 && templateId != null) {
                            $('#template').multiselect('select', templateId);
                        }
                        $('.multiselect-search').val(dAddVm.req.Like名称);
                        $('.multiselect-search').focus();
                        var pager = $('<li><div class="page paging text-center">' +
                            '<div class="pager paging"></div></div></li>');

                        $('.template-box .page').remove();
                        $('.multiselect-container.dropdown-menu').append(pager);

                        $('.multiselect-search').on('keyup', debounce(function () {
                            dAddVm.req.Like名称 = $(this).val();
                            dAddVm.req.Index = 1;
                            dAddVm.getTemplateList();
                        }, 500));

                        $('.template-box .pager').mamPager({
                            pageSize: dAddVm.req.Size,                           //页大小
                            pageIndex: dAddVm.req.Index,                     //当前页
                            recordTotal: dAddVm.total,                  //数据总数
                            type: 1,
                            prevText: "&laquo;",                       //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                dAddVm.req.Index = index;
                                dAddVm.getTemplateList();
                            }
                        });
                    } else {
                        console.info(strErro);
                    }
                });
            },
            getTemplateTypesAndContent: function (templateId) {
                ExpenditureTemplate.getTemplateTypesAndContent('get', templateId, function getTemplateTypesAndContentListener(success, obj, strErro) {
                    if (success) {
                        if (obj.length == 0) {
                            dAddVm.info.经费预算列表 = [];
                        }
                        for (var i = 0; i < obj.length; i++) {
                            var data = {
                                编号: 0,
                                项目支出类型: obj[i].项目支出类型,
                                项目支出内容: obj[i].项目支出内容,
                                财务科目: obj[i].财务科目,
                                批准经费: 0,
                                配套经费: 0,
                            }
                            dAddVm.info.经费预算列表.push(data);
                            dAddVm.fundsA = 0;
                            dAddVm.fundsB = 0;
                        }
                    } else {
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
                var alterationContent = dAddVm.inputVal('.alteration-content');
                var alterationReason = dAddVm.inputVal('.alteration-reason');
                var alterationTime = dAddVm.inputVal('.alteration-time');
                var projectNumber = dAddVm.inputVal('.project-number');
                var project = dAddVm.inputVal('.project-cnNname');
                var name = dAddVm.inputVal('.people-name');
                var year = dAddVm.inputVal('.modal-add .year');
                var applyTime = dAddVm.inputVal('.apply-time');
                var approvalTime = dAddVm.inputVal('.approval-time');
                var startTime = dAddVm.inputVal('.start-time');
                var endTime = dAddVm.inputVal('.end-time');
                var subjectType = dAddVm.inputVal('.subjectType');
                var researchType = dAddVm.inputVal('.researchType');
                var projectOne = dAddVm.inputVal('.projectOne');
                var projectTwo = dAddVm.inputVal('.projectTwo');
                var projectThree = dAddVm.inputVal('.projectThree');

                dAddVm.info.基本资料.伦理批文路径 = dAddVm.files.join();
                dAddVm.info.基本资料.立项文件路径 = dAddVm.declareFiles.join();

                if (!alterationContent) {
                    $.oaNotify.error('变更内容简介不能为空！');
                    return;
                }
                if (!alterationReason) {
                    $.oaNotify.error('变更事由不能为空！');
                    return;
                }
                if (!alterationTime) {
                    $.oaNotify.error('变更时间不能为空！');
                    return;
                }
                if (!projectNumber) {
                    $.oaNotify.error('项目编号不能为空！');
                    return;
                }
                if (!project) {
                    $.oaNotify.error('项目中文名称不能为空！');
                    return;
                }
                if (!name) {
                    $.oaNotify.error('负责人不能为空！');
                    return;
                }
                if (!year) {
                    $.oaNotify.error('立项年度不能为空！');
                    return;
                }
                if (!applyTime) {
                    $.oaNotify.error('登记时间不能为空！');
                    return;
                }
                if (!approvalTime) {
                    $.oaNotify.error('批准时间不能为空！');
                    return;
                }
                if (!projectOne) {
                    $.oaNotify.error('项目类型不能为空！');
                    return;
                }
                if (!startTime) {
                    $.oaNotify.error('项目类型不能为空！');
                    return;
                }
                if (!endTime) {
                    $.oaNotify.error('项目类型不能为空！');
                    return;
                }
                if (!subjectType) {
                    $.oaNotify.error('学科类型不能为空！');
                    return;
                }
                if (!researchType) {
                    $.oaNotify.error('研究类型不能为空！');
                    return;
                }
                if (!projectTwo) {
                    $.oaNotify.error('项目级别不能为空！');
                    return;
                }
                if (!projectThree) {
                    $.oaNotify.error('项目来源单位不能为空！');
                    return;
                }

                if (dAddVm.editType) {
                    var data = {
                        步骤编号: xueShuDetails.步骤编号,
                        状态值: dAddVm.stateVal,
                        备注: '',
                        附加数据: dAddVm.info.$model
                    }
                    dAddVm.editYProjectAlteration(data);

                } else {
                    dAddVm.addYProjectAlteration(dAddVm.info.$model);
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
            addYProjectAlteration: function (data) {
                ResearchProject.addYProjectAlteration('post', data, function addYProjectAlterationListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editYProjectAlteration: function (data) {
                ResearchProject.editYProjectAlteration('post', data, function editProjectAlterationListener(success, obj, strErro) {
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
                    url: Code.URL_POST_UPLOAD_Y_PROJECT_ESTABLISH_FILE,
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

                        $('.projectOne').find("option:contains('" + dAddVm.info.基本资料.项目类型 + "')").attr("selected", true);
                        dAddVm.oneSelect = $('.projectOne').val();
                        if (dAddVm.oneSelect != null && dAddVm.oneSelect != '') {
                            dAddVm.getProjectTypeTwo(dAddVm.oneSelect);
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
                        $('.projectTwo').find("option:contains('" + dAddVm.info.基本资料.项目级别 + "')").attr("selected", true);
                        dAddVm.twoSelect = $('.projectTwo').val();
                        if (dAddVm.twoSelect != null && dAddVm.twoSelect != '') {
                            dAddVm.getProjectTypeThree(dAddVm.twoSelect);
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
                        $('.projectThree').find("option:contains('" + dAddVm.info.基本资料.项目来源单位 + "')").attr("selected", true);
                        dAddVm.threeSelect = $('.projectThree').val();
                        if (dAddVm.threeSelect != null && dAddVm.threeSelect != '') {
                            dAddVm.getProjectTypefour(dAddVm.threeSelect);
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
                        $('.projectFour').find("option:contains('" + dAddVm.info.基本资料.项目类别 + "')").attr("selected", true);
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
    dAddVm.getYProjectAuxiliaryData();
});
