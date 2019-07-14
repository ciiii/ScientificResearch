<template>
  <div class="app-container page-common page-signIn">
    <h4 class="page-title" align="center">考勤统计</h4>
    <div class="filter-container">
      <el-input v-model="req.Like姓名" placeholder="请输入学员姓名" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-input v-model="req.Like科室管理员姓名" placeholder="请输入科室管理员姓名" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        学员类型
        <el-select v-model="req.Like学员类型名称" placeholder="请选择" @change="onSearch" style="width: 150px;">
          <el-option label="全部" :value="''"></el-option>
          <el-option :label="item.名称" :value="item.名称" v-for="item in types" :key="item.编号"></el-option>
        </el-select>
      </div>
      <div class="filter-item">
        培训专业
        <el-select v-model="req.专业编号" placeholder="请选择" @change="onSearch">
          <el-option label="全部" :value="''"></el-option>
          <el-option v-for="item in majors" :key="item.编号" :label="item.名称+' - '+item.年份"
                     :value="item.编号">
            <span style="float: left">{{ item.名称 }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px">{{ item.年份 }}</span>
          </el-option>
        </el-select>
      </div>
      <div class="filter-item">
        状态
        <el-select v-model="req.状态" placeholder="请选择" @change="onSearch" style="width: 150px;">
          <el-option label="全部" :value="''"></el-option>
          <el-option :label="item" :value="item" v-for="item in states" :key="item"></el-option>
        </el-select>
      </div>
      <div class="filter-item">
        <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list" border
                element-loading-text="Loading" stripe>
        <el-table-column align="center" label="序号" prop="number" width="80"></el-table-column>
        <el-table-column label="姓名">
          <template slot-scope="scope">
            <el-popover
              placement="bottom-end"
              :title="scope.row.学员信息.姓名+' ('+scope.row.学员信息.工号+')'"
              width="250"
              trigger="hover">
              <p class="keshi">当前轮转科室：<span>{{scope.row.学员信息.当前教学轮转本院科室名称}}</span></p>
              <p class="state">学员类型：
                <el-tag size="small" type="danger" disable-transitions>{{scope.row.学员信息.学员类型名称}}</el-tag>
              </p>
              <p>培训专业：<span>{{scope.row.学员信息.专业名称}}</span></p>
              <p>送培方式：<span>{{scope.row.学员信息.送培方式}}</span></p>
              <p>往届应届：<span>{{scope.row.学员信息.往届应届}}</span></p>
              <p>培训年届(年限)：<span>（{{scope.row.学员信息.学员培训年界}}级，学制:{{scope.row.学员信息.学员培训年限}} 年）</span></p>
              <p>当前科室管理员：<span>{{scope.row.学员信息.当前科室管理员姓名}}</span></p>
              <p class="state">状态：
                <el-tag :type="getStates(scope.row.学员信息.状态)" size="small" disable-transitions>{{scope.row.学员信息.状态}}
                </el-tag>
              </p>
              <p class="begin-time">报到时间：<span><i class="el-icon-time"></i>
                  {{scope.row.学员信息.报到时间|dataFormat('yyyy-MM-dd')}}</span>
              </p>
              <p class="begin-time">计划开始培训日期：<span><i class="el-icon-time"></i>
                  {{scope.row.学员信息.计划开始培训日期|dataFormat('yyyy-MM-dd')}}</span>
              </p>
              <p class="end-time">计划结束培训日期：<span><i class="el-icon-time"></i>
                  {{scope.row.学员信息.计划结束培训日期|dataFormat('yyyy-MM-dd')}}</span>
              </p>
              <div class="name-box" slot="reference">
               <span class="logo-img">
                <img v-if="scope.row.学员信息.头像路径" :src="http+scope.row.学员信息.头像路径" alt="">
                <img v-else src="@/assets/images/user.jpg" alt="">
               </span>
                <span class="title">{{scope.row.学员信息.姓名}}</span>
              </div>
            </el-popover>
            <!--<el-tag size="small" class="td-state" :type="getStates(scope.row.学员信息.状态)"
                    disable-transitions>{{scope.row.学员信息.状态}}
            </el-tag>-->
          </template>
        </el-table-column>
        <el-table-column label="学员状态" align="center">
          <template slot-scope="scope">
            <el-tag :type="getStates(scope.row.学员信息.状态)" size="small" disable-transitions>{{scope.row.学员信息.状态}}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="学员类型" align="center">
          <template slot-scope="scope">{{scope.row.学员信息.学员类型名称}}</template>
        </el-table-column>
        <el-table-column label="正常白班" prop="考勤统计.正常白班" align="center"></el-table-column>
        <el-table-column label="正常休假" prop="考勤统计.正常休假" align="center"></el-table-column>
        <el-table-column label="迟到" prop="考勤统计.迟到" align="center"></el-table-column>
        <el-table-column label="早退" prop="考勤统计.早退" align="center"></el-table-column>
        <el-table-column label="脱岗" prop="考勤统计.脱岗" align="center"></el-table-column>
        <el-table-column label="旷工" prop="考勤统计.旷工" align="center"></el-table-column>
        <el-table-column label="夜班" prop="考勤统计.夜班" align="center"></el-table-column>
        <el-table-column label="请假" prop="考勤统计.请假" align="center"></el-table-column>
        <el-table-column label="操作" align="center" width="100">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" plain icon="el-icon-date" @click="btnEditSignIn(false,scope.row)"
                       v-if="isShow(scope.row)">考勤
            </el-button>
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
    HTTP_URL_HOST,
    URL_TEACHING_MANAGEMENT,
    URL_SETTING,
    URL_BASE_INFO,
    STUDENT_STATE
  } from '@/assets/js/connect/ConSysUrl';
  import { formatDate, setObjArr, getObjArr } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';

  export default {
    components: { datePicker },
    data() {
      return {
        req: {
          Index: 1,
          Size: 13,
          OrderType: true,
          Like姓名: '',
          Like学员类型名称: '',
          状态: '',
          专业编号: '',
          开始日期: '',
          结束日期: ''
        },
        list: [],
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        isLoad: false,
        total: 0,
        title: '',
        types: [],
        majors: [],
        multipleSelection: [],
        time: [],
        http: HTTP_URL_HOST,
        placeholder: {
          start: '开始日期',
          end: '结束日期'
        },
        states: STUDENT_STATE
      };
    },
    created() {
      this.listLoading = true;
      this.req.开始日期 = formatDate(new Date(), 'yyyy-MM') + '-01';
      this.req.结束日期 = formatDate(new Date(), 'yyyy-MM-dd');
      this.time = [this.req.开始日期, this.req.结束日期];
      this.getList();
      this.getMajors();
      this.getStudentType();
    },
    methods: {
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
      isShow(item) {
        if (localStorage.getItem('userInfo')) {
          let data = getObjArr('userInfo').人员;
          if (data.编号 == item.学员信息.当前科室管理员编号) {
            return true;
          } else {
            return false;
          }
        }
      },
      getList: async function() {
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_PAGING_SING_IN_STATISTICS, this.req);
        if (data && data.list.length > 0) {
          this.total = data.total;
          data = data.list;
          let number = (this.req.Index - 1) * this.req.Size + 1;
          data.forEach((itemA) => {
            itemA.number = number;
            number++;
          });
          this.list = data;
        } else {
          this.list = [];
          this.total = 0;
        }
        this.listLoading = false;
        this.isLoad = true;
      },
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        if (this.time && this.time.length != 0) {
          this.req.开始日期 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.结束日期 = formatDate(this.time[1], 'yyyy-MM-dd');
        } else {
          this.req.开始日期 = '';
          this.req.结束日期 = '';
        }
        this.list = [];
        this.getList();
      },
      changeTime(time) {
        this.time = time;
      },
      getType(type) {
        switch (type) {
          case '实习生':
            return 'success';
          case '进修生':
            return 'danger';
          default :
            return 'primary';
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
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getList();
      },
      btnEditSignIn(value, item) {
        this.isAdd = value;
        this.item = item;
        let data = {
          item: item,
          isAdd: this.isAdd
        };
        setObjArr('dataItem', data);
        this.$router.push({ path: '/addEditSignIn' });
      }
    }
  };
</script>
<style type="text/scss" lang="scss">
  .page-signIn {
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
  .name-box {
    overflow: hidden;
    margin-bottom: 5px;
    padding-left: 20px;
  }

  .td-state {
    float: left;
    margin-left: 20px;
  }

  .logo-img {
    width: 30px !important;
    height: 30px !important;
    margin-right: 5px !important;
  }

  .title {
    padding-top: 5px;
  }

</style>



