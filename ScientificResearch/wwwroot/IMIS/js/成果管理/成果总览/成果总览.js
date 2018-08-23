$(function () {
    window.vm = null;
    if (localStorage.getItem('info') == null) {
        location.href = '/IMIS/views/login.html';
    }
    var userInfo = JSON.parse(localStorage.info).data;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                Index: 1,
                Size: 16,
                Like成果名称: '',
                Like发起人姓名: '',
                年度:'',
                成果类型:'',
                OrderType: false
            },
            userInfo: userInfo,
            title: '',
            name: '',
            total: '',
            model: [],
            startTime: '',
            endTime: '',
            arr:[],
            nothing: false,
            loaded: false,
            editType: false,
            detailsUrl: '',
            allchecked: false,
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                Fruit.getFruitList('get', vm.req.$model, function getFruitListListener(success, obj, strErro) {
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
                        console.info('获取成果总览列表失败！');
                        console.info(strErro);
                    }
                });

            },
            search: function () {
                vm.req.Index = 1;
                vm.req.Like发起人姓名 = vm.name;
                vm.req.Like成果名称 = vm.title;
                vm.query();
            },
            change:function () {
                vm.req.成果类型 =$('.screen-box .type').val();
                vm.search();
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
                vm.shenHeShow = false;
            },
            clickBtnEdit: function (el) {
                vm.editType = true;
                vm.shenHeShow = false;
                sessionStorage.editInfo = JSON.stringify(el.$model);
                var details = {
                    id: el.编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            details: function (el) {
                var details = {
                    id: el.成果编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
               $('.modal-details .detailsPage').attr('src', vm.getUrl(el.路径));

            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        $('.modal-add .tab-pane').mCustomScrollbar({
            theme: 'dark-3',
        });
        vm.query();
        avalon.scan(document.body);
    });
});