<template>
  <div class="details">
    <div class="filter-container">
      <el-button class="filter-item" type="success" size="small" @click="btnBatchReport"><i
        class="iconfont icontianjia"></i> 确定选择
      </el-button>
      <el-input v-model="req.Like姓名" placeholder="请输入学员姓名" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        学员类型
        <el-select v-model="req.Like学员类型名称" placeholder="请选择" @change="onSearch" style="width: 100px;">
          <el-option label="全部" :value="''"></el-option>
          <el-option :label="item.名称" :value="item.名称" v-for="item in types" :key="item.编号"></el-option>
        </el-select>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <div class="content">
      <el-table class="tableone" ref="multipleTable"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" stripe
                @selection-change="handleSelectionChange" :row-key="getRowKeys">
        <el-table-column type="selection" align="center" width="50" :reserve-selection="true"
                         prop="编号"></el-table-column>
        <el-table-column align="center" label="序号" prop="number" width="60"></el-table-column>
        <el-table-column label="姓名">
          <template slot-scope="scope">
               <span class="logo-img">
                <img v-if="scope.row.头像路径" :src="http+scope.row.头像路径" alt="">
                <img v-else src="@/assets/images/user.jpg" alt="">
               </span>
            <span class="title">{{scope.row.姓名}}</span>
          </template>
        </el-table-column>
        <el-table-column align="center" label="学员类型" prop="学员类型名称"></el-table-column>
        <el-table-column align="center" label="培训专业" prop="专业名称"></el-table-column>
        <el-table-column align="center" label="培训年界(年限)">
          <template slot-scope="scope">
            {{scope.row.学员培训年界}}（{{scope.row.学员培训年限}}年）
          </template>
        </el-table-column>
        <el-table-column align="center" label="教学本院策略" prop="教学本院策略名称"></el-table-column>
        <el-table-column label="状态" align="center">
          <template slot-scope="scope">
            <el-tag :type="scope.row.状态|studentStates" size="small">{{scope.row.状态}}</el-tag>
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
  </div>
</template>

<script>
  import { URL_SETTING, HTTP_URL_HOST, URL_BASE_INFO, URL_TEACHING_MANAGEMENT } from '@/assets/js/connect/ConSysUrl';
  import { arrayToJson, formatDate } from '@/assets/js/Common';

  export default {
    name: 'selectStudentTable',
    props: ['selectArr'],
    data() {
      return {
        req: {
          Index: 1,
          Size: 10,
          OrderType: false,
          Like学员类型名称: '',
          Like姓名: '',
          状态: '已报到'
        },
        list: [],
        multipleSelection: [],
        newSelection: [],
        types: [],
        majors: [],
        total: 0,
        loading: false,
        listLoading: true,
        isLoad: true,
        http: HTTP_URL_HOST,
        getRowKeys(row) {
          return row.编号;
        }
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
      btnBatchReport() {
        if (this.multipleSelection.length == 0) {
          this.$message.error('请先勾选学员！');
        } else {
          this.$emit('myEvent', this.multipleSelection);
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
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        this.list = [];
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
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getList();
      }
    }
  };
</script>

<style scoped>

</style>
