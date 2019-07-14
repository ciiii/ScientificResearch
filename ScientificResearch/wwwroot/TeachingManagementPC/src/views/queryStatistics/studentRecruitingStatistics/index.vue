<template>
  <div class="dashboard-editor-container" v-if="isLoad">
    <div class="filter-container">
      <div class="filter-item">
        <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <panel-group :chartData="newData.按状态统计"/>
    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:30px;" v-if="isShow">
      <line-chart :chartData="newData.按培训年界统计所有学员" :graduation="newData.按培训年界统计结业学员"/>
    </el-row>
    <el-row :gutter="24" v-if="isShow">
      <el-col :xs="24" :sm="24" :lg="12">
        <div class="chart-wrapper">
          <ring-chart :chartData="newData.按学历统计"/>
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="12">
        <div class="chart-wrapper">
          <pie-chart :chartData="newData.按送培方式统计"/>
        </div>
      </el-col>
    </el-row>
    <el-row :gurrer="24" v-if="isShow">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper">
          <bar-chart :chartData="newData.按专业名称统计"/>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { URL_STATISTICS } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';
  import PanelGroup from './PanelGroup';
  import LineChart from './LineChart';
  import RingChart from './RingChart';
  import PieChart from './PieChart';
  import BarChart from './BarChart';

  export default {
    name: '',
    components: {
      PanelGroup,
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
          Like学员类型名称: '',
          Like姓名: '',
          Begin计划开始培训日期: '',
          End计划开始培训日期: '',
          专业编号: ''
        },
        time: [],
        isLoad: false,
        isShow: true,
        placeholder: {
          start: '计划开始培训日期',
          end: '计划结束培训日期'
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
          this.req.Begin计划开始培训日期 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.End计划开始培训日期 = formatDate(this.time[1], 'yyyy-MM-dd');
        } else {
          this.req.Begin计划开始培训日期 = '';
          this.req.End计划开始培训日期 = '';
        }
        this.newData = {};
        this.getData();
      },
      changeTime(time) {
        this.time = time;
      },
      getData: async function() {
        let data = await this.$http.myGet(URL_STATISTICS.GET_STUDENT_RECRUITING_STATISTICS, this.req);
        if (data) {
          this.newData = data;
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
    padding: 5px 0;
  }
</style>
