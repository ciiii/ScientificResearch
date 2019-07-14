<template>
  <div class="dashboard-editor-container page-statistics" v-if="isLoad">
    <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
      <el-tab-pane label="轮转统计" name="first">
        <div v-if="isShow">
          <div class="filter-container">
            <div class="filter-item">
              <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
            </div>
            <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
            </el-button>
          </div>
          <panel-group :stateStatistics="newData.按状态统计轮转"/>
          <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:30px;">
            <line-chart :chartData="newData"/>
          </el-row>
          <el-row :gutter="24">
            <el-col :xs="24" :sm="24" :lg="8">
              <div class="chart-wrapper">
                <pie-chart :chartData="newData.按本院科室统计未入科轮转" title="按科室统计未入科轮转" state="未入科"/>
              </div>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="8">
              <div class="chart-wrapper">
                <pie-chart :chartData="newData.按本院科室统计在科轮转" title="按科室统计在科轮转" state="在科"/>
              </div>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="8">
              <div class="chart-wrapper">
                <pie-chart :chartData="newData.按本院科室统计已出科轮转" title="按科室统计已出科轮转" state="已出科"/>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-tab-pane>
      <el-tab-pane label="已出科轮转任务统计" name="second">
        <div v-if="isShowTask">
          <div class="filter-container">
            <div class="filter-item">
              <datePicker :date="timeTask" :placeholder="placeholder" type="daterange"
                          @myEvent="changeTimeTask"></datePicker>
            </div>
            <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearchTask">查询
            </el-button>
          </div>
          <panel-group-task :taskData="taskData" :totalSuccess="totalSuccess"/>
          <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:30px;">
            <line-chart-task :chartData="taskData" :typeTask="typeTask" :successTask="successTask"
                             :typeList="typeList"/>
          </el-row>
          <el-row :gutter="24">
            <el-col :xs="24" :sm="24" :lg="12">
              <div class="chart-wrapper">
                <pie-chart-task :chartData="typeTask" title="按规定任务类型统计" :typeList="typeList" state="规定任务"/>
              </div>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="12">
              <div class="chart-wrapper">
                <pie-chart-task :chartData="successTask" title="按已完成任务类型统计" :typeList="typeList" state="已完成任务"/>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="24">
            <el-col :xs="24" :sm="24" :lg="24">
              <div class="chart-wrapper items-box">
                <h4 class="title">按任务类型统计已完成率（总数：{{totalSuccess}}个）</h4>
                <div class="item" v-for="el in typeTaskRate" :key="el.color">
                  <el-progress type="circle" :percentage="el.value?el.value:0" :color="el.color"
                               :width="200" :stroke-width="10">
                  </el-progress>
                  <div class="color-box">
                    <div class="item-color">
                      <p>{{el.number}}个</p>
                      <span class="color-span" :style="'background:'+el.color"></span><span
                      class="name">{{el.name}}</span></div>
                  </div>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
  import { URL_STATISTICS } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';
  import PanelGroup from './PanelGroup';
  import PanelGroupTask from './PanelGroupTask';
  import LineChart from './LineChart';
  import LineChartTask from './LineChartTask';
  import PieChart from './PieChart';
  import PieChartTask from './PieChartTask';

  export default {
    name: '',
    components: {
      PanelGroup,
      PanelGroupTask,
      LineChart,
      LineChartTask,
      PieChart,
      PieChartTask,
      datePicker
    },
    data() {
      return {
        newData: {},
        taskData: {},
        req: {
          Like学员类型名称: '',
          Like姓名: '',
          Begin计划入科日期: '',
          End计划入科日期: '',
          专业编号: ''
        },
        reqTask: {
          Like学员类型名称: '',
          Like姓名: '',
          Begin计划出科日期: '',
          End计划出科日期: '',
          专业编号: ''
        },
        time: [],
        timeTask: [],
        isLoad: false,
        isShow: true,
        isShowTask: false,
        typeTask: [],
        successTask: [],
        typeTaskRate: [],
        typeList: [],
        activeName: 'first',
        placeholder: {
          start: '计划入科日期',
          end: '计划出科日期'
        },
        totalSuccess:0
      };
    },
    mounted() {
      this.getData();
    },
    methods: {
      onSearch() {
        this.isShow = false;
        if (this.time && this.time.length != 0) {
          this.req.Begin计划入科日期 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.End计划入科日期 = formatDate(this.time[1], 'yyyy-MM-dd');
        } else {
          this.req.Begin计划入科日期 = '';
          this.req.End计划入科日期 = '';
        }
        this.newData ={};
        this.getData();
      },
      changeTime(time) {
        this.time = time;
      },
      getData: async function() {
        let data = await this.$http.myGet(URL_STATISTICS.GET_STUDENT_TRAIN_STATISTICS, this.req);
        if (data) {
          this.newData = data;
          this.isLoad = true;
          this.isShow = true;
        }
      },
      onSearchTask() {
        this.isShowTask = false;
        if (this.timeTask && this.timeTask.length != 0) {
          this.reqTask.Begin计划出科日期 = formatDate(this.timeTask[0], 'yyyy-MM-dd');
          this.reqTask.End计划出科日期 = formatDate(this.timeTask[1], 'yyyy-MM-dd');
        } else {
          this.reqTask.Begin计划出科日期 = '';
          this.reqTask.End计划出科日期 = '';
        }
        this.taskData = {};
        this.typeTaskRate = [];
        this.getTasks();
      },
      changeTimeTask(time) {
        this.timeTask = time;
      },
      getTasks: async function() {
        let data = await this.$http.myGet(URL_STATISTICS.GET_STUDENT_TRAIN_TASK_STATISTICS, this.reqTask);
        if (data) {
          this.taskData = data;
          this.typeList = ['技能', '疾病', '门诊', '病房', '医技'];
          this.typeTask = [
            { value: this.taskData.规定技能类任务数量, name: '技能' },
            { value: this.taskData.规定疾病类任务数量, name: '疾病' },
            { value: this.taskData.规定门诊类任务数量, name: '门诊' },
            { value: this.taskData.规定病房类任务数量, name: '病房' },
            { value: this.taskData.规定医技类任务数量, name: '医技' }
          ];
          this.successTask = [
            { value: this.taskData.已完成技能类任务数量, name: '技能' },
            { value: this.taskData.已完成疾病类任务数量, name: '疾病' },
            { value: this.taskData.已完成门诊类任务数量, name: '门诊' },
            { value: this.taskData.已完成病房类任务数量, name: '病房' },
            { value: this.taskData.已完成医技类任务数量, name: '医技' }
          ];
          this.typeTaskRate = [
            {
              value: Math.round(this.taskData.已完成技能类任务数量 / this.taskData.规定技能类任务数量 * 100),
              color: '#2EC7C9',
              name: '技能',
              number: this.taskData.已完成技能类任务数量
            },
            {
              value: Math.round(this.taskData.已完成疾病类任务数量 / this.taskData.规定疾病类任务数量 * 100),
              color: '#D87A80',
              name: '疾病',
              number: this.taskData.已完成疾病类任务数量
            },
            {
              value: Math.round(this.taskData.已完成门诊类任务数量 / this.taskData.规定门诊类任务数量 * 100),
              color: '#B6A2DE',
              name: '门诊',
              number: this.taskData.已完成门诊类任务数量
            },
            {
              value: Math.round(this.taskData.已完成病房类任务数量 / this.taskData.规定病房类任务数量 * 100),
              color: '#5AB1EF',
              name: '病房',
              number: this.taskData.已完成病房类任务数量
            },
            {
              value: Math.round(this.taskData.已完成医技类任务数量 / this.taskData.规定医技类任务数量 * 100),
              color: '#FFB980',
              name: '医技',
              number: this.taskData.已完成医技类任务数量
            }
          ];
          this.totalSuccess = this.taskData.已完成技能类任务数量 + this.taskData.已完成疾病类任务数量 + this.taskData.已完成门诊类任务数量 + this.taskData.已完成病房类任务数量 + this.taskData.已完成医技类任务数量;
          this.isShowTask = true;
        }
      },
      handleClick(tab, event) {
        let index = tab.index;
        console.info(index);
        if (index == 0) {
          this.onSearch();
        } else {
          this.onSearchTask();
        }
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
      margin: 10px 3.5%;
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
