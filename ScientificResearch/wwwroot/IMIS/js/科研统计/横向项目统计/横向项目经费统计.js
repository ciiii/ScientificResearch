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
                部门编号: '',
                负责人姓名: ''
            },
            model: [],
            sum: [],
            loaded: false,
            nothing: false,
            getChart: function (data, series,list) {
                //图表配置
                var option = {
                    title: {
                        text: '横向项目经费统计图',
                        // subtext: new Date().getFullYear() + '年',
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
                    calculable: true,
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
                        name: '金额（元）',
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
                $.support.cors = true;
                XProjectStatistics.getXFundsStatisticsList('get', vm.req.$model, function getXFundsStatisticsListListener(success, obj, strErro) {
                    if (success) {
                        vm.loaded = true;
                        vm.total = obj.length;
                        if (obj == null || obj.length == 0) {
                            vm.model = [];
                            vm.nothing = true;
                            chartPaper.hideLoading();
                            return;
                        } else {
                            var one = obj[0];
                            var series = [];
                            var list = [];
                            var newObj = {
                                项目负责人部门名称: '总计'
                            }
                            for (var key in one) {
                                if (key != '项目负责人部门名称') {
                                    var object = {
                                        name: key,
                                        type: 'bar',
                                        barWidth: '5%',
                                        label: {
                                            normal: {
                                                show: true,
                                            }
                                        },
                                        data: []
                                    }
                                    series.push(object);
                                    list.push(object);
                                    newObj[key] = 0;
                                }
                                if (key != '项目负责人部门名称') {
                                    vm.sum.push(one[key]);
                                }
                            }
                            var data = [];
                            for (var j = 0; j < obj.length; j++) {
                                var one = obj[j];
                                data.push(one.项目负责人部门名称);
                                for (var key in one) {
                                    if (key != '项目负责人部门名称') {
                                        newObj[key] += one[key];
                                    }
                                    for (var a = 0; a < series.length; a++) {
                                        if (key == series[a].name) {
                                            series[a].data.push(one[key]);
                                        }
                                    }
                                }
                            }
                            obj.push(newObj);
                            vm.model = obj;
                            vm.nothing = false;
                            vm.getChart(data, series,list);
                        }
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取横向项目经费统计失败！');
                        console.info(strErro);
                    }
                });
            },
            search: function () {
                vm.query();
            },
            changeType: function () {
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