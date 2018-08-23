$(function () {
    window.shenHevm = null;
    var editInfo = JSON.parse(sessionStorage.editInfo);
    var userInfo = JSON.parse(localStorage.info).data;
    avalon.ready(function () {
        window.shenHevm = avalon.define({
            $id: 'shenHe',
            url: '',
            editInfo: editInfo,
            reviewScheme: [],
            score: [],
            oneSelect: '',
            expertAuditing: vm.expertAuditing,
            model: {
                步骤编号: editInfo.步骤编号,
                状态值: 1,
                备注: '',
                附加数据: [
                    {
                        编号: 0,
                        专家编号: userInfo.人员.编号,
                        评分项: '',
                        评分: '',
                        备注: '',
                    }
                ]
            },
            expertDeclareAuditing: function (data) {
                Declare.expertDeclareAuditing('post', data, function expertDeclareAuditingListener(success, obj, strErro) {
                    if (success) {
                        $.oaNotify.ok(' 提交成功！');
                        shenHevm.clickBtnReturn();
                        vm.query();
                    } else {
                        $.oaNotify.error(' 提交失败：' + strErro);
                    }
                });
            },
            expertProjectMiddleInspection: function (data) {
                ResearchProject.expertProjectMiddleInspection('post', data, function expertProjectMiddleInspectionListener(success, obj, strErro) {
                    if (success) {
                        $.oaNotify.ok(' 提交成功！');
                        shenHevm.clickBtnReturn();
                        vm.query();
                    } else {
                        $.oaNotify.error(' 提交失败：' + strErro);
                    }
                });
            },
            getReviewScheme: function () {
                Dictionary.getDictionaryList('get', '评分方案', function getDictionaryListListener(success, obj, strErro) {
                    if (success) {
                        shenHevm.reviewScheme = obj;
                        $('.reviewScheme').on('change', function () {
                            shenHevm.oneSelect = $(this).val();
                            shenHevm.model.附加数据[0].评分项 = $(".reviewScheme option:selected").text();
                        });
                    } else {
                        console.info('获取评分方案失败：' + strErro);
                    }
                });
            },
            getscore: function (id) {
                Dictionary.getDictionaryChild('get', id, function getDictionaryChildListener(success, obj, strErro) {
                    if (success) {
                        shenHevm.score = obj;
                    } else {
                        console.info('获取评分失败：' + strErro);
                    }
                });
            },
            inputVal: function (name) {
                if ($(name).val() != '' && $(name).val() != 0) {
                    $(name).next().hide();
                    $(name).removeClass('error-input');
                    return true;
                } else {
                    $(name).next().show();
                    $(name).addClass('error-input');
                    return false;
                }
            },
            clickSubmit: function () {
                var reviewScheme = shenHevm.inputVal('.reviewScheme');
                var score = shenHevm.inputVal('.shenHe-box .score');
                var opinion = shenHevm.inputVal('.shenHe-box .opinion');
                if (!reviewScheme) {
                    $.oaNotify.error(' 评分方案不能为空！');
                    return;
                }
                if (!score) {
                    $.oaNotify.error(' 评分不能为空！');
                    return;
                }
                if (!opinion) {
                    $.oaNotify.error(' 审核意见不能为空！');
                    return;
                }
                if (shenHevm.expertAuditing == 0) {
                    shenHevm.expertDeclareAuditing(shenHevm.model.$model);
                }
                if (shenHevm.expertAuditing == 1) {
                    shenHevm.expertProjectMiddleInspection(shenHevm.model.$model);
                }
            },
            clickBtnReturn: function () {
                $('.modal').modal('hide');
            },
        });
        $('.modal-body').mCustomScrollbar({
            theme: 'dark-3',
        });
        avalon.scan(document.body);
    });
    shenHevm.getReviewScheme()
});