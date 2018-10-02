$(function () {
    isOverdue();
    var chartPaper = echarts.init(document.getElementById('chart-paper'),'macarons');
    chartPaper.showLoading();
    window.vm = null;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                年度: '',
                收录情况: '',
                论文类型: '',
                JCR分区: '',
                论文第一完成单位: '',
                start影响因子区间: '',
                end影响因子区间: '',
            },
            JCR: '',
            start: '',
            end: '',
            collection: '',
            data: [],
            series: [],
            model: [],
            sum: [],
            total: '',
            loaded: false,
            nothing: false,
            getChart: function (data, series) {
                //图表配置
                var option = {
                    title: {
                        text: '论文成果统计图',
                        // subtext: new Date().getFullYear() + '年',
                        x: 'center',
                        textStyle: {
                            color: '#666',
                            fontWeight: 'bold'
                        },
                        padding: [20, 15]
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            magicType: {show: true, type: ['line', 'bar']},
                            saveAsImage: {show: true}
                        },
                    },
                    grid: {
                        top: 100,
                        right: 10,
                        bottom: 10,
                        left: 10,
                        containLabel: true
                    },
                    calculable: true,
                    legend: {
                        top: '70',
                        itemWidth: 30
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: true,
                        data: data,
                        axisLabel: {
                            interval: 0,
                            rotate: 25
                        }
                    },
                    yAxis: {
                        type: 'value',
                        nameTextStyle: {
                            color: '#666'
                        }

                    },
                    series: series
                };
                chartPaper.hideLoading();
                chartPaper.setOption(option);

                //使图表自适应
                window.onresize = function () {
                    chartPaper.resize();
                }
            },
            query: function () {
                vm.loaded = false;
                $.support.cors = true;
                FruitStatistics.getPaperFruitStatisticsList('get', vm.req.$model, function getPaperFruitStatisticsListListener(success, obj, strErro) {
                    if (success) {
                        vm.loaded = true;
                        vm.total = obj.length;
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            vm.nothing = true;
                            return;
                        } else {
                            var one = obj[0];
                            var allObject = [];
                            for (var key in one) {
                                if (key != '部门' && key != '合计') {
                                    var object = {
                                        name: key,
                                        type: 'bar',
                                        data: []
                                    }
                                    allObject.push(object);
                                }
                                if (key != '部门') {
                                    vm.sum.push(one[key]);
                                }
                            }
                            var data = [];
                            for (var j = 0; j < obj.length - 1; j++) {
                                var one = obj[j];
                                data.push(one.部门);
                                for (var key in one) {
                                    for (var a = 0; a < allObject.length; a++) {
                                        if (key == allObject[a].name) {
                                            allObject[a].data.push(one[key]);
                                        }
                                    }
                                }
                            }
                            vm.model = obj;
                            vm.data = data;
                            vm.series = allObject;
                            vm.nothing = false;
                            vm.getChart(vm.data, vm.series);
                        }
                    } else {
                        console.info('获取获奖成果统计失败！');
                        console.info(strErro);
                    }
                });
            },
            getPeriodicalCollection: function () {
                Periodical.getPeriodicalSeries('get', '期刊收录数据库', function getPeriodicalSeriesListener(success, obj, strErro) {
                    if (success) {
                        vm.collection = obj;
                    } else {
                        console.info('获取期刊收录数据库失败！');
                        console.info(strErro);
                    }
                })
            },
            search: function () {
                vm.req.JCR分区 = vm.JCR;
                vm.req.start影响因子区间 = vm.start;
                vm.req.end影响因子区间 = vm.end;
                vm.query();
            },
            changeType: function () {
                vm.req.收录情况 = $('.screen-box .collection').val();
                vm.search();
            },
            submit: function () {
                if (event.keyCode == 13) {
                    vm.search();
                }
            },
            getClass: function (val) {
                if (val == '总计') {
                    return 'sum';
                }
            },
            printView: function () {
                $('.btn-printing,.screen-box,.chart-box').hide();
                window.print();
                $('.btn-printing,.screen-box,.chart-box').show();
            }
        });
        vm.query();
        vm.$watch('onReady', function () {
            vm.getPeriodicalCollection();
        })
        avalon.scan(document.body);
    });
    $('.form-year').datetimepicker({
        format: 'yyyy',
        todayBtn: 1,
        autoclose: 1,
        startView: 4,
        minView: 4,
        language: 'zh-CN',
    });
});