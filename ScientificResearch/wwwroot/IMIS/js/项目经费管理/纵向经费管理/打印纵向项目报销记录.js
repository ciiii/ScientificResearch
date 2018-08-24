$(function () {
    window.vm = null;
    var id = getUrlParam('id');
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            getApiHost: getApiHost,
            model: {},
            expertInfo: {},
            getYProjectMiddleInspectionDetails: function () {
                FundsReimbursement.getFundsReimbursementDetails('get', id, function getFundsReimbursementDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            vm.expertInfo = {};
                            return;
                        } else {
                            for (var i in obj.报销基本信息) {
                                if (obj.报销基本信息[i] == null) {
                                    obj.报销基本信息[i] = '';
                                }
                            }
                            vm.model = obj;
                        }
                    } else {
                        console.info('获取某报销详情！');
                        console.info(strErro);
                    }
                });
            },
            printView: function () {
                $('#divNotPrint').hide();
                window.print();
                $('#divNotPrint').show();
            }
        });

        avalon.scan(document.body);
    });

    function getUrlParam(key) {
        key = key.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + key + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(window.location.href);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
});