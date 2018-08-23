$(function () {
    window.vm = null;
    var id = getUrlParam('id');
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            getApiHost: getApiHost,
            model: {},
            expertInfo: {},
            getYDeclareDetails: function (id) {
                Declare.getYDeclareDetails('get', id, function getPatentDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            vm.expertInfo = {};
                            return;
                        } else {
                            vm.model = obj;
                            var expertInfo = obj.专家评审记录;
                            var html = '';
                            for (var i in expertInfo) {
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

                            console.info($('.page-printing table tbody').html());
                        }

                    } else {
                        console.info('获取纵向项目申报详情失败！');
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
        vm.getYDeclareDetails(id)
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