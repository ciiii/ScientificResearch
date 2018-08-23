$(function () {
    window.vm = null;
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            model: [],
            details: xueShuDetails,
            flieName: '',
            files:[],
            companyFiles: [],
            commentFiles: [],
            getAwardDetails: function (id) {
                Award.getAwardDetails('get', id, function getAwardDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                            if (obj.获奖详情.相关文件路径 != '' && obj.获奖详情.相关文件路径 != null) {
                                vm.files = obj.获奖详情.相关文件路径.split(',');
                            }
                            if (obj.获奖详情.获奖单位文件路径 != '' && obj.获奖详情.获奖单位文件路径 != null) {
                                vm.companyFiles = obj.获奖详情.获奖单位文件路径.split(',');
                            }
                            if (obj.获奖详情.获奖批文 != '' && obj.获奖详情.获奖批文 != null) {
                                vm.commentFiles = obj.获奖详情.获奖批文.split(',');
                            }
                        }

                    } else {
                        console.info('获取获奖详情失败！');
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
            }
        });
        vm.getAwardDetails(xueShuDetails.id);
        avalon.scan(document.body);
    });


});