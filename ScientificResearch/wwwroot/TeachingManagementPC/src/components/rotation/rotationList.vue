<template>
  <div class="page-rotaion">
    <div class="filter-container">
      <el-input v-model="req.Like姓名" placeholder="请输入学员姓名" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        学员类型
        <el-select v-model="req.Like学员类型名称" placeholder="请选择" @change="onSearch" style="width: 100px;">
          <el-option label="全部" :value="''"></el-option>
          <el-option :label="item.名称" :value="item.名称" v-for="item in types" :key="item.编号"></el-option>
        </el-select>
      </div>
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
      <div class="filter-item">
        学员状态
        <el-select v-model="req.状态" placeholder="请选择" @change="onSearch" style="width: 150px;">
          <el-option label="全部" :value="''"></el-option>
          <el-option :label="item" :value="item" v-for="item in states" :key="item"></el-option>
        </el-select>
      </div>
      <div class="filter-item">
        <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
    </div>
    <div class="content" v-if="isLoad&&list&&list.length>0">
      <el-table class="tableone" ref="multipleTable"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" stripe
                :span-method="arraySpanMethod" @selection-change="handleSelectionChange" :row-key="getRowKeys">
        <el-table-column type="selection" align="center" width="55" :reserve-selection="true"
                         prop="学员信息.编号"></el-table-column>
        <el-table-column align="center" fixed label="序号" prop="number" width="80"></el-table-column>
        <el-table-column label="姓名" fixed width="150">
          <template slot-scope="scope">
            <div class="name-box" slot="reference">
              <el-badge :value="scope.row.轮转信息.length" class="item">
               <span class="logo-img">
                <img v-if="scope.row.学员信息.头像路径" :src="http+scope.row.学员信息.头像路径" alt="">
                <img v-else src="@/assets/images/user.jpg" alt="">
               </span>
                <span class="title">{{scope.row.学员信息.姓名}}</span>
              </el-badge>
            </div>
            <el-tag size="small" :type="getStates(scope.row.学员信息.状态)"
                    disable-transitions>{{scope.row.学员信息.状态}}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column v-for="item in dateArr" :label="item" :key="item" :width="widthValue">
          <template slot-scope="scope">
            <span v-for="item in scope.row.轮转信息" :key="item.编号" class="item-box" :width="item.itemWidth"
                  :style="'left:'+ item.leftWidth+'px'" @click="clickEvent(scope.row,item)">
              <span v-if="item.itemWidth>50" class="begin-time time">{{item.计划入科日期|dataFormat('MM-dd')}}</span>
              <span v-if="item.itemWidth>100" class="end-time time">{{item.计划出科日期|dataFormat('MM-dd')}}</span>
              <el-popover
                placement="top-start"
                :title="scope.row.学员信息.姓名+'【'+scope.row.学员信息.学员类型名称+'】'"
                width="250"
                trigger="hover">
                <p class="keshi"> 轮转科室：<span>{{item.本院科室名称}}</span></p>
                <p class="begin-time">计划入科日期：<span><i class="el-icon-time"></i>
                  {{item.计划入科日期|dataFormat('yyyy-MM-dd')}}</span>
                </p>
                <p class="end-time">计划出科日期：<span><i class="el-icon-time"></i>
                  {{item.计划出科日期|dataFormat('yyyy-MM-dd')}}</span>
                </p>
                <p class="number">技能病例数：<span>{{item.技能病例数}}</span> 例</p>
                <p class="number">最低管床数：<span>{{item.最低管床数量}}</span> 例</p>
                <p class="number">最低全程管理数量：<span>{{item.最低管床数量}}</span> 例</p>
                <p class="number">疾病病例数：<span>{{item.疾病病例数}}</span> 例</p>
                <p class="number">门诊病例数：<span>{{item.门诊病例数}}</span> 例</p>
                <p class="number">最大学员人数：<span>{{item.最大学员人数}}</span> 人</p>
                <p>带教老师：<span>{{item.带教老师姓名}}</span></p>
                <p class="state">状态：
                  <el-tag :type="getStatesB(item.状态)" size="small" disable-transitions>{{item.状态}}</el-tag>
                </p>
                <el-button type="primary" plain class="item-content" slot="reference"
                           :style="'width:'+item.itemWidth+'px'">{{item.本院科室名称}}</el-button>
              </el-popover>
            </span>
          </template>
        </el-table-column>
      </el-table>
      <div class="block paging">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page.sync="req.Index"
          :page-size="req.Size" background
          layout="total, prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
    </div>
    <div class="not-content" v-if="isLoad&&list.length==0"><img src="@/assets/images/nothing.png"></div>
  </div>
</template>

