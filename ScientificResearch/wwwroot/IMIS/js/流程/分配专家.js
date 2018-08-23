$(function () {
    window.AssignorVm = null;
    var editInfo = JSON.parse(sessionStorage.editInfo);
    avalon.ready(function () {
        window.AssignorVm = avalon.define({
            $id: 'shenHe',
            url: '',
            editInfo: editInfo,
            model: {
                步骤编号: editInfo.步骤编号,
                状态值: 1,
                备注: '',
                附加数据: []
            },
            experts: [],
            postWorkFlow: function (data) {
                WorkFlow.WorkFlowAssignor('post', data, function WorkFlowListener(success, obj, strErro) {
                    if (success) {
                        $.oaNotify.ok(' 提交成功！');
                        AssignorVm.clickBtnReturn();
                        vm.search();
                    } else {
                        $.oaNotify.error(' 提交失败：' + strErro);
                    }
                });
            },
            clickSubmit: function () {
                var arr = []
                for (var i in AssignorVm.experts) {
                    arr.push(AssignorVm.experts[i].编号)
                }
                AssignorVm.model.附加数据 = arr;
                AssignorVm.postWorkFlow(AssignorVm.model.$model);
                console.info(AssignorVm.experts);
            },
            getUrl: function (url) {
                return decodeURI(url);
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        avalon.scan(document.body);
    });
});