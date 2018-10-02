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
                年度: '',
                部门编号: '',
                获奖级别: ''
            },
            JCR: '',
            start: '',
            end: '',
            level: '',
            data: [],
            series: [],
            model: [],
            sum: [],
            total: '',
            department: '',
            loaded: false,
            nothing: false,
            data: [],
            getChart: function (data, series) {
                //图表配置
                var option = {
                    title: {
                        text: '获奖成果统计图',
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
                FruitStatistics.getAwardFruitStatisticsList('get', vm.req.$model, function getAwardFruitStatisticsListListener(success, obj, strErro) {
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
                        $('.bs-tooltip').tooltip();
                    } else {
                        console.info('获取获奖成果统计失败！');
                        console.info(strErro);
                    }
                });
            },
            getDictionaryList: function () {
                Dictionary.getDictionaryList('get', '获奖级别', function getDictionaryListListener(success, obj, strErro) {
                    if (success) {
                        vm.level = obj;
                    } else {
                        console.info('获取获奖级别失败！');
                        console.info(strErro);
                    }
                })
            },
            search: function () {
                vm.query();
            },
            changeType: function () {
                vm.req.收录情况 = $('.screen-box .level').val();
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
            getTheDeparments: function () {
                var setting = {
                    data: {
                        key: {
                            name: 'name'
                        },
                        simpleData: {
                            enable: true,
                            idKey: 'id',
                            pIdKey: 'pId',
                            rootPId: 0
                        },
                    },
                    callback: {
                        onClick: onClick
                    }
                };
                var nodes = [];
                Department.getEnableDepartmentList('get', '', function getEnableDepartmentListListener(success, obj, strErro) {
                    if (success) {
                        obj = obj.reverse();
                        if (obj != null) {
                            for (var i = 0; i < obj.length; i++) {
                                obj[i].id = obj[i].编号;
                                obj[i].pId = obj[i].上级部门编号;
                                obj[i].name = obj[i].名称;
                            }

                            nodes = obj;
                            departmentTree = $.fn.zTree.init($('.screen-box .departmentTree'), setting, nodes);
                        }
                    } else {
                        alert('获取部门列表数据失败');
                        console.info(strErro);
                    }
                });

                function onClick(e, treeId, treeNode) {
                    var nodes = departmentTree.getSelectedNodes(),
                        text = '';
                    nodes.sort(function compare(a, b) {
                        return a.id - b.id;
                    });
                    for (var i = 0, l = nodes.length; i < l; i++) {
                        text += nodes[i].name + ",";
                    }
                    if (text.length > 0) text = text.substring(0, text.length - 1);
                    var cityObj = $('.screen-box .department');
                    cityObj.val(text);
                    vm.req.部门编号 = treeNode.编号;
                    vm.department = treeNode.名称;
                    vm.hideMenu();
                    vm.query();
                }
            },
            hideMenu: function () {
                $('.screen-box #menuContent').fadeOut('fast');
                $('body').unbind('mousedown', vm.onBodyDown);
            },
            onBodyDown: function (event) {
                if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents(".screen-box #menuContent").length > 0)) {
                    vm.hideMenu();
                }
            },
            showMenu: function () {
                var obj = $('.screen-box .department');
                var offset = $('.screen-box .department').offset();
                $('.screen-box #menuContent').css({
                    left: offset.left + 'px',
                    top: offset.top + obj.outerHeight() + 'px'
                }).slideDown('fast');

                $('body').bind('mousedown', vm.onBodyDown);
                $('.screen-box .btn-del').show();
            },
            delInput: function () {
                vm.department = '';
                vm.req.部门编号 = '';
                vm.query();
                vm.hideMenu();
            },
            printView: function () {
                $('.btn-printing,.screen-box,.chart-box').hide();
                window.print();
                $('.btn-printing,.screen-box,.chart-box').show();
            }
        });
        vm.query();
        vm.$watch('onReady', function () {
            vm.getDictionaryList();

        })
        vm.getTheDeparments();
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