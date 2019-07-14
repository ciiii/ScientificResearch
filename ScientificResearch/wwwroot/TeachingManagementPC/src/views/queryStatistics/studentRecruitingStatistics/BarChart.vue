<template>
    <div :style="{height:'350px',width:'100%'}"/>
</template>

<script>
  import echarts from 'echarts';

  require('echarts/theme/macarons'); // echarts theme
  import { debounce } from '@/utils';

  const animationDuration = 6000;

  export default {
    props: ['chartData'],
    data() {
      return {
        chart: null,
        typeList: [],
        valueArr: [],
      };
    },
    mounted() {
      this.chartData.forEach((item) => {
        this.typeList.push(item.分类);
        this.valueArr.push(item.数量);
      });
      this.initChart(this.typeList, this.valueArr);
      this.__resizeHandler = debounce(() => {
        if (this.chart) {
          this.chart.resize();
        }
      }, 100);
      window.addEventListener('resize', this.__resizeHandler);
    },
    beforeDestroy() {
      if (!this.chart) {
        return;
      }
      window.removeEventListener('resize', this.__resizeHandler);
      this.chart.dispose();
      this.chart = null;
    },
    methods: {
      setOptions(typeList, valueArr) {
        this.chart.setOption({
          title: {
            text: '按专业名称统计',
            x: 'center',
            textStyle: {
              color: '#333',
              fontWeight: 'bold'
            }
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: { // 坐标轴指示器，坐标轴触发有效
              type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            }
          },
          grid: {
            top: 70,
            left: '2%',
            right: 30,
            bottom: '3%',
            containLabel: true
          },
          toolbox: {
            show: true,
            feature: {
              mark: { show: true },
              dataView: { show: true, readOnly: false },
              magicType: { show: true, type: ['line','bar'] },
              restore: { show: true },
              saveAsImage: { show: true }
            }
          },
          calculable: true,
          legend: {
            data: ['人数'],
            itemWidth: 30,
            top: '40'
          },
          xAxis: [{
            type: 'category',
            data: typeList,
            axisTick: {
              alignWithLabel: true
            }
          }],
          yAxis: [
            {
              type: 'value',
              name: '数量（人）',
              axisLabel: {
                formatter: '{value} '
              }
            }
          ],
          series: [{
            name: '人数',
            type: 'bar',
            stack: 'vistors',
            barWidth: 50,
            itemStyle: {
              normal: {
                color: '#5AB1EF'
              }
            },
            markLine: {
              data: [
                { type: 'average', name: '平均值' }
              ]
            },
            data: valueArr,
            animationDuration
          }]
        });
      },
      initChart(typeList, valueArr) {
        this.chart = echarts.init(this.$el, 'macarons');
        this.setOptions(typeList, valueArr);

      }
    }
  };
</script>
