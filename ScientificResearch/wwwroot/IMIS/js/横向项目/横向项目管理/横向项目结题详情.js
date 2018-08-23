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
            declareFiles: [],
            otherFile: [],
            funds: '',
            getXProjectConclusionDetails: function () {
                XProject.getXProjectConclusionDetails('get', xueShuDetails.id, function getXProjectConclusionDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            obj.基本信息 = obj.项目信息;
                            vm.model = obj;
                            if (obj.项目信息.合同文件路径 != '' && obj.项目信息.合同文件路径 != null) {
                                vm.files = obj.项目信息.合同文件路径.split(',');
                            }
                            if (obj.项目信息.合同认定登记承诺书路径 != '' && obj.项目信息.合同认定登记承诺书路径 != null) {
                                vm.declareFiles = obj.项目信息.合同认定登记承诺书路径.split(',');
                            }
                            if (obj.项目结题信息.结题资料路径 != '' && obj.项目结题信息.结题资料路径 != null) {
                                vm.otherFile = obj.项目结题信息.结题资料路径.split(',');
                            }
                            vm.funds = obj.项目信息.合同金额;
                        }

                    } else {
                        console.info('获取横向项目结题详情失败！');
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
        vm.getXProjectConclusionDetails();
        avalon.scan(document.body);
    });


});