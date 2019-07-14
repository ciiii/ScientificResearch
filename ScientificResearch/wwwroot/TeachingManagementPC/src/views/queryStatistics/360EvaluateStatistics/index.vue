<template>
  <div class="dashboard-editor-container page-statistics" v-if="isLoad">
    <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
      <el-tab-pane :label="el.目标类型名称" :name="el.目标类型编号.toString()" v-for="(el,$index) in types" :key="el.目标类型编号"></el-tab-pane>
    </el-tabs>
    <div v-if="isShow">
      <div class="filter-container">
        <div class="filter-item">
          <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
        </div>
        <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
        </el-button>
      </div>
      <el-row :gutter="24">
        <el-col :xs="24" :sm="24" :lg="12">
          <div class="chart-wrapper">
            <bar-chart :chartData="newData.按评价人类型统计360评价" title="按评价人类型统计360评价" state="评价"/>
          </div>
        </el-col>
        <el-col :xs="24" :sm="24" :lg="12">
          <div class="chart-wrapper">
            <pie-chart :chartData="newData.按得分星数统计360评价" title="按得分星数统计360评价" state="得分星数"/>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
  import { URL_SETTING, URL_STATISTICS } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';
  import BarChart from './BarChart';
  import PieChart from './PieChart';

  export default {
    name: '',
    components: { BarChart, PieChart, datePicker },
    data() {
      return {
        newData: {},
        req: {
          Like评价人姓名: '',
          Like被评价人姓名: '',
          Begin评价开始时间: '',
          End评价开始时间: '',
          目标类型: ''
        },
        time: [],
        types: [],
        isLoad: false,
        isShow: true,
        activeName: '0',
        newIndex: 0,
        placeholder: {
          start: '评价开始时间',
          end: '评价结束时间'
        }
      };
    },
    mounted() {
      this.getTypes();
      this.getData();
    },
    methods: {
      onSearch() {
        this.isShow = false;
        if (this.time && this.time.length != 0) {
          this.req.Begin评价开始时间 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.End评价开始时间 = formatDate(this.time[1], 'yyyy-MM-dd');
        } else {
          this.req.Begin评价开始时间 = '';
          this.req.End评价开始时间 = '';
        }
        this.newData = {};
        this.typeTaskRate = [];
        this.getData();
      },
      changeTime(time) {
        this.time = time;
      },
      getTypes: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_360_EVALUATE_TYPES, '');
        if (data) {
          this.types = data.reverse();
        }
      },
      getData: async function() {
        let data = await this.$http.myGet(URL_STATISTICS.GET_360EVALUATE_STATISTICS, this.req);
        if (data) {
          this.newData = data;
          this.isLoad = true;
          this.isShow = true;
        }
      },
      handleClick(tab, event) {
        this.newIndex = tab.index;
        console.info(tab);
        console.info(this.newIndex);
        this.req.目标类型 = tab.name;
        this.onSearch();
        /*if (this.index == 0) {
          this.onSearch();
        } else {
          this.onSearchTask();
        }*/
      }
    }
  };
</script>
<style lang="scss" type="text/scss">
  .page-statistics {
    .el-tabs__nav {
      background: #fff;
    }

    .el-tabs__header {
      margin: 0 0 5px;
    }

    .el-tabs__item.is-active {
      background: #409EFF;
      color: #fff;
    }
  }

  .el-progress-circle {
    color: #fff;
  }
</style>
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
