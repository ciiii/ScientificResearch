<template>
  <div :class="className" :style="{height:'350px',width:'100%'}"/>
</template>

<script>
  import echarts from 'echarts';

  require('echarts/theme/macarons'); // echarts theme
  import { debounce } from '@/utils';

  export default {
    props: {
      className: {
        type: String,
        default: 'chart'
      },
      autoResize: {
        type: Boolean,
        default: true
      },
      chartData: {
        type: Object,
        default: true
      },
      typeList: {
        type: Array,
        default: true
      },
      typeTask: {
        type: Array,
        default: true
      },
      successTask: {
        type: Array,
        default: true
      }
    },
    data() {
      return {
        chart: null,
        sidebarElm: null,
        newTypeTask: [],
        newSuccessTask: []
      };
    },
    mounted() {
      this.typeTask.forEach((item)=>{
        this.newTypeTask.push(item.value)
      })
      this.successTask.forEach((item)=>{
        this.newSuccessTask.push(item.value)
      })

      this.initChart();
      if (this.autoResize) {
        this.__resizeHandler = debounce(() => {
          if (this.chart) {
            this.chart.resize();
          }
        }, 100);
        window.addEventListener('resize', this.__resizeHandler);
      }

      // 监听侧边栏的变化
      this.sidebarElm = document.getElementsByClassName('sidebar-container')[0];
      this.sidebarElm && this.sidebarElm.addEventListener('transitionend', this.sidebarResizeHandler);
    },
    beforeDestroy() {
      if (!this.chart) {
        return;
      }
      if (this.autoResize) {
        window.removeEventListener('resize', this.__resizeHandler);
      }
      this.sidebarElm && this.sidebarElm.removeEventListener('transitionend', this.sidebarResizeHandler);

      this.chart.dispose();
      this.chart = null;
    },
    methods: {
      sidebarResizeHandler(e) {
        if (e.propertyName === 'width') {
          this.__resizeHandler();
        }
      },
      setOptions(typeList, typeTask, successTask) {
        this.chart.setOption({
          title: {
            text: '按轮转任务统计',
            x: 'center',
            textStyle: {
              color: '#333',
              fontWeight: 'bold'
            }
          },
          grid: {
            top: 80,
            left: 10,
            right: 30,
            bottom: 15,
            containLabel: true
          },
          toolbox: {
            show: true,
            feature: {
              mark: { show: true },
              dataView: { show: true, readOnly: false },
              magicType: { show: true, type: ['bar'] },
              restore: { show: true },
              saveAsImage: { show: true }
            }
          },
          calculable: true,
          legend: {
            data: ['任务总数', '已完成任务', '在科', '已出科'],
            itemWidth: 30,
            top: '40'
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'cross'
            },
            padding: [5, 10]
          },
          xAxis: {
            type: 'category',
            data: typeList
          },
          yAxis: [
            {
              type: 'value',
              name: '数量（个）',
              axisLabel: {
                formatter: '{value} '
              }
            }
          ],
          series: [
            {
              name: '任务总数',
              smooth: true,
              type: 'line',
              itemStyle: {
                normal: {
                  color: '#3888fa',
                  lineStyle: {
                    color: '#3888fa',
                    width: 2
                  },
                  areaStyle: {
                    color: '#f3f8ff'
                  }
                }
              },
              markPoint: {
                data: [
                  { type: 'max', name: '最大值' },
                  { type: 'min', name: '最小值' }
                ]
              },
              data: typeTask,
              animationDuration: 2800,
              animationEasing: 'quadraticOut'
            },
            {
              name: '已完成任务',
              type: 'bar',
              barWidth: '20%',
              smooth: true,
              stack: '任务数',
              itemStyle: {
                normal: {
                  color: '#5AB1EF'
                }
              },
              data: successTask,
              markLine: {
                data: [
                  { type: 'average', name: '平均值' }
                ]
              }
            }
          ]
        });
      },
      initChart() {
        this.chart = echarts.init(this.$el, 'macarons');
        this.setOptions(this.typeList, this.newTypeTask, this.newSuccessTask);
      }
    }
  };
</script>
