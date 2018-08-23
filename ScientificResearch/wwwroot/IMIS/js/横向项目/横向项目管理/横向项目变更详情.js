$(function () {
    window.vm = null;
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            model: {
                基本资料: null,
                参与人信息: [],
                财务信息: [],
                审核记录: []
            },
            details: xueShuDetails,
            flieName: '',
            files: [],
            declareFiles: [],
            funds: '',
            arr: [],
            getXProjectAlterationDetails: function () {
                XProject.getXProjectAlterationDetails('get', xueShuDetails.id, function getXProjectAlterationDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                            if (obj.变更后.合同文件路径 != '' && obj.变更后.合同文件路径 != null) {
                                vm.files = obj.变更后.合同文件路径.split(',');
                            }
                            if (obj.变更后.合同认定登记承诺书路径 != '' && obj.变更后.合同认定登记承诺书路径 != null) {
                                vm.declareFiles = obj.变更后.合同认定登记承诺书路径.split(',');
                            }
                            vm.funds = obj.变更后.合同金额;

                            for (var i in obj.变更前) {
                                if (obj.变更前[i] != obj.变更后[i]) {
                                    var data = {
                                        名称:i,
                                        变更前: obj.变更前[i],
                                        变更后: obj.变更后[i],
                                    }
                                    vm.arr.push(data);
                                }
                            }
                        }

                    } else {
                        console.info('获取纵向项目变更详情失败！');
                        console.info(strErro);
                    }
                });
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
            getHtmlDocName: function (url) {
                var arr = url.split('\\');
                return arr[arr.length - 1];
            },
            getUrl: function (url) {
                return decodeURI(encodeURI(encodeURI(url)));
            },
        });
        vm.getXProjectAlterationDetails();
        avalon.scan(document.body);
    });
});