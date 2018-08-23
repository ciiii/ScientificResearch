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
            getYDeclareDetails: function (id) {
                Declare.getYDeclareDetails('get', id, function getPatentDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                            if (obj.申报基本信息.伦理批文路径 != '' && obj.申报基本信息.伦理批文路径 != null) {
                                vm.files = obj.申报基本信息.伦理批文路径.split(',');
                            }
                            if (obj.申报基本信息.项目申报书路径 != '' && obj.申报基本信息.项目申报书路径 != null) {
                                vm.declareFiles = obj.申报基本信息.项目申报书路径.split(',');
                            }

                        }

                    } else {
                        console.info('获取纵向项目申报详情失败！');
                        console.info(strErro);
                    }
                });
            },
            Printing: function () {
                window.open('打印专家评审记录.html?id=' + xueShuDetails.id);
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
                    case '待专家评审':
                        return 'state-accomplish';
                    case '专家已指定':
                        return 'state-accomplish';
                    case '专家已评审':
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
        vm.getYDeclareDetails(xueShuDetails.id);
        avalon.scan(document.body);
    });


});