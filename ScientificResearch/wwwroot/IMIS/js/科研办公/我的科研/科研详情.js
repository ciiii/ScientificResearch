$(function () {
    window.vm = null;
    if (localStorage.getItem('info') == null) {
        location.href = '/IMIS/views/login.html';
    }
    window.mUserInfo = JSON.parse(localStorage.info).data;;
    var back = JSON.parse(sessionStorage.mkeyandetails);
    var userId = oa.getUrlParam('userId');
    if (userId == null) {
        userId = mUserInfo.人员.编号;
    }
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            model: [],
            loaded: false,
            mUsers: [],
            back: back,
            getDetails: function (id) {
                vm.loaded = false;
                $.support.cors = true;
                ScientificResearch.getScientificResearchDetails('get', id, function getScientificResearchDetailsListener(success, obj, strErro) {
                    if (success) {
                        vm.loaded = true;
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                            vm.mUsers = obj.个人资料;
                        }
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取科研详情失败！');
                        console.info(strErro);
                    }
                });
            },
            submit: function () {
                if (event.keyCode == 13) {
                    vm.search();
                }
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            titleClick: function (name) {
                $(name).next().toggle();
            },
            detailsFruit: function (el) {
                var details = {
                    id: el.成果编号,
                    name: el.发起人姓名,
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
                debugger;
                $('.modal-details .detailsPage').attr('src', vm.getUrl(el.路径));
            },
            details: function (el) {
                var details = {
                    id: el.项目编号,
                    name: el.发起人姓名,
                }
                sessionStorage.xueShuDetails = JSON.stringify(details);
                $('.modal-details .detailsPage').attr('src', vm.getUrl(el.路径));
            },
            clickDetails: function (el) {
                sessionStorage.mPeriodicalInfo = JSON.stringify(el.$model);
            },
            getClass: function (statue) {
                switch (statue) {
                    case '已完成-审核通过':
                        return 'state-mark';
                    default:
                        return '';
                }
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        $('.nav-tabs a').on('click', function (e) {
            e.preventDefault();
            $(this).tab('show');
        })
        vm.getDetails(userId);
        avalon.scan(document.body);
    });
});