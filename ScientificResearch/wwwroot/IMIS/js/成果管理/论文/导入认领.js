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
                Begin论文正式出版日期: '',
                End论文正式出版日期: '',
                OrderType: false
            },
            userInfo: userInfo,
            title: '',
            name: '',
            total: '',
            model: [],
            startTime: '',
            endTime: '',
            arr: [],
            nothing: false,
            loaded: false,
            editType: false,
            detailsUrl: '',
            importType: '',
            allchecked: false,
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                Paper.getReceivePaperList('get', vm.req.$model, function getReceivePaperListListener(success, obj, strErro) {
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
                                obj[i].在线日期 = obj[i].论文Online日期;
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
            clickBtnEdit: function (el) {
                vm.editType = true;
                vm.isReceive = true;
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
                    id: el.编号
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
                $('.modal-details .detailsPage').attr('src', vm.getUrl('论文详情.html'));

            },
            importFun: function (val) {
                vm.importType = val;
            },
            batchDel: function () {
                vm.arr = [];
                for (var i = 0; i < vm.model.length; i++) {
                    if (vm.model[i].checked) {
                        vm.arr.push(vm.model[i].编号);
                    }
                }
                if (vm.arr.length == 0) {
                    $.oaNotify.error('没有已选项！');
                } else {
                    $('.modal-del').modal('show');
                    $('.modal-del .modal-body p').text('您确定要删除已选论文吗？');
                }

            },
            clickBtnDel: function (el) {
                vm.arr = [];
                vm.arr.push(el.编号);
                $('.modal-del .modal-body p').text('您确定要删除此论文吗？');
            },
            delPaper: function (arr) {
                Paper.delPaper('post', arr, function delPaperListener(success, obj, strErro) {
                    postBack(success, strErro, '删除成功！', '删除失败', '.modal-del', function callBack() {
                        vm.query();
                    });
                });
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