<script>
  import {
    URL_SETTING,
    HTTP_URL_HOST,
    URL_TEACHING_MANAGEMENT,
    URL_BASE_INFO,
    STUDENT_STATE
  } from '@/assets/js/connect/ConSysUrl';
  import { formatDate, deepCopy } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';

  export default {
    components: { datePicker },
    props: ['state'],
    data() {
      return {
        req: {
          Index: 1,
          Size: 13,
          OrderType: true,
          Like学员类型名称: '',
          状态: '',
          Like工号: '',
          Like姓名: '',
          专业编号: '',
          Begin计划开始培训日期: '',
          End计划开始培训日期: ''
        },
        list: [],
        listLoading: true,
        isDialog: false,
        isDetails: false,
        isAdd: false,
        item: {},
        isLoad: false,
        total: 0,
        types: [],
        majors: [],
        http: HTTP_URL_HOST,
        time: [],
        multipleSelection: [],
        placeholder: {
          start: '计划开始培训日期',
          end: '计划开始培训日期'
        },
        states: STUDENT_STATE,
        minTime: '',
        maxTime: '',
        dateArr: [],
        widthValue: 290,
        getRowKeys(row) {
          return row.学员信息.编号;
        }
      };
    },
    created() {
      this.listLoading = true;
      this.req.状态 = this.state;
      this.getList();
      this.getMajors();
      this.getStudentType();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_PAGING_MY_STUDENT_ROTATION, this.req);
        if (data && data.list.length > 0) {
          this.total = data.total;
          this.minTime = data.最小日期;
          this.maxTime = data.最大日期;
          data = data.list;
          let number = (this.req.Index - 1) * this.req.Size + 1;
          data.forEach((itemA) => {
            itemA.number = number;
            number++;
            itemA.轮转信息.forEach((itemB) => {
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
        let startTimestamp = new Date(itemB.计划入科日期);
        let endTimestamp = new Date(itemB.计划出科日期);
        let minTimestamp = new Date(this.minTime);
        let day = Math.floor((endTimestamp - startTimestamp) / 86400000);
        let left = Math.floor((startTimestamp - minTimestamp) / 86400000);
        let width = this.widthValue / 30;
        let obj = {
          itemWidth: day * width,
          leftWidth: left * width
        };
        return obj;
      },
      getTime() {
        let mydateMin = new Date(this.minTime);
        let mydateMax = new Date(this.maxTime);
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
      getMajors: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TRAINING_MAJOR_LIST, '');
        if (data && data.length > 0) {
          this.majors = data;
        }
      },
      getStudentType: async function() {
        let data = await this.$http.myGet(URL_BASE_INFO.GET_STUDENT_TYPE, '');
        if (data && data.length > 0) {
          this.types = data;
        } else {
          this.types = [];
        }
      },
      getStates(state) {
        switch (state) {
          case '未报到':
            return 'warning';
          case '退培':
            return 'danger';
          case '已报到':
            return 'success';
          case '轮转计划已安排':
            return '';
          case '在培':
            return '';
          case '待结业':
            return 'warning';
          case '结业':
            return 'success';
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
      arraySpanMethod({ row, column, rowIndex, columnIndex }) {
        let index = 3;
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
      },
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        if (this.time && this.time.length != 0) {
          this.req.Begin计划开始培训日期 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.End计划开始培训日期 = formatDate(this.time[1], 'yyyy-MM-dd');
        } else {
          this.req.Begin计划开始培训日期 = '';
          this.req.End计划开始培训日期 = '';
        }
        this.list = [];
        this.getList();
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getList();
      },
      handleSelectionChange(rows) {
        this.multipleSelection = [];
        if (rows) {
          rows.forEach(row => {
            if (row) {
              this.multipleSelection.push(row);
            }
          });
        }
        this.$emit('myEventSelect', this.multipleSelection, this.req.状态);
      },
      clickEvent(item, one) {
        this.$emit('myEvent', item, this.req.状态, one);
      }
    }
  };
</script>
<style type="text/scss" lang="scss">
  .page-rotaion {
    .el-badge__content.is-fixed {
      top: 8px;
      right: auto;
      left: -40px;
    }
  }

  .el-popover {
    .keshi {
      span {
        color: #409EFF;
      }
    }

    .begin-time {
      span {
        color: #67c23a;
      }

    }

    .end-time {
      span {
        color: #f56c6c;
      }

    }

    .number {
      span {
        color: #409EFF;
      }
    }
  }
</style>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/Variable.scss";

  table {

    p {
      margin-top: 0;
      margin-bottom: 0;
      font-size: 12px;
    }

    .td-name {
      width: 150px;
    }

    .td-number {
      width: 60px;
    }

    .name-box {
      overflow: hidden;
      margin-bottom: 5px;
      padding-left: 20px;
    }

    .el-tag {
      float: left;
      margin-left: 20px;
    }

    .logo-img {
      width: 30px !important;
      height: 30px !important;
      margin-right: 5px !important;
    }

    .title {
      padding-top: 10px;
    }

    .item-box {
      height: 65px;
      position: absolute;
      text-align: center;
      padding-top: 30px;
      top: 7px;
    }

    .item-content {
      display: block;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      font-size: 13px;
    }

    .time {
      position: absolute;
      height: 25px;
      display: inline-block;
      padding: 3px 5px;
      border-top-left-radius: 8px;
      border-top-right-radius: 8px;
      font-size: 12px;
      top: 5px;
      border: 1px solid #ddd;
      border-bottom: none;
      color: #666;
    }

    .begin-time {
      left: 0;
      background: #e6f5df;
    }

    .end-time {
      right: 0;
      background: #ffe8e8;
    }

    .item-box:last-child {
      margin-right: 0;
    }


  }
</style>


