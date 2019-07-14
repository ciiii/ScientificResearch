<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">学员档案管理</h4>
    <div class="filter-container">
      <el-button class="filter-item" type="success" @click="addStudent(true,'')"><i
        class="iconfont icontianjia"></i> 添加学员
      </el-button>
      <el-button class="filter-item btn-import" type="primary" size="small" @click="importStudent" plain><i
        class="iconfont icon-update"></i> 导入学员
      </el-button>
      <el-input v-model="req.Like姓名" placeholder="请输入学员姓名" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        学员类型
        <el-select v-model="req.Like学员类型名称" placeholder="请选择" class="filter-item" @change="onSearch">
          <el-option label="全部" :value="''"></el-option>
          <el-option :label="item.名称" :value="item.名称" v-for="item in types" :key="item.编号"></el-option>
        </el-select>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" fit
                highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" prop="number"></el-table-column>
        <el-table-column label="姓名">
          <template slot-scope="scope">
            <span class="logo-img">
              <img v-if="scope.row.头像路径" :src="http+scope.row.头像路径" alt="">
              <img v-else src="@/assets/images/user.jpg" alt="">
            </span>
            <span class="title">{{scope.row.姓名}}</span>
          </template>
        </el-table-column>
        <el-table-column label="工号" align="center" prop="工号" width="120px"></el-table-column>
        <el-table-column label="联系方式" align="center" prop="手机号码"></el-table-column>
        <el-table-column label="学员类型" align="center" prop="学员类型名称"></el-table-column>
        <el-table-column label="培训专业" align="center" prop="专业名称"></el-table-column>
        <el-table-column label="培训年届(年限)" align="center">
          <template slot-scope="scope">
            {{scope.row.学员培训年界}}（ {{scope.row.学员培训年限}} 年）
          </template>
        </el-table-column>
        <el-table-column label="执业证书" align="center" prop="执业证书编号"></span>
        </el-table-column>
        <el-table-column label="操作" align="center" width="150">
          <template slot-scope="scope">
            <el-button size="mini" type="success" icon="el-icon-edit" plain @click="addStudent(false,scope.row)">
              编辑
            </el-button>
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
               :class="{'big-dialog':isDetails}" class="common-dialog">
      <studentDetails v-if="isDetails" ref="child" @myEvent="getMyEvent" :item="item"></studentDetails>
      <importStudent v-else ref="child" @myEvent="getStudentMyEvent"></importStudent>
    </el-dialog>
  </div>
</template>

<script>
  import { HTTP_URL_HOST, URL_ORGANIZATION, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl';
  import studentDetails from '@/views/organization/studentFiles/studentDetails';
  import importStudent from './importStudent';

  export default {
    components: { studentDetails, importStudent },
    data() {
      return {
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          Like学员类型名称: '',
          是否启用: '',
          Like姓名: ''
        },
        list: [],
        listLoading: true,
        isDialog: false,
        isAdd: false,
        isDetails: false,
        item: {},
        isLoad: false,
        isImportDialog: false,
        total: 0,
        types: [],
        http: HTTP_URL_HOST
      };
    },
    created() {
      this.listLoading = true;
      this.getStudents();
      this.getStudentType();
    },
    methods: {
      getStudents: async function() {
        let data = await this.$http.myGet(URL_ORGANIZATION.GET_PAGING_ALL_STUDENT, this.req);
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
          this.total = 0;
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
        this.getStudents();
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getStudents();
      },
      addStudent(isAdd, item) {
        this.isDetails = false;
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({
          name: 'AddOrEditStudent', params: {
            isAdd: isAdd
          }
        });
      },
      btnDetails(item) {
        this.item = item;
        this.isDetails = true;
        this.title = '学员个人信息';
        this.isDialog = true;
      },
      importStudent() {
        this.title = '学员导入';
        this.isDetails = false;
        this.isDialog = true;
      },
      getStudentMyEvent(val) {
        this.getStudents();
        this.isDialog = val;
      },
      getMyEvent(val) {
        this.isDialog = val;
      }
    }
  };
</script>
