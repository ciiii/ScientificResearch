$(function () {
    isOverdue();
    window.vm = null;
    var userInfo = JSON.parse(localStorage.info).data;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                Index: 1,
                Size: 16,
                Like项目名称: '',
                Like申报人姓名: '',
                分类名称: '',
                申报年度: '',
                项目级别: '',
                Begin申报时间: '',
                End申报时间: '',
                是否立项: '',
                OrderType: false
            },
            userInfo: userInfo,
            title: '',
            name: '',
            patent: '',
            total: '',
            model: [],
            startTime: '',
            endTime: '',
            ProjectType: [],
            ProjectLevel: [],
            nothing: false,
            loaded: false,
            editType: false,
            detailsUrl: '',
            allchecked: false,
            expertAuditing:'',
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                Declare.getYSubjectDeclareList('get', vm.req.$model, function getYSubjectDeclareListListener(success, obj, strErro) {
                    if (success) {
                        vm.loaded = true;
                        vm.total = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            $('.pager').hide();

                            vm.model = [];
                            vm.nothing = true;
                            return;
                        } else {
                            obj = obj.list;
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].checked = false;
                            }
                            vm.model = obj;
                            $('.pager').show();
                            vm.nothing = false;
                            vm.allchecked = false;
                        }
                        $('.pager').mamPager({
                            pageSize: vm.req.Size,                       //页大小
                            pageIndex: vm.req.Index,                     //当前页
                            recordTotal: vm.total,                       //数据总数
                            type: 1,
                            prevText: "&laquo;",                         //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                vm.req.Index = index;
                                vm.loaded = false;
                                vm.nothing = false;
                                vm.query();
                            }
                        });
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取纵向项目重点学科申报列表失败！');
                        console.info(strErro);
                    }
                });
            },
            getProjectType: function () {
                ProjectType.getProjectType('get', 0, function getProjectTypeListListener(success, obj, strErro) {
                    if (success) {
                        vm.ProjectType = obj;
                    } else {
                        console.info('获取项目分类失败！');
                        console.info(strErro);
                    }
                })
            },
            getProjectLevel: function () {
                Dictionary.getDictionaryList('get', '项目级别', function getDictionaryListListener(success, obj, strErro) {
                    if (success) {
                        vm.ProjectLevel = obj.reverse();
                    } else {
                        console.info('获取项目级别失败！');
                        console.info(strErro);
                    }
                })
            },
            search: function () {
                vm.req.Index = 1;
                vm.req.Like项目名称 = vm.title;
                vm.req.Like申报人姓名 = vm.name;
                vm.req.Begin申报时间 = vm.startTime;
                vm.req.End申报时间 = vm.endTime;
                vm.query();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    vm.search();
                }
            },
            changeType: function () {
                vm.req.分类名称 = $('.screen-box .projectType').val();
                vm.search();
            },
            changeLevel: function () {
                vm.req.项目级别 = $('.screen-box .projectLevel').val();
                vm.search();
            },
            changeDeclare: function () {
                vm.req.是否立项 = $('.screen-box .type').val();
                vm.search();
            },
            checkAll: function (e) {
                var checked = e.target.checked

                vm.model.forEach(function (el) {
                    el.checked = checked
                })
            },
            checkOne: function (e) {
                var checked = e.target.checked
                if (checked === false) {
                    vm.allchecked = false
                } else {
                    vm.allchecked = vm.model.every(function (el) {
                        return el.checked
                    })
                }
            },
            clickBtnAdd: function () {
                vm.editType = false;
                vm.type = 1;
            },
            clickBtnEdit: function (el) {
                vm.editType = true;
                sessionStorage.editInfo = JSON.stringify(el.$model);
                var details = {
                    id: el.编号,
                    name: el.论文标题,
                    shenHeUrl: el.步骤链接路径,
                    步骤编号: el.步骤编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
                if (el.步骤链接名称 == '专家评审') {
                    vm.expertAuditing = 0;
                }
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            details: function (el) {
                var details = {
                    id: el.编号,
                    name: el.论文标题,
                    shenHeUrl: el.步骤链接路径,
                    步骤编号: el.步骤编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
                $('.modal-details .detailsPage').attr('src', vm.getUrl(el.流程相关项目路径));

            },
            batchExport: function () {
                $('.btn-export').attr('href', '');
            },
            getStatusClass: function (name) {
                if (name.indexOf('申请') != -1) {
                    return 'btn-edit';
                } else {
                    if (name.indexOf('分配') != -1) {
                        return 'btn-users';
                    } else {
                        return 'btn-examine';
                    }
                }
            },
            getClass: function (statue) {
                switch (statue) {
                    case '审核通过':
                        return 'state-mark';
                    case '审核不通过':
                        return 'state-overdue';
                    case '审核已终止':
                        return 'state-overdue';
                    case '待审核':
                        return 'state-accomplish';
                    case '待分配专家':
                        return 'state-accomplish';
                    case '待专家评审':
                        return 'state-accomplish';
                    default:
                        return '';
                }
            },
            getFeedbackClass: function (statue) {
                if (statue) {
                    return 'btn-feedback';
                }
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        $('.modal-add .tab-pane').mCustomScrollbar({
            theme: 'dark-3',
        });
        vm.search();
        vm.getProjectType();
        vm.getProjectLevel();
        avalon.scan(document.body);
    });
});