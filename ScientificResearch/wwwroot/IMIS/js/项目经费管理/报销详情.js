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
            getFundsReimbursementDetails: function () {
                FundsReimbursement.getFundsReimbursementDetails('get', xueShuDetails.id,function getFundsReimbursementDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                            if (obj.报销基本信息.相关文件路径!= '' && obj.报销基本信息.相关文件路径 != null) {
                                vm.files = obj.报销基本信息.相关文件路径.split(',');
                            }
                        }

                    } else {
                        console.info('获取经费报销详情失败！');
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
                    case '待分配专家':
                        return 'state-accomplish';
                    case '待专家评审':
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
        vm.getFundsReimbursementDetails();
        avalon.scan(document.body);
    });


});