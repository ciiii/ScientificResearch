<template>
  <div class="app-container page-common page-addStudent page-departmentReportStatistics">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <h4 class="page-title" align="center">按科室统计轮转</h4>
    <div class="filter-container">
      <div class="filter-item">
        培训专业
        <el-select v-model="req.专业编号" placeholder="请选择" @change="onSearch" style="width: 150px;">
          <el-option label="全部" :value="''"></el-option>
          <el-option v-for="item in majors" :key="item.编号" :label="item.名称+' - '+item.年份"
                     :value="item.编号">
            <span style="float: left">{{ item.名称 }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px">{{ item.年份 }}</span>
          </el-option>
        </el-select>
      </div>
      <div class="filter-item" v-if="isLoad">
        <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
    </div>
    <div class="content" v-if="isLoad">
      <el-table class="tableone" ref="multipleTable"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" stripe
                :span-method="arraySpanMethod">
        <el-table-column align="center" fixed label="序号" width="80">
          <template slot-scope="scope">{{scope.$index+1}}</template>
        </el-table-column>
        <el-table-column label="教学科室" fixed width="150" align="center">
          <template slot-scope="scope">
            <p>{{scope.row.教学科室.名称}}</p>
            <el-tooltip class="item" effect="dark" content="科室管理员" placement="right">
              <el-button type="primary" plain size="mini">{{scope.row.教学科室.科室管理员姓名}}</el-button>
            </el-tooltip>
          </template>
        </el-table-column>
        <el-table-column v-for="item in dateArr" :label="item" :key="item" :width="widthValue">
          <template slot-scope="scope">
            <div v-for="item in scope.row.统计轮转的结果.未入科" :key="'未入科'+item.日期" class="item-box item-one" width="10"
                 :style="'left:'+ item.leftWidth+'px'">
              <el-tooltip :content="item.日期+',未入科：'+item.人数+'人'" placement="bottom" effect="light">
                <a class="item-content" href="javascript:;"></a>
              </el-tooltip>
            </div>
            <div v-for="item in scope.row.统计轮转的结果.在科" :key="'在科'+item.日期" class="item-box item-two" width="10"
                 :style="'left:'+ item.leftWidth+'px'">
              <el-tooltip :content="item.日期+',在科：'+item.人数+'人'" placement="bottom" effect="light">
                <a class="item-content" href="javascript:;"></a>
              </el-tooltip>
            </div>
            <div v-for="item in scope.row.统计轮转的结果.已出科" :key="'已出科'+item.日期" class="item-box item-three" width="10"
                 :style="'left:'+ item.leftWidth+'px'">
              <el-tooltip :content="item.日期+',已出科：'+item.人数+'人'" placement="bottom" effect="light">
                <a class="item-content" href="javascript:;"></a>
              </el-tooltip>
            </div>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div slot="footer" class="dialog-footer">
      <el-button @click="$router.go(-1)">返回</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_OFFICE, URL_SETTING, URL_TEACHING_MANAGEMENT, HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
  import {
    deepCopy,
    countDays,
    formatDate,
    addDay,
    reduceDay
  } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';

  export default {
    name: 'departmentReportStatistics',
    components: { datePicker },
    data() {
      return {
        req: {
          beginDate: '',
          endDate: ''
        },
        isLoad: false,
        isDialog: false,
        newItme: {},
        dateArr: [],
        majors: [],
        placeholder: {
          start: '开始培训日期',
          end: '结束培训日期'
        },
        minTime: '',
        maxTime: '',
        time: [],
        widthValue: 290
      };
    },
    mounted() {
      let beginDate = new Date().getFullYear() + '-01-01';
      let endDate = formatDate(new Date(), 'yyyy-MM-dd');
      this.req.beginDate = beginDate;
      this.req.endDate = endDate;
      this.time = [beginDate, endDate];
      this.getList();
      this.getMajors();
    },
    methods: {
      getStatesA(state) {
        switch (state) {
          case '未报到':
            return 'state-warning';
          case '退培':
            return 'state-error';
          case '已报到':
            return 'state-success';
          case '轮转计划已安排':
            return 'state-primary';
          case '在培':
            return 'state-success';
          case '待结业':
            return 'state-warning';
          case '结业':
            return 'state-success';
        }
      },
      getStatesB(state) {
        switch (state) {
          case '未入科':
            return 'warning';
          case '在科':
            return 'success';
          case '已出科':
            return 'primary';
        }
      },
      getMajors: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TRAINING_MAJOR_LIST, '');
        if (data && data.length > 0) {
          this.majors = data;
        }
      },
      getList: async function() {
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_DEPARTMENT_STATISTICS_ROTATION, this.req);
        if (data && data.length > 0) {
          console.info(data);
          data.forEach((itemA) => {
            itemA.统计轮转的结果.未入科.forEach((itemB) => {
              let obj = this.getDay(itemB);
              itemB.itemWidth = obj.itemWidth;
              itemB.leftWidth = obj.leftWidth;
            });
            itemA.统计轮转的结果.在科.forEach((itemB) => {
              let obj = this.getDay(itemB);
              itemB.itemWidth = obj.itemWidth;
              itemB.leftWidth = obj.leftWidth;
            });
            itemA.统计轮转的结果.已出科.forEach((itemB) => {
              let obj = this.getDay(itemB);
              itemB.itemWidth = obj.itemWidth;
              itemB.leftWidth = obj.leftWidth;
            });
          });
          this.list = data;
          this.dateArr = [];
          this.getTime();
        } else {
          this.list = [];
          this.total = 0;
        }
        this.listLoading = false;
        this.isLoad = true;
      },
      getDay(itemB) {
        let startTimestamp = new Date(itemB.日期);
        let minTimestamp = new Date(this.req.beginDate);
        let day = itemB.人数;
        let left = Math.floor((startTimestamp - minTimestamp) / 86400000);
        let width = this.widthValue / 30;
        let obj = {
          itemWidth: day * width,
          leftWidth: left * width
        };
        return obj;
      },
      getTime() {
        let mydateMin = new Date(this.req.beginDate);
        let mydateMax = new Date(this.req.endDate);
        let minTimestamp = mydateMin.getTime();
        let maxTimestamp = mydateMax.getTime();
        let minYear = mydateMin.getFullYear();
        let minMonth = mydateMin.getMonth() + 1;
        this.getMonths(minTimestamp, maxTimestamp, minYear, minMonth);
      },
      getMonths(minTimestamp, maxTimestamp, minYear, minMonth) {
        if (minTimestamp <= maxTimestamp) {
          let year = minYear;
          let month = minMonth;
          if (month > 12) {
            month = 1;
            year++;
          }
          let newMonth;
          if (month < 10) {
            newMonth = '0' + month;
          } else {
            newMonth = month;
          }
          let date = year + '年' + newMonth;
          let newTimestamp = Date.parse(new Date(year + '-' + newMonth + '-01 00:00:00'));
          this.dateArr.push(date);
          month++;
          this.getMonths(newTimestamp, maxTimestamp, year, month);
        }
      },
      arraySpanMethod({ row, column, rowIndex, columnIndex }) {
        let index = 2;
        if (columnIndex == index) { //用于设置要合并的列
          return {
            colspan: this.dateArr.length, //合并的列数，设为０则直接不显示
            rowspan: 1
          };
        } else if (columnIndex > index) {
          return {
            colspan: 0, //合并的列数，设为０则直接不显示
            rowspan: 0
          };
        }
      },
      changeTime(time) {
        this.time = time;
        this.req.beginDate = formatDate(this.time[0], 'yyyy-MM-dd');
        this.req.endDate = formatDate(this.time[1], 'yyyy-MM-dd');
      },
      onSearch() {
        this.listLoading = true;
        let day = countDays(this.req.beginDate, this.req.endDate);
        if (day > 365) {
          return this.$message.error('查询轮转的【起止日期】间隔不能大于一年！');
        }
        this.list = [];
        this.getList();
      },
      isError(state) {
        this.$message({
          showClose: true,
          message: '【' + state + '】状态不能进行操作！',
          type: 'error'
        });
      },
      myEvent(item) {
        this.newItme.轮转信息.push(item);
        this.isDialog = false;
      }
    }
  };
</script>
<style type="text/scss" lang="scss">
  .page-departmentReportStatistics {
    .el-table {
      td {
        height: 80px;
      }
    }
  }

</style>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/Variable.scss";
  @import "@/assets/scss/AddStudent.scss";

  table {
    p {
      margin-top: 0;
      margin-bottom: 0;
      font-size: 12px;
    }

    .item-box {
      min-height: 10px;
      position: absolute;
      text-align: center;
      padding-top: 30px;
      bottom: 5px;
      color: #fff;
      font-size: 12px;
      margin-right: 1px;
      box-sizing: border-box;
    }

    .item-one {
      .item-content {
        background: #e6a23c;
        opacity: 0.5;
      }
    }

    .item-two {
      .item-content {
        background: #67c23a;
        opacity: 0.5;
      }

      bottom: 25px;
    }

    .item-three {
      .item-content {
        background: #409eff;
        opacity: 0.5;
      }

      bottom: 55px;
    }

    .item-content {
      display: block;
      width: 10px;
      height: 20px;
      border-right: 1px solid #fff;

    }
  }
</style>

