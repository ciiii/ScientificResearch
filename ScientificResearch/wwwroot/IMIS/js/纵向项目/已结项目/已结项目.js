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
                Like项目中文名称: '',
                Like负责人姓名: '',
                分类名称: '',
                项目级别: '',
                Begin结题验收时间: '',
                End结题验收时间: '',
                结题验收是否合格: '',
                状态: 1,
                OrderType: false
            },
            userInfo: userInfo,
            cnTitle: '',
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
            data: {},
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                ResearchProject.getYProjectConclusionList('get', vm.req.$model, function getYProjectConclusionListListener(success, obj, strErro) {
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
                            var number = (vm.req.Index - 1) * vm.req.Size + 1;
                            for (var i = 0; i < obj.length; i++) {
                                if (obj[i].结题验收是否合格) {
                                    obj[i].结题验收是否合格 = '合格';
                                }
                                if (obj[i].结题验收是否合格 == false) {
                                    obj[i].结题验收是否合格 = '不合格';
                                }
                                obj[i].number = number;
                                obj[i].checked = false;
                                number++;
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
                        console.info('获取在研结题项目列表失败！');
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
                vm.req.Like项目中文名称 = vm.cnTitle;
                vm.req.Like负责人姓名 = vm.name;
                vm.req.Begin结题验收时间 = vm.startTime;
                vm.req.End结题验收时间 = vm.endTime;
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
            conclusion: function () {
                vm.req.结题验收是否合格 = $('.screen-box .conclusion').val();
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
            info: function (el) {
                sessionStorage.editInfo = JSON.stringify(el.$model);
                var details = {
                    id: el.编号,
                    name: el.项目中文名称,
                    shenHeUrl: el.步骤链接路径,
                    步骤编号: el.步骤编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
            },
            details: function () {
                var url = vm.getUrl('/IMIS/views/纵向项目/在研项目/纵向项目结题详情.html');
                $('.modal-details .detailsPage').attr('src', url);
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            batchExport: function () {
                $('.btn-export').attr('href', '');
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