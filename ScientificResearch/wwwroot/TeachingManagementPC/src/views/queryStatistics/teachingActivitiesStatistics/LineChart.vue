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
        type: Array,
        required: true
      }
    },
    data() {
      return {
        chart: null,
        sidebarElm: null,
        typeList: [],
        valueArr: []
      };
    },
    watch: {
      chartData: {
        deep: true,
        handler(val) {
          this.setOptions(val);
        }
      }
    },
    mounted() {
      this.chartData.forEach((item) => {
        this.typeList.push(item.分类);
        this.valueArr.push(item.数量);
      });
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
      setOptions(typeList, valueArr) {
        this.chart.setOption({
          title: {
            text: '按主讲人部门统计教学活动',
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
            containLabel: true,
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
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'cross'
            },
            padding: [5, 10]
          },
          xAxis: {
            data: typeList,
            boundaryGap: false, //默认为true留空，false则顶头
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
          legend: {
            data: ['活动'],
            itemWidth: 30,
            top: '40'
          },
          series: [
            {
              name: '活动',
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
              markPoint : {
                data : [
                  {type : 'max', name: '最大值'},
                  {type : 'min', name: '最小值'}
                ]
              },
              data: valueArr,
              markLine: {
                data: [
                  { type: 'average', name: '平均值' }
                ]
              },
              animationDuration: 2800,
              animationEasing: 'quadraticOut'
            }
          ]
        });
      },
      initChart() {
        this.chart = echarts.init(this.$el, 'macarons');
        this.setOptions(this.typeList, this.valueArr);
      }
    }
  };
</script>
