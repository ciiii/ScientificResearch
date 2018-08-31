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
                Like论文标题: '',
                Like第一作者: '',
                Begin论文正式出版日期:'',
                End论文正式出版日期:'',
                OrderType: false
            },
            userInfo:userInfo,
            title: '',
            name:'',
            total: '',
            model: [],
            startTime:'',
            endTime:'',
            nothing: false,
            loaded: false,
            editType:false,
            detailsUrl: '',
            allchecked: false,
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                Paper.getPaperList('get', vm.req.$model, function getPaperListListener(success, obj, strErro) {
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
                                obj[i].在线日期 = obj[i].论文Online日期;
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
                        console.info('获取论文列表失败！');
                        console.info(strErro);
                    }
                });

            },
            search: function () {
                vm.req.Index = 1;
                vm.req.Like第一作者 = vm.name;
                vm.req.Like论文标题 = vm.title;
                vm.req.Begin论文正式出版日期 = vm.startTime;
                vm.req.End论文正式出版日期 = vm.endTime;
                vm.query();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    vm.search();
                }
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
                vm.isReceive = false;
            },
            clickBtnEdit: function (el) {
                vm.editType = true;
                vm.isReceive = false;
                sessionStorage.editInfo = JSON.stringify(el.$model);
                var details = {
                    id: el.编号,
                    name: el.论文标题,
                    shenHeUrl: el.步骤链接路径,
                    步骤编号: el.步骤编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
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
                $('.modal-details .detailsPage').attr('src',vm.getUrl(el.流程相关项目路径));

            },
            batchExport: function () {
                $('.btn-export').attr('href', '' );
            },
            getStatusClass: function (name) {
                if (name.indexOf('申请') != -1 ) {
                    return 'btn-edit';
                } else {
                    return 'btn-examine';
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
                    default:
                        return '';
                }
            },
            getFeedbackClass: function (statue) {
                if(statue){
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
        avalon.scan(document.body);
    });
});