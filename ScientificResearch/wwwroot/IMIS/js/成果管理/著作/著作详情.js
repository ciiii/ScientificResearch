$(function () {
    window.vm = null;
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            model: [],
            details: xueShuDetails,
            flieName: '',
            coverFiles: [],
            copyrightFiles: [],
            prefaceFiles: [],
            catalogFiles: [],
            otherFiles: [],
            getWorkDetails: function (id) {
                Work.getWorkDetails('get', id, function getWorkDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                            if (obj.著作详情.封面相关文件路径 != '' && obj.著作详情.封面相关文件路径 != null) {
                                vm.coverFiles = obj.著作详情.封面相关文件路径.split(',');
                            }
                            if (obj.著作详情.版权页相关文件路径 != '' && obj.著作详情.版权页相关文件路径 != null) {
                                vm.copyrightFiles = obj.著作详情.版权页相关文件路径.split(',');
                            }
                            if (obj.著作详情.前言页相关文件路径 != '' && obj.著作详情.前言页相关文件路径 != null) {
                                vm.prefaceFiles = obj.著作详情.前言页相关文件路径.split(',');
                            }
                            if (obj.著作详情.完整目录页相关文件路径 != '' && obj.著作详情.完整目录页相关文件路径 != null) {
                                vm.catalogFiles = obj.著作详情.完整目录页相关文件路径.split(',');
                            }
                            if (obj.著作详情.其他相关文件路径 != '' && obj.著作详情.其他相关文件路径 != null) {
                                vm.otherFiles = obj.著作详情.其他相关文件路径.split(',');
                            }
                        }

                    } else {
                        console.info('获取著作详情失败！');
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
        vm.getWorkDetails(xueShuDetails.id);
        avalon.scan(document.body);
    });


});