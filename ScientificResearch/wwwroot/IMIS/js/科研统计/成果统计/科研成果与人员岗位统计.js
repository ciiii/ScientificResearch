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
                年度: '',
                收录情况: '',
                岗位名称: ''
            },
            JCR: '',
            start: '',
            end: '',
            collection:[],
            postName: [],
            data: [],
            series: [],
            model: [],
            sum: [],
            total: '',
            department: '',
            loaded: false,
            nothing: false,
            data: [],
            getChartA: function (data, series) {
                //图表配置
                var option = {
                    title: {
                        text: '科研成果与人员岗位统计图',
                        subtext: new Date().getFullYear() + '年',
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
                chartMajorA.hideLoading();
                chartMajorA.setOption(option);
            },
            getChartB: function (data, series) {
                //图表配置
                var option = {
                    title : {
                        text: '科研成果与人员专业类别统计图',
                        // subtext: new Date().getFullYear() + '年',
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
                            var allObject = [];
                            for (var key in one) {
                                if (key != '岗位类型' && key != '合计') {
                                    var object = {
                                        name: key,
                                        type: 'bar',
                                        data: []
                                    }
                                    allObject.push(object);
                                }
                                if (key != '岗位类型') {
                                    vm.sum.push(one[key]);
                                }
                            }
                            var data = [];
                            for (var j = 0; j < obj.length - 1; j++) {
                                var one = obj[j];
                                data.push(one.岗位类型);
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
                            vm.getChartA(vm.data, vm.series);
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

                            var allObject = [];
                            var data = [];
                            for (var key in one) {
                                if (key != '专业技术级别' && key != '合计') {
                                    var object = {
                                        value:one[key],
                                        name: key,
                                    }
                                    allObject.push(object);
                                    data.push(key);
                                }
                                if (key != '专业技术级别') {
                                    vm.sum.push(one[key]);
                                }
                            }

                            for (var j = 0; j < obj.length - 1; j++) {
                                var one = obj[j];
                                for (var key in one) {
                                    for (var a = 0; a < allObject.length; a++) {
                                        if (key == allObject[a].name) {
                                            allObject[a].value+=one[key];
                                        }
                                    }
                                }
                            }
                            vm.model = obj;
                            vm.data = data;
                            vm.series = allObject;
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
            getDictionaryList: function () {
                Dictionary.getDictionaryList('get', '岗位名称', function getDictionaryListListener(success, obj, strErro) {
                    if (success) {
                        vm.postName = obj;
                    } else {
                        console.info('获取岗位名称失败！');
                        console.info(strErro);
                    }
                })
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
                vm.getPostTypeFruit();
            },
            changeType: function () {
                vm.req.岗位名称 = $('.screen-box .postName').val();
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
        vm.getPostTypeFruit();
        vm.getMajorLevelFruit();
        vm.$watch('onReady', function () {
            vm.getDictionaryList();
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
    // //使图表自适应
    // window.onresize = function () {
    //     chartMajorA.resize();
    //     chartMajorB.resize();
    // }
});