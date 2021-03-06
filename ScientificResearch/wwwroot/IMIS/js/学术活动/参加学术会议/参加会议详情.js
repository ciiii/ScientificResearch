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
            funds:0,
            getDetails: function (id) {
                Meeting.getMeetingDetails('get', id, function getMeetingDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                            if (obj.参加会议详情.参会相关文件路径 != '' && obj.参加会议详情.参会相关文件路径 != null) {
                                vm.files = obj.参加会议详情.参会相关文件路径.split(',');
                            }
                            if (obj.财务信息) {
                                obj.财务信息.forEach(function (el) {
                                    vm.funds += el.批准经费;
                                })
                            }
                        }

                    } else {
                        console.info('获取会议详情失败！');
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
        });
        vm.getDetails(xueShuDetails.id);
        avalon.scan(document.body);
    });


});
