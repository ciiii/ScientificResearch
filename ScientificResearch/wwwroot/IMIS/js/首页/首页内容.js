$(function () {
    window.vm = null;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                Index: 1,
                Size: 10,
                OrderType: false
            },
            ScientificResearch: [],
            total: '',
            userInfo: '',
            notice: [],
            reqNotice: {
                Index: 1,
                Size: 5,
                人员编号: '',
                OrderType: false
            },
            downFile: [],
            reqdownFile: {
                Index: 1,
                Size: 5,
                是否启用: true,
                OrderType: false
            },
            workFlow: [],
            reqWorkFlow: {
                Index: 1,
                Size: 5,
                OrderType: false
            },
            noticeTotal: '',
            downFileTotal: '',
            WorkFlowTotal: '',
            nothing: false,
            nothing2: false,
            nothing3: false,
            nothing4: false,
            navList: [
                {
                    title: '主办讲座',
                    url: '学术活动/申请学术讲座/主办讲座.html',
                    icon: '活动.png'
                },
                {
                    title: '获奖管理',
                    url: '成果管理/获奖/获奖管理.html',
                    icon: '获奖.png'
                },
                {
                    title: '参会管理',
                    url: '学术活动/参加学术会议/参会信息管理.html',
                    icon: '会议.png'
                },
                {
                    title: '专利管理',
                    url: '成果管理/专利/专利管理.html',
                    icon: '专利.png'
                },
                {
                    title: '横向项目',
                    url: '横向项目/横向项目管理/横向项目列表.html',
                    icon: '项目.png'
                },
                {
                    title: '纵向项目',
                    url: '纵向项目/项目立项/纵向项目立项列表.html',
                    icon: '项目2.png'
                },
                {
                    title: '组织架构',
                    url: '组织架构/部门人员信息维护.html',
                    icon: '医院负责人.png'
                },
                {
                    title: '角色管理',
                    url: '系统管理/权限管理/角色管理.html',
                    icon: '设置.png'
                }
            ],
            newNavList: [],
            onload: function () {
                getMenuPermissions(function (success) {
                    if (success) {
                        var info = JSON.parse(localStorage.info);
                        window.mUserInfo = info.data;
                        window.mUserId = info.data.人员.编号;
                        vm.userInfo = mUserInfo;
                        vm.reqNotice.人员编号 = mUserId;
                        for (var i = 0; i < vm.navList.length; i++) {
                            vm.match(mUserInfo.权限, vm.newNavList, vm.navList[i]);
                        }
                        vm.getUserNoticeList();
                        vm.getEnableDownloadList();
                        vm.query();
                        vm.WorkFlowTotalList();
                    } else {
                        console.info('获取菜单权限失败！')
                    }
                });
            },
            match: function (arrA, arrB, obj) {
                for (var j = 0; j < arrA.length; j++) {
                    var url = arrA[j].菜单;
                    var arr = arrA[j].子级菜单;
                    if (url && url.路径 != '') {
                        if (getHtmlDocName(decodeURI(url.路径)) == getHtmlDocName(obj.url)) {
                            arrB.push(obj);
                        }
                    }
                    if (arr && arr.length > 0) {
                        vm.match(arr, arrB, obj);
                    }
                }
            }, getHtmlDocName: function (url) {
                var urlArr = url.split('?');
                var k = urlArr[0], arr = k.split('/');
                return arr[arr.length - 1];
            },
            query: function () {
                ScientificResearch.getScientificResearchUntreated('get', vm.req.$model, function getScientificResearchUntreatedListener(success, obj, strErro) {
                    if (success) {
                        vm.total = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            $('.regulation .pager').hide();
                            vm.ScientificResearch = [];
                            vm.nothing3 = true;
                            return;
                        } else {
                            obj = obj.list;
                            var number = (vm.req.Index - 1) * vm.req.Size + 1;
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].number = number;
                                number++;
                            }
                            vm.ScientificResearch = obj;
                            $('.regulation .pager').show();
                            vm.nothing3 = false;
                        }
                        $('.regulation .pager').mamPager({
                            pageSize: vm.req.Size,                       //页大小
                            pageIndex: vm.req.Index,                     //当前页
                            recordTotal: vm.total,                       //数据总数
                            type: 1,
                            prevText: "&laquo;",                         //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                vm.req.Index = index;
                                vm.nothing3 = false;
                                vm.query();
                            }
                        });
                    } else {
                        console.info('获取科研待办列表失败！');
                        console.info(strErro);
                    }
                });
            },
            getUserNoticeList: function () {
                Notice.getUserNoticeList('get', vm.reqNotice.$model, function getUserNoticeListListener(success, obj, strErro) {
                    if (success) {
                        vm.noticeTotal = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            $('.notice .pager').hide();
                            vm.notice = [];
                            vm.nothing = true;
                            return;
                        } else {
                            obj = obj.list;
                            vm.notice = obj;
                            $('.notice .pager').show();
                            vm.nothing = false;
                        }
                        $('.notice .pager').mamPager({
                            pageSize: vm.reqNotice.Size,                       //页大小
                            pageIndex: vm.reqNotice.Index,                     //当前页
                            recordTotal: vm.noticeTotal,                       //数据总数
                            type: 1,
                            prevText: "&laquo;",                         //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                vm.reqNotice.Index = index;
                                vm.nothing = false;
                                vm.getUserNoticeList();
                            }
                        });
                    } else {
                        console.info('获取通知公告列表失败！');
                        console.info(strErro);
                    }
                });
            },
            getEnableDownloadList: function () {
                Download.getEnableDownloadList('get', vm.reqdownFile.$model, function getEnableDownloadListListener(success, obj, strErro) {
                    if (success) {
                        vm.downFileTotal = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            $('.doc-download .pager').hide();
                            vm.downFile = [];
                            vm.nothing2 = true;
                            return;
                        } else {
                            obj = obj.list;
                            vm.downFile = obj;
                            $('.doc-download .pager').show();
                            vm.nothing2 = false;
                        }
                        $('.doc-download .pager').mamPager({
                            pageSize: vm.reqdownFile.Size,                       //页大小
                            pageIndex: vm.reqdownFile.Index,                     //当前页
                            recordTotal: vm.downFileTotal,                       //数据总数
                            type: 1,
                            prevText: "&laquo;",                         //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                vm.reqdownFile.Index = index;
                                vm.nothing2 = false;
                                vm.getEnableDownloadList();
                            }
                        });
                    } else {
                        console.info('获取下载列表失败！');
                        console.info(strErro);
                    }
                });
            },
            WorkFlowTotalList: function () {
                WorkFlow.WorkFlowTotalList('get', vm.reqWorkFlow.$model, function WorkFlowTotalListListener(success, obj, strErro) {
                    if (success) {
                        vm.WorkFlowTotal = obj.total;
                        if (obj == null || obj.length == 0) {
                            $('.procedure .pager').hide();
                            vm.workFlow = [];
                            vm.nothing4 = true;
                            return;
                        } else {
                            obj = obj.list;
                            vm.workFlow = obj;
                            $('.procedure .pager').show();
                            vm.nothing4 = false;
                        }
                        $('.procedure .pager').mamPager({
                            pageSize: vm.reqWorkFlow.Size,                       //页大小
                            pageIndex: vm.reqWorkFlow.Index,                     //当前页
                            recordTotal: vm.WorkFlowTotal,                       //数据总数
                            type: 1,
                            prevText: "&laquo;",                         //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                vm.reqWorkFlow.Index = index;
                                vm.nothing4 = false;
                                vm.WorkFlowTotalList();
                            }
                        });
                    } else {
                        console.info('获取办事流程列表失败！');
                        console.info(strErro);
                    }
                });
            },
            clickBtnEdit: function (el) {
                vm.editType = true;
                sessionStorage.editInfo = JSON.stringify(el.$model);
                var details = {
                    id: el.项目编号,
                    name: el.发起人姓名,
                    shenHeUrl: el.步骤链接路径,
                    步骤编号: el.步骤编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
            },
            details: function (el) {
                var details = {
                    id: el.项目编号,
                    name: el.发起人姓名,
                    shenHeUrl: el.步骤链接路径,
                    步骤编号: el.步骤编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
                $('.modal-details .detailsPage').attr('src', vm.getUrl(el.流程相关项目路径));
            },
            getScientificResearchClass: function (name) {
                if (name.indexOf('申请') != -1) {
                    return 'btn-edit';
                } else {
                    if (name.indexOf('分配') != -1) {
                        return 'btn-users';
                    }
                    if (name.indexOf('报销') != -1) {
                        return 'btn-baoxiao';
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
            workFlowDetails: function (el) {
                var details = {
                    id: el.编号,
                    name: el.名称
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
                $('.modal-details .detailsPage').attr('src', vm.getUrl('/IMIS/views/系统管理/权限管理/流程详情.html'));

            },
            getStateClass: function (state) {
                switch (state) {
                    case 0:
                        return 'not-received';
                }
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            noticeDetails: function (id) {
                sessionStorage.noticeId = JSON.stringify(id);
            },
            downloadDetails: function (el) {
                sessionStorage.downloadDetails = JSON.stringify(el);
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        vm.onload();

        avalon.scan(document.body);
    });
    $('.main').mCustomScrollbar({
        theme: 'dark-3',
    });
});
