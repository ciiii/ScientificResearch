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
            fundsA:'',
            fundsB:'',
            getYProjectEstablishDetails: function (id) {
                ProjectEstablish.getYProjectEstablishDetails('get', id, function getYProjectEstablishDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                            if (obj.立项基本信息.伦理批文路径 != '' && obj.立项基本信息.伦理批文路径 != null) {
                                vm.files = obj.立项基本信息.伦理批文路径.split(',');
                            }
                            if (obj.立项基本信息.立项文件路径 != '' && obj.立项基本信息.立项文件路径 != null) {
                                vm.declareFiles = obj.立项基本信息.立项文件路径.split(',');
                            }
                            vm.fundsA = obj.立项基本信息.批准经费;
                            vm.fundsB = obj.立项基本信息.配套经费;
                        }

                    } else {
                        console.info('获取纵向项目立项详情失败！');
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
        vm.getYProjectEstablishDetails(xueShuDetails.id);
        avalon.scan(document.body);
    });


});