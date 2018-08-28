$(function () {
    window.dAddVm = null;
    avalon.ready(function () {
        window.dAddVm = avalon.define({
            $id: 'Add',
            users: [],
            haveAddExpertTalentsUsers: function (data) {
                ExpertTalents.haveAddExpertTalentsUsers('post', data, function haveAddExpertTalentsUsersListener(success, obj, strErro) {
                    postBack(success, strErro, '提交成功！', '提交失败：', '.modal-add', function callBack() {
                        vm.query();
                    });
                });
            },
            getUrl: function (url) {
                return decodeURI(url);
            },
            clickSubmit: function () {
                if (dAddVm.users.length > 0) {
                    var data = [];
                    for (var i =0;i<dAddVm.users.length;i++) {
                        data.push(dAddVm.users[i].编号);
                    }
                    dAddVm.haveAddExpertTalentsUsers(data);
                } else {
                    $.oaNotify.error('请选择人员！');
                }

            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        })
        $('.modal-choice .modal-body,.menuContent').mCustomScrollbar({
            theme: 'dark-3',
        });
        dAddVm.users = [];
        avalon.scan(document.body);
    });
});