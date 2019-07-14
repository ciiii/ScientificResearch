<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">本院科室对应设置</h4>
    <div class="filter-container">
      <div class="filter-item">
        教学专业
        <el-select v-model="major" placeholder="请选择" @change="changeMajors" value-key="编号">
          <el-option v-for="item in majors" :key="item.编号" :label="item.名称+' - '+item.年份"
                     :value="item">
            <span style="float: left">{{ item.名称 }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px">{{ item.年份 }}</span>
          </el-option>
        </el-select>
      </div>
      <div class="filter-item">
        教学策略
        <el-select v-model="strategy" placeholder="请选择" @change="changeStrategys" value-key="编号">
          <el-option v-for="item in strategys" :key="item.编号" :label="item.名称" :value="item"></el-option>
        </el-select>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch"
                 v-if="req.教学本院策略编号">查询
      </el-button>
      <el-button class="filter-item" type="warning" @click="setCorresponding">
        <i class="iconfont icon-set"></i> 修改对应设置
      </el-button>
    </div>
    <div class="content">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="80">
          <template slot-scope="scope">{{scope.$index+1}}</template>
        </el-table-column>
        <el-table-column label="标准科室" align="center" prop="教学专业科室名称"></el-table-column>
        <el-table-column label="本院科室" align="center" prop="本院科室名称"></el-table-column>
        <el-table-column label="培训时间（周）" align="center" prop="培训时长" width="100"></el-table-column>
        <el-table-column label="管床例数" align="center" prop="最低管床数量" width="60"></el-table-column>
        <el-table-column label="全程管理" align="center" prop="最低全程管理数量" width="60"></el-table-column>
        <el-table-column label="门诊要求" align="center" prop="门诊病例数" width="60"></el-table-column>
        <el-table-column label="病例要求" align="center" prop="疾病病例数" width="60"></el-table-column>
        <el-table-column label="技能要求" align="center" prop="技能病例数" width="60"></el-table-column>
        <el-table-column label="住院病例" align="center" prop="住院病例数" width="60"></el-table-column>
        <el-table-column label="医技病例" align="center" prop="医技病例数" width="60"></el-table-column>
        <el-table-column label="是否必选" align="center" prop="是否必选" width="60">
          <template slot-scope="scope">
            {{scope.row.是否必选?'是':'否'}}
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="120">
          <template slot-scope="scope">
            <el-button size="mini" type="danger" plain @click="setTask(scope.row)">科室任务</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl';

  export default {
    data() {
      return {
        list: [],
        reqStrategys: {
          教学专业编号: '',
          是否启用: true
        },
        req: {
          教学本院策略编号: ''
        },
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        isLoad: false,
        majors: [],
        strategys: [],
        title: '',
        majorName: '',
        strategyName: '',
        strategy: {},
        major: {},
      };
    },
    mounted() {
      this.listLoading = true;
      this.getMajors();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_HOSPITAL_DEPARTMENT, this.req);
        if (data && data.length > 0) {
          this.list = data;
        } else {
          this.list = [];
        }
        this.listLoading = false;
        this.isLoad = true;
      },
      getMajors: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TRAINING_MAJOR_LIST, '');
        if (data && data.length > 0) {
          this.majors = data;
          this.reqStrategys.教学专业编号 = this.majors[0].编号;
          this.major = this.majors[0];
          this.getStrategys();
        }
      },
      changeMajors(item) {
        this.reqStrategys.教学专业编号 = item.编号;
        this.strategys = [];
        this.getStrategys();
      },
      getStrategys: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_HOSPITAL_STRATEGY_LIST, this.reqStrategys);
        if (data && data.length > 0) {
          this.strategys = data;
          this.req.教学本院策略编号 = this.strategys[0].编号;
          this.strategy = this.strategys[0];
          this.onSearch();
        } else {
          this.req.教学本院策略编号 = null;
          this.strategys = [];
          this.strategy = {};
        }
      },
      changeStrategys(item) {
        this.req.教学本院策略编号 = item.编号;
        this.onSearch();
      },
      onSearch() {
        this.listLoading = true;
        this.list = [];
        this.getList();
      },
      setCorresponding() {
        let info = {
          教学专业编号: this.reqStrategys.教学专业编号,
          专业名称: this.major.名称,
          教学本院策略编号: this.req.教学本院策略编号,
          策略名称: this.strategy.名称
        };
        sessionStorage.setItem('info', JSON.stringify(info));
        this.$router.push({ path: '/setCorresponding' });
      },
      setTask(item) {
        let info = {
          教学专业编号: this.reqStrategys.教学专业编号,
          专业名称: this.majorName,
          item: item
        };
        sessionStorage.setItem('info', JSON.stringify(info));
        this.$router.push({ path: '/departmentTaskList' });
      },
      btnAddEdit(title, isAdd, item) {
        this.isAdd = isAdd;
        this.title = title;
        this.isDialog = true;
        this.item = item;
      },
      closeDialog(val) {
        this.isDialog = val;
      },
      getMyEvent(val) {
        this.onSearch();
        this.isDialog = val;
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  .el-date-editor {
    padding: 0;
  }

  .el-cascader, .el-cascader-menu {
    width: 300px;
  }
</style>
