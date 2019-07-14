<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">标准规培科室设置</h4>
    <div class="filter-container">
      <el-button class="filter-item" type="success" @click="btnAddEdit(true,'')">
        <i class="iconfont icontianjia"></i> 添加培训科室
      </el-button>
      <el-input v-model="req.Like科室名称" placeholder="请输入科室名称" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        培训专业
        <el-select v-model="req.教学专业编号" placeholder="请选择" @change="onSearch">
          <el-option v-for="item in majors" :key="item.编号" :label="item.名称+' - '+item.年份"
                     :value="item.编号">
            <span style="float: left">{{ item.名称 }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px">{{ item.年份 }}</span>
          </el-option>
        </el-select>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" prop="number"></el-table-column>
        <el-table-column label="科室名称" align="center" prop="科室名称"></el-table-column>
        <el-table-column label="培训时间（周）" align="center" prop="最低培训时长" width="120"></el-table-column>
        <el-table-column label="管床例数" align="center" prop="最低管床数量" width="60"></el-table-column>
        <el-table-column label="全程管理" align="center" prop="最低全程管理数量" width="60"></el-table-column>
        <el-table-column label="门诊要求" align="center" prop="门诊病例数" width="60"></el-table-column>
        <el-table-column label="病例要求" align="center" prop="疾病病例数" width="60"></el-table-column>
        <el-table-column label="技能要求" align="center" prop="技能病例数" width="60"></el-table-column>
        <el-table-column label="住院病例" align="center" prop="住院病例数" width="60"></el-table-column>
        <el-table-column label="医技病例" align="center" prop="医技病例数" width="60"></el-table-column>
        <el-table-column label="操作" align="center" width="270">
          <template slot-scope="scope">
            <el-button size="mini" type="success" plain icon="el-icon-edit"
                       @click="btnAddEdit(false,scope.row)">编辑
            </el-button>
            <el-button size="mini" type="warning" plain @click="setAsk(scope.row)">要求</el-button>
            <el-button size="mini" type="danger" plain @click="setTask(scope.row)">任务</el-button>
            <el-button size="mini" type="primary" plain @click="btnDetails(scope.row)">详情</el-button>
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
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl';

  export default {
    data() {
      return {
        list: [],
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          教学专业编号: '',
          Like科室名称: ''
        },
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        isLoad: false,
        majors: [],
        isSetAsk: false,
        total: 0
      };
    },
    mounted() {
      this.listLoading = true;
      this.getMajors();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_PAGING_MAJOR_DEPARTMENT, this.req);
        if (data && data.list.length > 0) {
          this.total = data.total;
          data = data.list;
          let number = (this.req.Index - 1) * this.req.Size + 1;
          data.forEach(function(item) {
            item.number = number;
            number++;
          });
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
          this.req.教学专业编号 = this.majors[0].编号;
          this.getList();
        }
      },
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
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
      btnAddEdit(isAdd, item) {
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({
          name: 'AddOrEditMajorDepartment', params: {
            isAdd: isAdd
          }
        });
      },
      setAsk(item) {
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({ path: '/setAsk' });
      },
      setTask(item) {
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({ path: '/taskList' });
      },
      btnDetails(item) {
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({ path: '/majorDepartmentDetails' });
      },
      getMyEvent(value) {
        this.isDialog = value;
        this.onSearch();
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
