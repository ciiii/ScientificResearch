$(function () {
    window.vm = null;
    var id = getUrlParam('id');
    var type = getUrlParam('type');
    console.info(type);
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            getApiHost: getApiHost,
            model: {},
            expertInfo: {},
            type: type,
            name: '',
            number: '',
            getFundsReimbursementDetails: function () {
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
                            if (vm.type < 2) {
                                var arr = obj.报销基本信息.项目名称.split('[');
                                vm.name = arr[0];
                                vm.number = arr[1].slice(0, -1);
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
            },
            numberDX: function (n) {
                var fraction = ['角', '分'];
                var digit = ['零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖'];
                var unit = [['元', '万', '亿'], ['', '拾', '佰', '仟']];
                var head = n < 0 ? '欠' : '';
                n = Math.abs(n);
                var s = '';
                for (var i = 0; i < fraction.length; i++) {
                    s += (digit[Math.floor(n * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./, '');
                }
                s = s || '整';
                n = Math.floor(n);
                for (var i = 0; i < unit[0].length && n > 0; i++) {
                    var p = '';
                    for (var j = 0; j < unit[1].length && n > 0; j++) {
                        p = digit[n % 10] + unit[1][j] + p;
                        n = Math.floor(n / 10);
                    }
                    s = p.replace(/(零.)*零$/, '').replace(/^$/, '零') + unit[0][i] + s;
                }
                return head + s.replace(/(零.)*零元/, '元').replace(/(零.)+/g, '零').replace(/^整$/, '零元整');
            }
        });

        avalon.scan(document.body);
        vm.getFundsReimbursementDetails();
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
