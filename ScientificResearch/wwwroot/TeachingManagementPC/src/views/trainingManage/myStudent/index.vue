<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">我的学员列表</h4>
    <div class="filter-container">
      <el-input v-model="req.Like姓名" placeholder="请输入学员姓名" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-input v-model="req.Like工号" placeholder="请输入学员工号" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        学员类型
        <el-select v-model="req.Like学员类型名称" placeholder="请选择" @change="onSearch">
          <el-option label="全部" value=""></el-option>
          <el-option v-for="item in types" :key="item.编号" :label="item.名称" :value="item.名称"></el-option>
        </el-select>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" prop="number"></el-table-column>
        <el-table-column label="姓名">
          <template slot-scope="scope" @click="btnDetails(scope.row)">
            <span class="logo-img">
              <img v-if="scope.row.头像路径" :src="http+scope.row.头像路径" alt="">
              <img v-else src="@/assets/images/user.jpg" alt="">
            </span>
            <span class="title">{{scope.row.姓名}}</span>
          </template>
        </el-table-column>
        <el-table-column label="工号" align="center" prop="工号" width="120px"></el-table-column>
        <el-table-column label="最高学历" align="center" prop="最高学历"></el-table-column>
        <el-table-column label="学员类型名称" align="center" prop="学员类型名称"></el-table-column>
        <el-table-column label="培训专业" align="center" prop="专业名称"></el-table-column>
        <el-table-column label="学员状态" align="center">
          <template slot-scope="scope">
            <el-tag :type="scope.row.状态|studentStates" size="small">{{scope.row.状态}}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="培训年届(年限)" align="center">
          <template slot-scope="scope">
            {{scope.row.学员培训年界}}（ {{scope.row.学员培训年限}} 年）
          </template>
        </el-table-column>
        <el-table-column label="计划开始培训日期" align="center">
          <template slot-scope="scope">
            {{scope.row.计划开始培训日期|dataFormat('yyyy-MM-dd')}}
          </template>
        </el-table-column>
        <el-table-column label="计划结束培训日期" align="center">
          <template slot-scope="scope">
            {{scope.row.计划结束培训日期|dataFormat('yyyy-MM-dd')}}
          </template>
        </el-table-column>
        </el-table-column>
        <el-table-column label="操作" align="center" width="150">
          <template slot-scope="scope">
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
    <el-dialog :title="title" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               class="big-dialog common-dialog">
      <studentDetails ref="child" @myEvent="getMyEvent" :item="item"></studentDetails>
    </el-dialog>
  </div>
</template>

<script>
  import { HTTP_URL_HOST, URL_TEACHING_MANAGEMENT, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl';
  import studentDetails from '@/views/organization/studentFiles/studentDetails';

  export default {
    components: { studentDetails },
    data() {
      return {
        list: [],
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          是否启用: '',
          通知类型: '',
          Like文件名称: '',
          Like文件类型: ''
        },
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        types: [],
        total: 0,
        isLoad: false,
        http: HTTP_URL_HOST
      };
    },
    mounted() {
      this.listLoading = true;
      this.getList();
      this.getStudentType();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_PAGING_MY_STUDENT, this.req);
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
      getStudentType: async function() {
        let data = await this.$http.myGet(URL_BASE_INFO.GET_STUDENT_TYPE, '');
        if (data && data.length > 0) {
          this.types = data;
        } else {
          this.types = [];
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
      btnDetails(item) {
        this.item = item;
        this.title = '学员个人信息';
        this.isDialog = true;
      },
      getMyEvent(value) {
        this.isDialog = value;
        this.onSearch();
      },
      closeDialog() {
        this.isDialog = false;
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
