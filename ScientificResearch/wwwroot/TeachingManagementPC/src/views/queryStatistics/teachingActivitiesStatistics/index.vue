<template>
  <div class="dashboard-editor-container page-statistics" v-if="isLoad">
    <div class="filter-container">
      <div class="filter-item">
        <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <el-row :gutter="24" v-if="isShow">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper items-box">
          <h4 class="title">按活动类型统计占比率（活动总数：{{newData.总数}}个）</h4>
          <div class="item" v-for="(el,$index) in typeTaskRate" :key="el.name">
            <el-progress type="circle" :percentage="el.value?el.value:0" :color="colorArr[$index]"
                         :width="150" :stroke-width="10" show-text>
            </el-progress>
            <div class="color-box">
              <div class="item-color">
                <p>{{el.number}}个</p>
                <span class="color-span" :style="'background:'+colorArr[$index]"></span><span
                class="name">{{el.name}}</span>
              </div>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>
    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:30px;" v-if="isShow">
      <line-chart :chartData="newData.按主讲人部门统计教学活动"/>
    </el-row>
    <el-row :gutter="24" v-if="isShow">
      <el-col :xs="24" :sm="24" :lg="12">
        <div class="chart-wrapper">
          <ring-chart :chartData="newData.按得分星数统计教学活动"/>
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="12">
        <div class="chart-wrapper">
          <pie-chart :chartData="newData.按活动类型统计教学活动"/>
        </div>
      </el-col>
    </el-row>
    <el-row :gurrer="24" v-if="isShow">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper">
          <bar-chart :chartData="newData.按活动类型统计教学活动"/>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { URL_STATISTICS } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';
  import LineChart from './LineChart';
  import RingChart from './RingChart';
  import PieChart from './PieChart';
  import BarChart from './BarChart';

  export default {
    name: '',
    components: {
      LineChart,
      RingChart,
      PieChart,
      BarChart,
      datePicker
    },
    data() {
      return {
        newData: {},
        req: {
          Like主讲人姓名: '',
          Like活动主题: '',
          Begin活动开始时间: '',
          End活动开始时间: '',
          教学活动类型编号: ''
        },
        time: [],
        colorArr: ['#2EC7C9', '#D87A80', '#B6A2DE', '#5AB1EF', '#FFB980', '#8D98B3', '#E5CF0D'],
        isLoad: false,
        isShow: true,
        typeTaskRate: [],
        placeholder: {
          start: '活动开始时间',
          end: '活动结束时间'
        }
      };
    },
    mounted() {
      this.getData();
    },
    methods: {
      onSearch() {
        this.isShow = false;
        if (this.time && this.time.length != 0) {
          this.req.Begin活动开始时间 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.End活动开始时间 = formatDate(this.time[1], 'yyyy-MM-dd');
        } else {
          this.req.Begin活动开始时间 = '';
          this.req.End活动开始时间 = '';
        }
        this.newData = {};
        this.typeTaskRate = [];
        this.getData();
      },
      changeTime(time) {
        this.time = time;
      },
      getData: async function() {
        let data = await this.$http.myGet(URL_STATISTICS.GET_ACTIVITY_STATISTICS, this.req);
        if (data) {
          this.newData = data;
          this.newData.按活动类型统计教学活动.forEach((el) => {
            let item = {
              value: Math.round(el.数量 / this.newData.总数 * 100),
              name: el.分类,
              number: el.数量
            };
            this.typeTaskRate.push(item);
          });
          this.isLoad = true;
          this.isShow = true;
        }
      }
    }
  };
</script>
<style lang="scss" scoped type="text/scss">
  .dashboard-editor-container {
    padding: 25px;
    background-color: rgb(240, 242, 245);
    position: relative;

    .github-corner {
      position: absolute;
      top: 0px;
      border: 0;
      right: 0;
    }

    .chart-wrapper {
      background: #fff;
      padding: 16px 16px 0;
      margin-bottom: 25px;
    }
  }

  .filter-container {
    padding: 0;
    text-align: right;
  }

  .items-box {
    text-align: center;

    .title {
      font-size: 18px;
      font-weight: bold;
      font-family: "Microsoft YaHei", "微软雅黑";
      margin-top: 10px;
    }

    .item {
      margin: 10px 2%;
      display: inline-block;

      .name {
        font-size: 14px;
        color: #333;
      }
    }
  }

  .color-box {
    background: #fff;
    text-align: center;
    padding: 20px 0 30px;

    .item-color {
      overflow: hidden;
      display: inline-block;

      .color-span {
        width: 30px;
        height: 15px;
        float: left;
        margin-top: 2px;
        margin-right: 5px;
        border-radius: 4px;
      }

      .name {
        float: left;
        padding-top: 3px;
        font-size: 13px;
        color: #000;
      }

      p {
        margin-top: 0;
        font-size: 16px;
        font-weight: bold;
      }
    }
  }
</style>
