<template>
  <div :style="{height:'350px',width:'100%'}"/>
</template>

<script>
  import echarts from 'echarts';

  require('echarts/theme/macarons'); // echarts theme
  import { debounce } from '@/utils';

  export default {
    props: ['chartData','title','state'],
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
            text: this.title,
            x: 'center',
            textStyle: {
              color: '#333',
              fontWeight: 'bold'
            }
          },
          tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c}个 ({d}%)'
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
              name: this.state,
              type: 'pie',
              radius : '55%',
              center: ['55%', '60%'],
              label:{
                show:true,
                formatter:'{b}: {d}%'
              },
              data: valueArr,
              animationEasing: 'cubicInOut',
              animationDuration: 2600
            }
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
