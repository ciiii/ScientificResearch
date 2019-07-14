<template>
  <div :style="{height:'300px',width:'100%'}"/>
</template>

<script>
  import echarts from 'echarts';

  require('echarts/theme/macarons'); // echarts theme
  import { debounce } from '@/utils';

  const animationDuration = 3000;

  export default {
    props: ['chartData'],
    data() {
      return {
        chart: null,
        typeList: [],
        valueArr: []
      };
    },
    mounted() {
      this.chartData.forEach((item) => {
        this.typeList.push(item.分类);
        let data = {
          value: item.数量, name: item.分类
        };
        this.valueArr.push(data);
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
            text: '按学历统计',
            x: 'center',
            textStyle: {
              color: '#333',
              fontWeight: 'bold'
            }
          },
          tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c}人 ({d}%)'
          },
          legend: {
            orient: 'vertical',
            x: 'left',
            data: typeList
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
          series: [
            {
              name: '学历',
              type: 'pie',
              radius: ['50%', '70%'],
              itemStyle: {
                normal: {
                  label: {
                    show: false
                  },
                  labelLine: {
                    show: false
                  }
                },
                emphasis: {
                  label: {
                    show: true,
                    position: 'inner',
                    textStyle: {
                      fontSize: '18',
                      fontWeight: 'bold'
                    }
                  }
                }
              },
              data: valueArr
            },
            animationDuration
          ]
        });
      },
      initChart(typeList, valueArr) {
        this.chart = echarts.init(this.$el, 'macarons');
        this.setOptions(typeList, valueArr);
      }
    }
  };
</script>
