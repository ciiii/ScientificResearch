$(function () {
    isOverdue();
    var chartMajorA = echarts.init(document.getElementById('chart-majorA'),'macarons');
    var chartMajorB = echarts.init (document.getElementById ('chart-majorB'),'macarons');
    chartMajorA.showLoading();
    chartMajorB.showLoading();
    window.vm = null;
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
            data: [],
            getChartA: function (data, series,list) {
                //图表配置
                var option = {
                    title: {
                        text: vm.req.年度 +'年科研成果与人员岗位统计图',
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
                chartMajorA.hideLoading();
                chartMajorA.setOption(option);
            },
            getChartB: function (data, series) {
                //图表配置
                var option = {
                    title : {
                        text: vm.req.年度 +'年科研成果与人员专业类别统计图',
                        x:'center',
                        textStyle: {
                            color: '#666',
                            fontWeight: 'bold'
                        }
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            saveAsImage: {show: true}
                        },
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data:data
                    },
                    series : [
                        {
                            name: '访问来源',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:series,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                chartMajorB.hideLoading();
                chartMajorB.setOption (option);

                //使图表自适应
                window.onresize = function () {
                    chartMajorA.resize();
                    chartMajorB.resize();
                }
            },
            getPostTypeFruit: function () {
                vm.loaded = false;
                vm.hasData = false;
                $.support.cors = true;
                FruitStatistics.getPostTypeFruitStatisticsList('get', vm.req.$model, function getPostTypeFruitStatisticsListListener(success, obj, strErro) {
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
                                if (key != '岗位类型' && key != '合计') {
                                    var object = {
                                        name: key,
                                        type: 'bar',
                                        stack: '总量',
                                        barWidth: '10%',
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
                                if (key != '岗位类型') {
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
                                data.push(one.岗位类型);
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
                            vm.getChartA(data, series,list);
                        }
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取论文成果统计失败！');
                        console.info(strErro);
                    }
                });
            },
            getMajorLevelFruit: function () {
                vm.loaded = false;
                $.support.cors = true;
                FruitStatistics.getMajorLevelFruitStatisticsList('get', vm.req.$model, function getMajorLevelFruitStatisticsListListener(success, obj, strErro) {
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
                            var data = [];
                            for (var key in one) {
                                if (key != '专业技术级别' && key != '合计') {
                                    var object = {
                                        value:one[key],
                                        name: key,
                                    }
                                    series.push(object);
                                    data.push(key);
                                }
                                if (key != '专业技术级别') {
                                    vm.sum.push(one[key]);
                                }
                            }

                            for (var j = 0; j < obj.length - 1; j++) {
                                var one = obj[j];
                                for (var key in one) {
                                    for (var a = 0; a < series.length; a++) {
                                        if (key == series[a].name) {
                                            series[a].value+=one[key];
                                        }
                                    }
                                }
                            }
                            vm.model = obj;
                            vm.data = data;
                            vm.series = series;
                            vm.nothing = false;
                            vm.getChartB(vm.data, vm.series);
                        }
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取论文成果统计失败！');
                        console.info(strErro);
                    }
                });
            },
            search: function () {
                vm.getPostTypeFruit();
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
        vm.getPostTypeFruit();
        vm.getMajorLevelFruit();
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
    // //使图表自适应
    // window.onresize = function () {
    //     chartMajorA.resize();
    //     chartMajorB.resize();
    // }
});