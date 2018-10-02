$(function () {
    window.choiceVm = null;
    avalon.ready(function () {
        window.choiceVm = avalon.define({
            $id: 'choiceRoot',
            req: {
                Index: 1,
                Size: 10,
                LikeAllName: '',
                Like主办单位: '',
                年度: '',
                OrderType: false
            },
            company: '',
            time: '',
            total: '',
            model: [],
            arr: [],
            LikeValue: '',
            loaded: false,
            query: function () {
                choiceVm.loaded = false;
                $.support.cors = true;
                Periodical.getPeriodicalList('get', choiceVm.req.$model, function getPeriodicalListListener(success, obj, strErro) {
                    if (success) {
                        choiceVm.loaded = true;
                        choiceVm.total = obj.total;
                        if (obj == null || obj.list.length == 0) {
                            $('.modal-choice .pager').hide();
                            choiceVm.model = [];
                            return;
                        } else {
                            obj = obj.list;
                            choiceVm.model = obj;
                            $('.modal-choice .pager').show();
                        }
                        $('.modal-choice .pager').mamPager({
                            pageSize: choiceVm.req.Size,                           //页大小
                            pageIndex: choiceVm.req.Index,                     //当前页
                            recordTotal: choiceVm.total,                      //数据总数
                            type: 1,
                            prevText: "&laquo;",                       //上一页显示内容
                            nextText: "&raquo;",
                            noData: "暂无数据",
                            pageChange: function (index) {
                                choiceVm.req.Index = index;
                                choiceVm.loaded = false;
                                choiceVm.query();
                            }
                        });
                        $('.modal-add .bs-tooltip').tooltip();
                        $('.modal-add .screen-box .form-year').on('changeDate', function (ev) {
                            choiceVm.search();
                        });
                    } else {
                        console.info('获取刊物列表失败！');
                        console.info(strErro);
                    }
                });
            },
            search: function () {
                choiceVm.req.Index = 1;
                choiceVm.req.Like主办单位 = choiceVm.company;
                choiceVm.req.年度 = choiceVm.time;
                choiceVm.query();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    choiceVm.search();
                }
            },
            clickChoice: function (el) {
                dAddVm.publication = {
                    刊物名称: el.名称,
                    收录情况: el.收录情况,
                    影响因子: el.影响因子,
                    特征因子分值: el.特征因子分值,
                    期刊系列: el.期刊系列,
                    JCR: el.JCR分区,
                    CN: el.CN号,
                    ISSN: el.ISSN号,
                    编目名称: el.编目名称,
                    编目类别: el.编目类别
                }
                $('.modal-choice').modal('hide');

                for (var i in dAddVm.publication) {
                    if (dAddVm.publication[i] == null) {
                        dAddVm.publication[i] = '';
                    }
                }
                dAddVm.info.基本资料.刊物编号 = el.编号;
                console.info(dAddVm.publication);
            },
            year: function () {
                choiceVm.time = new Date().getFullYear();
            },
            del: function () {
                choiceVm.time = '';
            }
        })
        $('.modal-choice .screen-box .time').on('change', function () {
            choiceVm.req.Index = 1;
            choiceVm.req.年度 = $(this).children('option:selected').val();
            choiceVm.query();
        });
        $('.modal-choice .modal-body').mCustomScrollbar({
            theme: 'dark-3',
        });
        $('.form-year').datetimepicker({
            format: 'yyyy',
            todayBtn: 1,
            autoclose: 1,
            startView: 4,
            minView: 4,
            language: 'zh-CN',
        });
        choiceVm.query();
        avalon.scan(document.body);
    });
});