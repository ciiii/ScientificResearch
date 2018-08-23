$(function () {
    window.vm = null;
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            model: {
                立项基本信息: null,
                参与人信息: [],
                财务信息: [],
                审核记录: []
            },
            flieName: '',
            files: [],
            declareFiles: [],
            otherFile: [],
            fundsA: '',
            fundsB: '',
            arr: [],
            getYProjectAlterationDetails: function () {
                ResearchProject.getYProjectAlterationDetails('get', xueShuDetails.id, function getYProjectAlterationDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                            if (obj.变更后.伦理批文路径 != '' && obj.变更后.伦理批文路径 != null) {
                                vm.files = obj.变更后.伦理批文路径.split(',');
                            }
                            if (obj.变更后.立项文件路径 != '' && obj.变更后.立项文件路径 != null) {
                                vm.declareFiles = obj.变更后.立项文件路径.split(',');
                            }
                            vm.fundsA = obj.变更后.批准经费;
                            vm.fundsB = obj.变更后.配套经费;

                            for (var i in obj.变更前) {
                                if (obj.变更前[i] != obj.变更后[i]) {
                                    var data = {
                                        名称:i,
                                        变更前: obj.变更前[i],
                                        变更后: obj.变更后[i],
                                    }
                                    vm.arr.push(data);
                                }
                            }
                        }

                    } else {
                        console.info('获取纵向项目变更详情失败！');
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
        vm.getYProjectAlterationDetails();
        avalon.scan(document.body);
    });
});