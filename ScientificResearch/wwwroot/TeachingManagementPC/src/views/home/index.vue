<template>
  <div class="dashboard-editor-container" v-if="isShow">
    <div class="filter-container">
      <div class="filter-item">
        <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <panel-group :chartData="newData.按状态统计"/>
    <el-row :gutter="20">
      <el-col :xs="{span: 24}" :sm="{span: 24}" :md="{span: 24}" :lg="{span: 18}" :xl="{span: 18}">
        <div class="chart-wrapper">
          <notice-list/>
        </div>
      </el-col>
      <el-col :xs="{span: 24}" :sm="{span: 12}" :md="{span: 12}" :lg="{span: 6}" :xl="{span: 6}">
        <box-card :chartData="rotateData.按状态统计轮转"/>
      </el-col>
    </el-row>
    <el-row style="margin-bottom:30px;">
      <div class="chart-wrapper">
        <todo-table/>
      </div>
    </el-row>
  </div>
</template>

<script>
  import { URL_STATISTICS } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';
  import PanelGroup from '@/views/queryStatistics/studentRecruitingStatistics/PanelGroup';
  import TodoTable from './components/TodoTable';
  import NoticeList from './components/NoticeList';
  import BoxCard from './components/BoxCard';
  import { getObjArr } from '@/assets/js/Common';

  export default {
    name: 'DashboardAdmin',
    components: {
      datePicker,
      PanelGroup,
      TodoTable,
      NoticeList,
      BoxCard
    },
    data() {
      return {
        newData: {},
        rotateData: {},
        req: {
          Like学员类型名称: '',
          Like姓名: '',
          Begin计划开始培训日期: '',
          End计划开始培训日期: '',
          专业编号: ''
        },
        reqRotate: {
          Begin计划入科日期: '',
          End计划入科日期: ''
        },
        time: [],
        isShow: false,
        placeholder: {
          start: '开始时间',
          end: '结束时间'
        }
      };
    },
    created(){
        this.getData();
        this.getRotateData();
    },
    mounted() {
      if (localStorage.getItem('userInfo')) {
        if (getObjArr('userInfo').人员.编号 != sessionStorage.mUserId) {
          sessionStorage.mUserId = getObjArr('userInfo').人员.编号;
          parent.location.reload();
        }
        // this.getData();
        // this.getRotateData();
      }
    },
    methods: {
      handleSetLineChartData(type) {
        this.lineChartData = lineChartData[type];
      },
      onSearch() {
        this.isShow = false;
        if (this.time && this.time.length != 0) {
          this.req.Begin计划开始培训日期 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.End计划开始培训日期 = formatDate(this.time[1], 'yyyy-MM-dd');
          this.req.Begin计划入科日期 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.End计划入科日期 = formatDate(this.time[1], 'yyyy-MM-dd');
        } else {
          this.req.Begin计划开始培训日期 = '';
          this.req.End计划开始培训日期 = '';
          this.req.Begin计划入科日期 = '';
          this.req.End计划入科日期 = '';
        }
        this.newData = {};
        this.getData();
        this.getRotateData();
      },
      changeTime(time) {
        this.time = time;
      },
      getData: async function() {
        let data = await this.$http.myGet(URL_STATISTICS.GET_STUDENT_RECRUITING_STATISTICS, this.req);
        if (data) {
          this.newData = data;
          this.isShow = true;
        }
      },
      getRotateData: async function() {
        let data = await this.$http.myGet(URL_STATISTICS.GET_STUDENT_TRAIN_STATISTICS, this.reqRotate);
        if (data) {
          this.rotateData = data;
        }
      }
    }
  };
</script>

<style lang="scss" scoped type="text/scss">
  @import "@/assets/scss/Variable.scss";

  .filter-container {
    padding: 2px 0;
  }

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

  .item-title {
    font-size: 18px;
    color: #4d4d4d;
    margin: 5px 0;
    padding-left: 5px;
    position: relative;

    i {
      font-size: 20px;
      margin-right: 5px;
    }

    .more {
      position: absolute;
      right: 20px;
      top: 10px;
      font-size: 14px;
      color: #888;

      i {
        color: #888;
        font-size: 14px;
      }

      &:hover {
        color: $colorActive;

        i {
          color: $colorActive;;
        }
      }
    }
  }
</style>
