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
            LectureFiles: [],
            getDetails: function (id) {
                Lecture.getLectureFeedbackDetails('get', id, function getLectureFeedbackDetailsListener(success, obj, strErro) {
                    if (success) {
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            return;
                        } else {
                            vm.model = obj;
                            if (obj.讲座反馈详情.主讲人简历路径 != '' && obj.讲座反馈详情.主讲人简历路径 != null) {
                                vm.LectureFiles = obj.讲座反馈详情.主讲人简历路径.split(',');
                            }
                            if (obj.讲座反馈详情.讲座附件路径 != '' && obj.讲座反馈详情.讲座附件路径 != null) {
                                vm.files = obj.讲座反馈详情.讲座附件路径.split(',');
                            }
                        }

                    } else {
                        console.info('获取讲座反馈详情失败！');
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