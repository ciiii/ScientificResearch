$(function () {
    window.vm = null;
    var type = getUrlParam('type');
    var xueShuDetails = JSON.parse(sessionStorage.xueShuDetails);

    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            getApiHost: getApiHost,
            model: {},
            expertInfo: {},
            load: function () {
                if (type == 0) {
                    vm.getYProjectMiddleInspectionDetails();
                }
                if (type == 1) {
                    vm.getYProjectConclusionDetails();
                }
            },
            getYProjectMiddleInspectionDetails: function () {
                ResearchProject.getYProjectMiddleInspectionDetails('get', xueShuDetails.id, function getYProjectMiddleInspectionDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            vm.expertInfo = {};
                            return;
                        } else {
                            vm.model = obj;
                            var expertInfo = obj.中检专家评审;
                            var html = '';
                            for (var i = 0; i < expertInfo.length; i++) {
                                var info = expertInfo[i];
                                for (var key in info) {
                                    if (info[key] == null) {
                                        info[key] = '';
                                    }
                                }
                                html += '<tr><th>专家姓名：</th><td>' + expertInfo[i].专家姓名 + '</td>' +
                                    '<th>部门：</th><td>' + expertInfo[i].专家部门名称 + '</td><th>评分类型：</th>' +
                                    '<td>' + expertInfo[i].评分项 + '</td><th>评分：</th><td>' + expertInfo[i].评分 +
                                    '</td></tr><tr><th>评审时间：</th><td>' + expertInfo[i].建立时间.slice(0, 11) + '</td> ' +
                                    '<th>评审意见：</th><td colspan="5">' + expertInfo[i].备注 + '</td></tr>';
                            }
                            $('.page-printing table tbody').append(html);
                        }

                    } else {
                        console.info('获取纵向项目中检详情失败！');
                        console.info(strErro);
                    }
                });
            },
            getYProjectConclusionDetails: function () {
                ResearchProject.getYProjectConclusionDetails('get', xueShuDetails.id, function getYProjectConclusionDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            vm.expertInfo = {};
                            return;
                        } else {
                            vm.model = obj;
                            var expertInfo = obj.结题专家评审;
                            var html = '';
                            for (var i = 0; i < expertInfo.length; i++) {
                                var info = expertInfo[i];
                                for (var key in info) {
                                    if (info[key] == null) {
                                        info[key] = '';
                                    }
                                }
                                html += '<tr><th>专家姓名：</th><td>' + expertInfo[i].专家姓名 + '</td>' +
                                    '<th>部门：</th><td>' + expertInfo[i].专家部门名称 + '</td><th>评分类型：</th>' +
                                    '<td>' + expertInfo[i].评分项 + '</td><th>评分：</th><td>' + expertInfo[i].评分 +
                                    '</td></tr><tr><th>评审时间：</th><td>' + expertInfo[i].建立时间.slice(0, 11) + '</td> ' +
                                    '<th>评审意见：</th><td colspan="5">' + expertInfo[i].备注 + '</td></tr>';
                            }
                            $('.page-printing table tbody').append(html);
                        }

                    } else {
                        console.info('获取纵向项目结题详情失败！');
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