$(function () {
    isOverdue();
    var chartPaper = echarts.init(document.getElementById('chart-paper'));
    chartPaper.showLoading();
    window.vm = null;
    var departmentTree;
    avalon.ready(function () {
        window.vm = avalon.define({
            $id: 'root',
            req: {
                年度: new Date().getFullYear(),
            },
            model: [],
            sum: [],
            loaded: false,
            nothing: false,
            hasData: false,
            getChart: function (data, series,list) {
                //图表配置
                var option = {
                    title: {
                        text: vm.req.年度 +'年按职务统计所有成果-图',
                        x: 'center',
                        textStyle: {
                            color: '#666',
                            fontWeight: 'bold'
                        },
                        padding: [8, 15]
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
                        top: '20%',
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    legend: {
                        top: '50',
                        itemWidth: 30,
                        data:list
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: true,
                        data: data,
                        axisLabel: {
                            interval: 0,
                            rotate: 10
                        }
                    },
                    yAxis: {
                        type: 'value',
                        name: '数量（个）',
                        axisLabel: {
                            formatter: '{value} '
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
                vm.hasData = false;
                $.support.cors = true;
                FruitStatistics.getPostFruitStatisticsList('get', vm.req.$model, function getPostFruitStatisticsListListener(success, obj, strErro) {
                    if (success) {
                        vm.loaded = true;
                        vm.total = obj.length;
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            vm.nothing = true;
                            return;
                        } else {
                            var one = obj[0];
                            var series = [];
                            var list = [];
                            for (var key in one) {
                                if (key != '职务' && key != '合计') {
                                    var object = {
                                        name: key,
                                        type: 'bar',
                                        stack: '总量',
                                        barWidth: '8%',
                                        label: {
                                            normal: {
                                                show: true,
                                            }
                                        },
                                        data: []
                                    }
                                    series.push(object);
                                    list.push(object);
                                }
                                if (key != '职务') {
                                    vm.sum.push(one[key]);
                                }
                                if (key == '合计') {
                                    if (one[key] != 0) {
                                        vm.hasData = true;
                                    }
                                    var object = {
                                        name: key,
                                        type: 'line',
                                        label: {
                                            normal: {
                                                show: true,
                                                position: 'top'
                                            }
                                        },
                                        lineStyle: {
                                            normal: {
                                                color: "none"
                                            }
                                        },
                                        markLine: {
                                            lineStyle: {
                                                normal: {
                                                    color: '#fc97af'
                                                }
                                            },
                                            label: {
                                                normal: {
                                                    position: 'start'
                                                }
                                            },
                                            data: [{
                                                name: '年平均',
                                                type: 'average'
                                            }]
                                        },
                                        data: []
                                    }
                                    series.push(object);
                                }
                            }
                            var data = [];
                            for (var j = 0; j < obj.length - 1; j++) {
                                var one = obj[j];
                                data.push(one.职务);
                                for (var key in one) {
                                    for (var a = 0; a < series.length; a++) {
                                        if (key == series[a].name) {
                                            series[a].data.push(one[key]);
                                        }
                                    }
                                }
                            }
                            vm.model = obj;
                            vm.nothing = false;
                            vm.getChart(data, series,list);
                        }
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取按职务统计所有成果失败！');
                        console.info(strErro);
                    }
                });
            },
            search: function () {
                vm.query();
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