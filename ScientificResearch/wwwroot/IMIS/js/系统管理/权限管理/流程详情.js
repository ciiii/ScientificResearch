$(function () {
    window.vm = null;
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            model: [],
            details: xueShuDetails,
            flieName: '',
            files: [],
            WorkFlowList: function () {
                WorkFlow.WorkFlowList('get', xueShuDetails.id,function WorkFlowListListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                        }

                    } else {
                        console.info('获取流程详情列表失败！');
                        console.info(strErro);
                    }
                });
            }
        });
        vm.WorkFlowList();
        avalon.scan(document.body);
    });


});