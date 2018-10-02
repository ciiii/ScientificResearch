$(function () {
    window.vm = null;
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            model: [],
            details: xueShuDetails,
            flieName: '',
            infoFiles: [],
            contentFiles: [],
            otherFiles: [],
            getPaperDetails: function (id) {
                Paper.getPaperDetails('get', id, function getPaperDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            obj.论文详情.论文在线日期 = obj.论文详情.论文Online日期;
                            if (obj.论文详情.论文标题类型 == null||obj.论文详情.论文标题类型=='') {
                                obj.论文详情.论文标题类型 = '';
                            } else {
                                obj.论文详情.论文标题类型 = '【 ' + obj.论文详情.论文标题类型 + ' 】 ';
                            }

                            vm.model = obj;
                            if (obj.论文详情.检索信息页相关文件路径 != '' && obj.论文详情.检索信息页相关文件路径 != null) {
                                vm.infoFiles = obj.论文详情.检索信息页相关文件路径.split(',');
                            }

                            if (obj.论文详情.论文正文路径 != '' && obj.论文详情.论文正文路径 != null) {
                                vm.contentFiles = obj.论文详情.论文正文路径.split(',');
                            }
                            if (obj.论文详情.其他相关文件路径 != '' && obj.论文详情.其他相关文件路径 != null) {
                                vm.otherFiles = obj.论文详情.其他相关文件路径.split(',');
                            }
                        }

                    } else {
                        console.info('获取论文详情失败！');
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
        vm.getPaperDetails(xueShuDetails.id);
        avalon.scan(document.body);
    });


});