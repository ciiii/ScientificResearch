$(function () {
    window.shenHevm = null;
    var editInfo = JSON.parse(sessionStorage.editInfo);
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
    avalon.ready(function () {
        window.shenHevm = avalon.define({
            $id: 'shenHe',
            url: '',
            editInfo:editInfo,
            model: {
                步骤编号: editInfo.步骤编号,
                状态值: '',
                备注: '',
                附加数据:xueShuDetails.id
            },
            auditXProjectAlteration: function (data) {
                XProject.auditXProjectAlteration('post', data, function auditXProjectAlterationListener(success, obj, strErro) {
                    if (success) {
                        $.oaNotify.ok(' 提交成功！');
                        shenHevm.clickBtnReturn();
                        vm.query();
                    } else {
                        $.oaNotify.error(' 提交失败：' + strErro);
                    }
                });
            },
            clickSubmit: function (val) {
                shenHevm.model.状态值 = val;
                shenHevm.auditXProjectAlteration(shenHevm.model.$model);
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        $('.modal-body').mCustomScrollbar({
            theme: 'dark-3',
        });
        avalon.scan(document.body);
    });
});