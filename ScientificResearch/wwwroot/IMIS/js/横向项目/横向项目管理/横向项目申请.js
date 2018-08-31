$(function () {
    window.dAddVm = null;
    var xueShuDetails;
    var userInfo = vm.userInfo;
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
            templateList: [],
            templateContent: [],
            funds: 0,
            total: '',
            regionOne: [],
            regionTwo: [],
            regionThree: [],
            oneSelect: '',
            twoSelect: '',
            nowTime: new Date().format('yyyy-MM-dd hh:mm:ss'),
            info: {
                基本资料: {
                    编号: 0,
                    项目分类: '',
                    项目类型: '',
                    合同编号: '',
                    合同名称: '',
                    是否为第一承建单位: true,
                    项目负责人编号: userInfo.人员.编号,
                    项目负责人姓名: userInfo.人员.姓名,
                    项目负责人部门名称: userInfo.人员.部门名称,
                    项目归属部门: '',
                    单位名称: '',
                    邮政编码: '',
                    法定代表人: '',
                    经费本编号: '',
                    联系人: '',
                    联系人电话: '',
                    通讯地址: '',
                    是否需要伦理评审: true,
                    档案编号: '',
                    财务简称: '',
                    课题来源: '',
                    合作方关系: '院内',
                    合作方契约关系: '甲',
                    合作方单位名称: '',
                    合作方法人或组织机构代码: '',
                    合作方法定代表人: '',
                    合作方单位联系人: '',
                    合作方联系电话: '',
                    合作方邮箱: '',
                    合作方邮政编码: '',
                    合作方所在省: '',
                    合作方所在市: '',
                    合作方所在地区: '',
                    合同金额: 0,
                    签订时间: '',
                    付款方式: '',
                    合同开始时间: '',
                    合同结束时间: '',
                    合作方式: '',
                    研究类型: '',
                    技术领域: '',
                    合同类型: '技术',
                    技术合同类型: '',
                    是否申请技术合同认定: false,
                    合同技术交易额: 0,
                    知识产权: '',
                    计划来源: '',
                    合作方所属国民经济行业: '',
                    技术服务的国民经济行业: '',
                    合同的社会经济目标: '',
                    合作方性质: '',
                    是否高新性质: true,
                    合同认定登记承诺书路径: '',
                    合同文件路径: '',
                    备注: '',
                    建立时间: new Date().format('yyyy-MM-dd hh:mm:ss')
                },
                参与人列表: [],
                经费预算列表: [],
                isHold: true
            },
            loadInfo: function () {
                if (dAddVm.editType) {
                    dAddVm.title = '修改项目';
                    xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
                    dAddVm.getXProjectDetails(xueShuDetails.id);
                } else {
                    dAddVm.title = '添加项目';
                    dAddVm.getTemplateList();
                    dAddVm.getRegionOne();
                }
            },
            getXProjectDetails: function (id) {
                XProject.getXProjectDetails('get', id, function getXProjectDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            dAddVm.info = {};
                            return;
                        } else {
                            dAddVm.shenHe = obj.审核记录;
                            obj.基本信息.签订时间 = obj.基本信息.签订时间.slice(0, 10);
                            obj.基本信息.合同开始时间 = obj.基本信息.合同开始时间.slice(0, 10);
                            obj.基本信息.合同结束时间 = obj.基本信息.合同结束时间.slice(0, 10);
                            for (var i in obj.基本信息) {
                                if (obj.基本信息[i] == null || obj.基本信息[i] == 'undefined') {
                                    obj.基本信息[i] = '';
                                }
                            }
                            for (var j = 0; j < obj.财务信息.length; j++) {
                                dAddVm.funds += obj.财务信息[j].批准经费;
                            }
                            dAddVm.info = {
                                基本资料: obj.基本信息,
                                参与人列表: obj.参与人信息,
                                经费预算列表: obj.财务信息,
                                isHold: true
                            };
                            if (obj.基本信息.合同文件路径 != '' && obj.基本信息.合同文件路径 != null) {
                                dAddVm.files = obj.基本信息.合同文件路径.split(',');
                            }
                            if (obj.基本信息.合同认定登记承诺书路径 != '' && obj.基本信息.合同认定登记承诺书路径 != null) {
                                dAddVm.declareFiles = obj.基本信息.合同认定登记承诺书路径.split(',');
                            }
                            for (var a = 0; a < dAddVm.info.参与人列表.length; a++) {
                                if (dAddVm.info.参与人列表[a].工作量占比 == null) {
                                    dAddVm.info.参与人列表[a].工作量占比 = '';
                                }
                            }
                            console.info(dAddVm.info.基本资料);
                            dAddVm.getTemplateList();
                            dAddVm.getRegionOne();
                        }
                    } else {
                        console.info('获取纵向项目可立项申报详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getXProjectAuxiliaryData: function () {
                XProject.getXProjectAuxiliaryData('get', function getXProjectAuxiliaryDataListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.model = obj;
                        dAddVm.loadInfo();
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
                                批准经费: 0
                            }
                            dAddVm.info.经费预算列表.push(data);
                            dAddVm.funds = 0;
                        }
                    } else {
                        console.info(strErro);
                    }
                });
            },
            getRegionOne: function () {
                var data = {
                    上级编号: 0
                }
                Area.getAreaList('get', data, function getAreaListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.regionOne = obj;
                        if (dAddVm.type) {
                            $('.regionOne').find("option:contains('" + dAddVm.info.基本资料.合作方所在省 + "')").attr("selected", true);
                            dAddVm.oneSelect = $('.regionOne').val();
                            if (dAddVm.oneSelect != null && dAddVm.oneSelect != '') {
                                dAddVm.getRegionTwo(dAddVm.oneSelect);
                            }
                        }
                        $('.regionOne').on('change', function () {
                            dAddVm.oneSelect = $(this).val();
                            dAddVm.info.基本资料.合作方所在省 = $(".regionOne option:selected").text();
                            dAddVm.twoSelect = '';
                            dAddVm.info.基本资料.合作方所在地区 = '';
                            dAddVm.getRegionTwo(dAddVm.oneSelect);
                        });
                    } else {
                        console.info('获取区域第一层失败！');
                        console.info(strErro);
                    }
                })
            },
            getRegionTwo: function (id) {
                var data = {
                    上级编号: id
                }
                Area.getAreaList('get', data, function getAreaListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.regionTwo = obj;
                        if (dAddVm.type) {
                            $('.regionTwo').find("option:contains('" + dAddVm.info.基本资料.合作方所在市 + "')").attr("selected", true);
                            dAddVm.twoSelect = $('.regionTwo').val();
                            if (dAddVm.twoSelect != null && dAddVm.twoSelect != '') {
                                dAddVm.getRegionThree(dAddVm.twoSelect);
                            }
                        }
                        $('.regionTwo').on('change', function () {
                            dAddVm.twoSelect = $(this).val();
                            dAddVm.info.基本资料.合作方所在市 = $(".regionTwo option:selected").text();
                            dAddVm.info.基本资料.合作方所在地区 = '';
                            dAddVm.getRegionThree(dAddVm.twoSelect);
                        });

                    } else {
                        console.info('获取区域第二层失败！');
                        console.info(strErro);
                    }
                })
            },
            getRegionThree: function (id) {
                var data = {
                    上级编号: id
                }
                Area.getAreaList('get', data, function getAreaListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.regionThree = obj;
                        if (dAddVm.type) {
                            $('.regionThree').find("option:contains('" + dAddVm.info.基本资料.合作方所在地区 + "')").attr("selected", true);
                        }
                    } else {
                        console.info('获取区域第三层失败！');
                        console.info(strErro);
                    }
                })
            },
            changeFunds: function () {
                var funds = 0;
                for (var i = 0; i < dAddVm.info.经费预算列表.length; i++) {
                    dAddVm.info.经费预算列表[i].批准经费 = parseInt(dAddVm.info.经费预算列表[i].批准经费);
                    funds += dAddVm.info.经费预算列表[i].批准经费;
                }
                dAddVm.funds = funds;
            },
            changeOgnizance: function () {
                if (dAddVm.info.基本资料.是否申请技术合同认定 == 'true') {
                    dAddVm.info.基本资料.是否申请技术合同认定 = true;
                } else {
                    dAddVm.info.基本资料.是否申请技术合同认定 = false;

                }
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
            tel: function (name) {
                var tel = $(name).val();
                //判断手机号码是否正确
                var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;

                if (myreg.test(tel)) {
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
                var contractName = dAddVm.inputVal('.contract-name');
                var contractNumber = dAddVm.inputVal('.contract-number');
                var name = dAddVm.inputVal('.people-name');
                var department = dAddVm.inputVal('.project-department');
                var contacts = dAddVm.inputVal('.modal .contacts');
                var contactsTel = dAddVm.tel('.modal .contacts-tel');
                var sum = dAddVm.inputVal('.modal .sum');
                var applyTime = dAddVm.inputVal('.apply-time');
                var paymentMethod = dAddVm.inputVal('.paymentMethod');
                var startTime = dAddVm.inputVal('.start-time');
                var endTime = dAddVm.inputVal('.end-time');
                var cooperationType = dAddVm.inputVal('.cooperationType');
                var researchType = dAddVm.inputVal('.researchType');

                dAddVm.info.基本资料.合同认定登记承诺书路径 = dAddVm.declareFiles.join();
                dAddVm.info.基本资料.合同文件路径 = dAddVm.files.join();
                if (!contractName) {
                    $.oaNotify.error('合同名称不能为空！');
                    return;
                }
                if (!contractNumber) {
                    $.oaNotify.error('项目编号不能为空！');
                    return;
                }
                if (!name) {
                    $.oaNotify.error('负责人不能为空！');
                    return;
                }
                if (!department) {
                    $.oaNotify.error('项目归属部门不能为空！');
                    return;
                }
                if (!contacts) {
                    $.oaNotify.error('联系人不能为空！');
                    return;
                }
                if (!contactsTel) {
                    $.oaNotify.error('联系人电话不能为空！');
                    return;
                }
                if (!sum) {
                    $.oaNotify.error('合同金额不能为空！');
                    return;
                }
                if (!applyTime) {
                    $.oaNotify.error('签订时间不能为空！');
                    return;
                }
                if (!paymentMethod) {
                    $.oaNotify.error('付款方式不能为空！');
                    return;
                }
                if (!startTime) {
                    $.oaNotify.error('合同开始时间不能为空！');
                    return;
                }
                if (!endTime) {
                    $.oaNotify.error('合同结束时间不能为空！');
                    return;
                }
                if (!cooperationType) {
                    $.oaNotify.error('合作方式不能为空！');
                    return;
                }
                if (!researchType) {
                    $.oaNotify.error('研究类型不能为空！');
                    return;
                }
                if (dAddVm.info.基本资料.合同类型 == '技术' && dAddVm.info.基本资料.是否申请技术合同认定) {
                    var tradingVolume = dAddVm.inputVal('.trading-volume');
                    var propertyRight = dAddVm.inputVal('.property-right');
                    var planningSource = dAddVm.inputVal('.planning-source');
                    var nationalEconomy = dAddVm.inputVal('.national-economy');
                    var nationalEconomy2 = dAddVm.inputVal('.national-economy2');
                    var economicGoals = dAddVm.inputVal('.economic-goals');
                    var nature = dAddVm.inputVal('.modal .nature');

                    if (!tradingVolume) {
                        $.oaNotify.error('合同技术交易额不能为空！');
                        return;
                    }
                    if (!propertyRight) {
                        $.oaNotify.error('知识产权不能为空！');
                        return;
                    }
                    if (!planningSource) {
                        $.oaNotify.error('计划来源不能为空！');
                        return;
                    }
                    if (!nationalEconomy) {
                        $.oaNotify.error('合作方所属国民经济行业不能为空！');
                        return;
                    }
                    if (!nationalEconomy2) {
                        $.oaNotify.error('技术服务的国民经济行业不能为空！');
                        return;
                    }
                    if (!economicGoals) {
                        $.oaNotify.error('合同的社会经济目标不能为空！');
                        return;
                    }
                    if (!nature) {
                        $.oaNotify.error('合作方性质不能为空！');
                        return;
                    }
                    if (dAddVm.declareFiles.length == 0) {
                        $.oaNotify.error(' 请上传合同认定登记承诺书！');
                        return;
                    }
                }
                if (dAddVm.files.length == 0) {
                    $.oaNotify.error(' 请上传合同文件书！');
                    return;
                }
                if (dAddVm.info.经费预算列表.length == 0) {
                    $.oaNotify.error('请在项目预算里选择经费预算模板！');
                    return;
                }
                if (dAddVm.info.基本资料.合同金额 != dAddVm.funds) {
                    $.oaNotify.error('预算金额合计应等于项目合同金额!！');
                    return;
                }

                dAddVm.info.基本资料.合同金额 = dAddVm.funds;

                if (dAddVm.editType) {
                    var data = {
                        步骤编号: xueShuDetails.步骤编号,
                        状态值: dAddVm.stateVal,
                        备注: '',
                        附加数据: dAddVm.info.$model
                    }
                    dAddVm.editXProject(data);
                    console.info('4444');

                } else {
                    dAddVm.addXProject(dAddVm.info.$model);
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
            addXProject: function (data) {
                XProject.addXProject('post', data, function addXProjectListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            editXProject: function (data) {
                XProject.editXProject('post', data, function editXProjectListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            ajaxFileUpload: function () {
                $('.fileUpload-flie .loading').show();
                $.ajaxFileUpload({
                    url: Code.URL_POST_UPLOAD_X_PROJECT_CONTRACT_FILE, //用于文件上传的服务器端请求地址
                    secureuri: false, //一般设置为false
                    fileElementId: 'input-file', //文件上传空间的id属性  <input type="file" id="file" name="file" />
                    dataType: 'html', //返回值类型 一般设置为json,
                    success: function (data, status)  //服务器成功响应处理函数
                    {
                        // if (typeof (data.error) != 'undefined') {
                        //     if (data.error != '') {
                        //         $.oaNotify.error(' 上传失败：' + e.error);
                        //     } else {
                        //         for (var i = 0; i < e.data.length; i++) {
                        //             dAddVm.files.push(e.data[i]);
                        //         }
                        //     }
                        // }
                        if (data != '') {
                            data = JSON.parse(data);
                            if (data.error) {
                                $.oaNotify.error(' 上传失败：' + data.error);
                            } else {
                                $.oaNotify.ok(' 上传成功!');
                                for (var i = 0; i < data.data.length; i++) {
                                    dAddVm.files.push(data.data[i]);
                                }
                            }
                        }

                        // $.oaNotify.ok(' 上传成功!');
                        // dAddVm.files.push(data);

                    },
                    error: function (data, status, e)//服务器响应失败处理函数
                    {
                        $.oaNotify.error(' 上传失败：' + e);
                    }
                });
                $('.fileUpload-flie .loading').hide();
                return false;
            },
            clickUpload: function (e) {
                var file = $('.fileUpload-flie .input-file').get(0).files[0];
                if (file) {
                    var data = new FormData();
                    data.append('coverFile', file);
                    $('.fileUpload-flie .loading').show();
                    dAddVm.fileUpload(data);
                } else {
                    $.oaNotify.error('请先选择文件后再上传！');
                }
            },
            fileUpload: function (data) {
                $.ajax({
                    url: Code.URL_POST_UPLOAD_X_PROJECT_CONTRACT_FILE,
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
                    url: Code.URL_POST_UPLOAD_X_PROJECT_CONTRACT_REGISTER,
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
    dAddVm.getXProjectAuxiliaryData();
});
