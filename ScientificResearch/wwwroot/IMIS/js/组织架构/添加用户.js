$(function () {
    window.dAddVm = null;
    var departmentTree = null;
    var addUerType = JSON.parse(sessionStorage.addUerType);
    var userType = JSON.parse(sessionStorage.userType);
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            back: userType.btnBack,
            type: userType.type,
            title: '',
            department: [],
            subjectOne: [],
            subjectTwo: [],
            subjectThree: [],
            technicalType: [],
            technicalTypeTwo: [],
            technicalTitle: [],
            technicalTitleTwo: [],
            oneSelect: '',
            twoSelect: '',
            technicalSelect: '',
            technicalTwoSelect: '',
            userType: [],
            model: {},
            arr: [],
            mUsers: {
                编号: 0,
                工号: '',
                密码: '',
                姓名: '',
                部门编号: 0,
                部门名称: '',
                英文名: '',
                性别: '男',
                身份证: '',
                出生日期: '',
                入职日期: '',
                手机: '',
                qq: '',
                邮箱: '',
                籍贯: '',
                毕业日期: '',
                合同开始日期: '',
                合同结束日期: '',
                参加工作日期: '',
                专业技术获得日期: '',
                职务任职日期: '',
                学位: '',
                学历: '',
                政治面貌: '',
                技术职称类别: '',
                技术职称: '',
                第二技术职称类别: '',
                第二技术职称: '',
                婚姻情况: '',
                学制: '',
                学历性质: '',
                学习形式: '',
                人员类别: '',
                个人身份: '',
                民族: '',
                专业技术级别: '',
                所学专业名称: '',
                岗位性质: '',
                职务名称: '',
                职务级别: '',
                岗位名称: '',
                岗位类型: '',
                学科门类: '',
                一级学科: '',
                二级学科: '',
                三级学科: '',
                人员类型: '',
                获得最高学历的院校: '',
                获得最高学位的院校: '',
                住宅地址: '',
                学术特长: '',
                研究方向: '',
                个人获得的荣誉和奖项: '',
                备注: '',
                是否启用: true
            },
            loadInfo: function () {
                if (dAddVm.type) {
                    dAddVm.title = '修改用户';
                    dAddVm.mUsers = JSON.parse(sessionStorage.mUsers);
                    for (var i in dAddVm.mUsers) {
                        if (dAddVm.mUsers[i] == null) {
                            dAddVm.mUsers[i] = '';
                        }
                        console.info(dAddVm.mUsers[i]);
                    }
                    dAddVm.mUsers.出生日期 = dAddVm.mUsers.出生日期.slice(0, 10);
                    dAddVm.mUsers.入职日期 = dAddVm.mUsers.入职日期.slice(0, 10);
                    dAddVm.mUsers.合同开始日期 = dAddVm.mUsers.合同开始日期.slice(0, 10);
                    dAddVm.mUsers.合同结束日期 = dAddVm.mUsers.合同结束日期.slice(0, 10);
                    dAddVm.mUsers.参加工作日期 = dAddVm.mUsers.参加工作日期.slice(0, 10);
                    dAddVm.mUsers.毕业日期 = dAddVm.mUsers.毕业日期.slice(0, 10);
                    dAddVm.mUsers.职务任职日期 = dAddVm.mUsers.职务任职日期.slice(0, 10);
                    dAddVm.mUsers.专业技术获得日期 = dAddVm.mUsers.专业技术获得日期.slice(0, 10);
                    if (dAddVm.mUsers.人员类型.length > 0) {
                        dAddVm.arr = dAddVm.mUsers.人员类型.split(',');
                    }
                    dAddVm.getSubjectOne();
                    dAddVm.getTechnicalType();
                    dAddVm.getEnableDepartment();
                } else {
                    dAddVm.title = '添加用户';

                    if (vm.departmentName != '' && vm.departmentName != null) {
                        dAddVm.mUsers.部门编号 = vm.req.上级部门编号;
                        dAddVm.mUsers.部门名称 = vm.departmentName;
                    }
                    dAddVm.getSubjectOne();
                    dAddVm.getTechnicalType();
                    dAddVm.getEnableDepartment();
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
            inputCard: function (name) {
                //判断身份证号码是否正确
                var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                var card = $(name).val();
                dAddVm.mUsers.身份证 = card;
                if (reg.test(card) === false) {
                    $(name).next().show();
                    $(name).addClass('error-input');
                    return false;
                } else {
                    $(name).next().hide();
                    $(name).removeClass('error-input');
                    return true;
                }
            },
            password: function (name) {
                //限制密码格式为数字和字母组合，不能为中文;
                var re = /^[a-zA-Z0-9]{6,20}$/;
                var nubmer = $(name).val();
                if (!re.test(nubmer)) {
                    $(name).next().next().show();
                    $(name).addClass('error-input');
                    return false;
                } else {
                    $(name).next().next().hide();
                    $(name).removeClass('error-input');
                    return true;
                }
            },
            tel: function () {
                var tel = $('.tel').val();
                dAddVm.mUsers.手机 = tel;
                //判断手机号码是否正确
                var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;

                if (myreg.test(tel)) {
                    $('.tel').next().hide();
                    $('.tel').removeClass('error-input');
                    return true;
                } else {
                    $('.tel').next().show();
                    $('.tel').addClass('error-input');
                    return false;
                }
            },
            clickSubmit: function () {
                var inputVal = dAddVm.inputVal('.user-name');
                var gonghao = dAddVm.inputVal('.gonghao');
                var inputCard = dAddVm.inputCard('.card');
                var password = dAddVm.inputVal('.password');
                dAddVm.mUsers.人员类型 = dAddVm.arr.join();
                if(!inputVal){
                    $.oaNotify.error('姓名不能为空！');
                }
                if(!gonghao){
                    $.oaNotify.error('工号不能为空！');
                }
                if(!inputCard){
                    $.oaNotify.error('请输入正确的身份证号！');
                }
                if(!password){
                    $.oaNotify.error('密码不能为空！');
                }

                if (dAddVm.mUsers.部门名称 != null) {
                    if (dAddVm.type) {
                        dAddVm.addOrEditUsers(dAddVm.mUsers);
                    } else {
                        if (addUerType == 0) {
                            dAddVm.addOrEditUsers(dAddVm.mUsers);
                        }
                        if (addUerType == 1) {
                            dAddVm.addExpertTalentsUsers(dAddVm.mUsers);
                        }
                        if (addUerType == 2) {
                            dAddVm.addScientificResearchUsers(dAddVm.mUsers);
                        }
                    }

                } else {
                    $.oaNotify.error('请选择部门！');
                }
            },
            addOrEditUsers: function (data) {
                User.addOrEditUsers('post', data, function addPeriodicalListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        sessionStorage.removeItem('mUsers');
                        sessionStorage.removeItem('addUerType');
                        if (userType.infoBack) {
                            vm.query();
                        }
                    });
                });
            },
            addExpertTalentsUsers: function (data) {
                ExpertTalents.addExpertTalentsUsers('post', data, function addExpertTalentsUsersListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        sessionStorage.removeItem('mUsers');
                        sessionStorage.removeItem('addUerType');
                        vm.query();
                    });
                });
            },
            addScientificResearchUsers: function (data) {
                ScientificResearch.addScientificResearchUsers('post', data, function addScientificResearchUsersListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        sessionStorage.removeItem('mUsers');
                        sessionStorage.removeItem('addUerType');
                        vm.query();
                    });
                });
            },
            getEnableDepartment: function () {
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

                var nodes = [];
                Department.getEnableDepartmentList('get', '', function getEnableDepartmentListListener(success, obj, strErro) {
                    if (success) {
                        nodes = obj.reverse();
                        if (nodes != null) {

                            for (var i = 0, l = nodes.length; i < l; i++) {

                                nodes[i].id = nodes[i].编号;
                                nodes[i].name = nodes[i].名称.replace(/\.n/g, '.');
                                nodes[i].pId = nodes[i].上级部门编号;
                            }

                            departmentTree = $.fn.zTree.init($('.departmentTree'), setting, nodes);
                            if (dAddVm.type) {
                                var node = departmentTree.getNodesByFilter(function (node) {
                                    return node.编号 == dAddVm.mUsers.部门编号;
                                }, true);
                                departmentTree.selectNode(node);
                            }
                        }
                    } else {
                        alert('获取部门列表数据失败');
                        console.info(strErro);
                    }
                });

                function onClick(e, treeId, treeNode) {
                    var nodes = departmentTree.getSelectedNodes(),
                        text = '';
                    nodes.sort(function compare(a, b) {
                        return a.id - b.id;
                    });
                    for (var i = 0, l = nodes.length; i < l; i++) {
                        text += nodes[i].name + ",";
                    }
                    if (text.length > 0) text = text.substring(0, text.length - 1);
                    var cityObj = $('.modal-add .department');
                    cityObj.val(text);
                    dAddVm.mUsers.部门编号 = treeNode.编号;
                    dAddVm.mUsers.部门名称 = treeNode.名称;
                    dAddVm.hideMenu();
                }
            },
            hideMenu: function () {
                $('.modal-add #menuContent').fadeOut('fast');
                $('body').unbind('mousedown', dAddVm.onBodyDown);
            },
            onBodyDown: function (event) {
                if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents(".modal-add #menuContent").length > 0)) {
                    dAddVm.hideMenu();
                }
            },
            showMenu: function () {
                var obj = $('.modal-add .department');
                var offset = $('.modal-add .department').offset();
                $('.modal-add #menuContent').css({
                    left: offset.left + 'px',
                    top: offset.top + obj.outerHeight() + 'px'
                }).slideDown('fast');

                $('body').bind('mousedown', dAddVm.onBodyDown);
            },
            getSubjectOne: function () {
                var data = {
                    上级编号: 0
                }
                Subject.getSubjectList('get', data, function getSubjectListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.subjectOne = obj;
                        if (dAddVm.type) {
                            $('.subjectOne').find("option:contains('" + dAddVm.mUsers.一级学科 + "')").attr("selected", true);
                            dAddVm.oneSelect = $('.subjectOne').val();
                            if (dAddVm.oneSelect != null && dAddVm.oneSelect != '') {
                                dAddVm.getSubjectTwo(dAddVm.oneSelect);
                            }
                        }
                        $('.subjectOne').on('change', function () {
                            dAddVm.oneSelect = $(this).val();
                            dAddVm.mUsers.一级学科 = $(".subjectOne option:selected").text();
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
                        if (dAddVm.type) {
                            $('.subjectTwo').find("option:contains('" + dAddVm.mUsers.二级学科 + "')").attr("selected", true);
                            dAddVm.twoSelect = $('.subjectTwo').val();
                            if (dAddVm.twoSelect != null && dAddVm.twoSelect != '') {
                                dAddVm.getSubjectThree(dAddVm.twoSelect);
                            }
                        }
                        $('.subjectTwo').on('change', function () {
                            dAddVm.twoSelect = $(this).val();
                            dAddVm.mUsers.二级学科 = $(".subjectTwo option:selected").text();
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
                        if (dAddVm.type) {
                            $('.subjectThree').find("option:contains('" + dAddVm.mUsers.三级学科 + "')").attr("selected", true);
                        }
                    } else {
                        console.info('获取三级学科失败！');
                        console.info(strErro);
                    }
                })
            },
            getTechnicalType: function () {
                Dictionary.getDictionaryList('get', '技术职称分类', function getDictionaryListListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.technicalType = obj;
                        dAddVm.technicalTypeTwo = obj;
                        if (dAddVm.type) {
                            $('.technicalType').find("option:contains('" + dAddVm.mUsers.技术职称类别 + "')").attr("selected", true);
                            $('.technicalTypeTwo').find("option:contains('" + dAddVm.mUsers.第二技术职称类别 + "')").attr("selected", true);
                            dAddVm.technicalSelect = $('.technicalType').val();
                            dAddVm.technicalTwoSelect = $('.technicalTypeTwo').val();

                            if (dAddVm.technicalSelect != null && dAddVm.technicalSelect != '') {
                                dAddVm.getTechnicalTitle(dAddVm.technicalSelect);
                            }
                            if (dAddVm.technicalTwoSelect != null && dAddVm.technicalTwoSelect != '') {
                                dAddVm.getTechnicalTitleTwo(dAddVm.technicalTwoSelect);
                            }
                        }

                        $('.technicalType').on('change', function () {
                            dAddVm.technicalSelect = $(this).val();
                            dAddVm.mUsers.技术职称类别 = $(".technicalType option:selected").text();
                            dAddVm.getTechnicalTitle(dAddVm.technicalSelect);
                        });
                        $('.technicalTypeTwo').on('change', function () {
                            dAddVm.technicalTwoSelect = $(this).val();
                            dAddVm.mUsers.第二技术职称类别 = $(".technicalTypeTwo option:selected").text();
                            dAddVm.getTechnicalTitleTwo(dAddVm.technicalTwoSelect);
                        });
                    } else {
                        console.info('获取技术职称类别失败！');
                        console.info(strErro);
                    }
                })
            },
            getTechnicalTitle: function (id) {
                Dictionary.getDictionaryChild('get', id, function getDictionaryChildListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.technicalTitle = obj;
                        if (dAddVm.type) {
                            $('.technicalTitle').val(dAddVm.mUsers.技术职称);
                        }
                    } else {
                        console.info('获取技术职称名称失败！');
                        console.info(strErro);
                    }
                })
            },
            getTechnicalTitleTwo: function (id) {
                Dictionary.getDictionaryChild('get', id, function getDictionaryChildListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.technicalTitleTwo = obj;

                        if (dAddVm.type) {
                            $('.technicalTitleTwo').val(dAddVm.mUsers.第二技术职称);
                        }
                    } else {
                        console.info('获取第二技术职称名称失败！');
                        console.info(strErro);
                    }
                })
            },
            getUsersDetailsAuxiliaryData: function () {
                User.getUsersDetailsAuxiliaryData('get', function getUsersDetailsAuxiliaryDataListener(success, obj, strErro) {
                    if (success) {
                        dAddVm.model = obj;
                        dAddVm.userType = obj.人员类型;
                        dAddVm.loadInfo();
                    } else {
                        console.info('获取用户详情辅助数据失败！');
                        console.info(strErro);
                    }
                });
            },
            clickBtnReturn: function () {
                $('.modal-add').modal('hide');
                $('.datetimepicker').remove();
            }
        });
        dAddVm.getUsersDetailsAuxiliaryData();
        avalon.scan(document.body);
    });
    if (!userType.btnBack) {
        $('.page-personal-info .nav-tabs a').on('click', function (e) {
            e.preventDefault();
            $(this).tab('show');
        });
    }
    $('.modal-body,.menuContent,.page-personal-info .content').mCustomScrollbar({
        theme: 'dark-3',
    });
    $('.form-time').datetimepicker({
        format: 'yyyy-mm-dd',
        minView: "month", //选择日期后，不会再跳转去选择时分秒
        todayBtn: 1,
        autoclose: 1,
        language: 'zh-CN'
    });
});