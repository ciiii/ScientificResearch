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
      }
    },
    data() {
      return {
        chart: null,
        sidebarElm: null,
        typeList: [],
        valueArr: [],
        noEntryArr: [],
        entryArr: [],
        outArr: []
      };
    },
    mounted() {
      this.chartData.按本院科室统计轮转.forEach((item) => {
        this.typeList.push(item.分类);
        this.valueArr.push(item.数量);
      });
      this.typeList.forEach((item) => {
        let noEntryArr = this.chartData.按本院科室统计未入科轮转.find((itemB) => {
          if (itemB.分类 == item) {
            return itemB;
          } else {
            return null;
          }
        });
        let entryArr = this.chartData.按本院科室统计在科轮转.find((itemB) => {
          if (itemB.分类 == item) {
            return itemB;
          } else {
            return null;
          }
        });
        let outArr = this.chartData.按本院科室统计已出科轮转.find((itemB) => {
          if (itemB.分类 == item) {
            return itemB;
          } else {
            return null;
          }
        });
        if (noEntryArr) {
          this.noEntryArr.push(noEntryArr.数量);
        } else {
          this.noEntryArr.push(0);
        }
        if (entryArr) {
          this.entryArr.push(entryArr.数量);
        } else {
          this.entryArr.push(0);
        }
        if (outArr) {
          this.outArr.push(outArr.数量);
        } else {
          this.outArr.push(0);
        }
      });
      setTimeout(() => {
        this.initChart();
      }, 300);

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
      setOptions(typeList, valueArr, noEntryArr, entryArr, outArr) {
        this.chart.setOption({
          title: {
            text: '按本院科室统计轮转',
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
            data: ['总数', '未入科', '在科', '已出科'],
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
              name: '总数',
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
              animationDuration: 2800,
              animationEasing: 'quadraticOut'
            },
            {
              name: '未入科',
              type: 'bar',
              barWidth: '20%',
              smooth: true,
              stack: '总轮转数',
              itemStyle: {
                normal: {
                  color: '#5AB1EF'
                }
              },
              data: noEntryArr
            },
            {
              name: '在科',
              type: 'bar',
              barWidth: '20%',
              smooth: true,
              stack: '总轮转数',
              itemStyle: {
                normal: {
                  color: '#2EC7C9'
                }
              },
              data: entryArr,
              markLine: {
                data: [
                  { type: 'average', name: '平均值' }
                ]
              }
            },
            {
              name: '已出科',
              type: 'bar',
              barWidth: '20%',
              smooth: true,
              stack: '总轮转数',
              itemStyle: {
                normal: {
                  color: '#FFB980'
                }
              },
              data: outArr
            }
          ]
        });
      },
      initChart() {
        this.chart = echarts.init(this.$el, 'macarons');
        this.setOptions(this.typeList, this.valueArr, this.noEntryArr, this.entryArr, this.outArr);
      }
    }
  };
</script>
