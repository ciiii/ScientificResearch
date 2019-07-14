<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">学员补轮转列表</h4>
    <div class="filter-container">
      <el-input v-model="req.Like学员姓名" placeholder="请输入学员姓名" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
      <el-button class="filter-item" type="success" @click="btnAddRotation">
        <i class="iconfont icontianjia"></i> 添加补轮转
      </el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" stripe>
        <el-table-column align="center" label="序号" prop="number" width="80"></el-table-column>
        <el-table-column label="学员姓名" width="150" prop="学员姓名"></el-table-column>
        <el-table-column label="本院科室" prop="本院科室名称"></el-table-column>
        <el-table-column label="科室管理员" prop="科室管理员姓名"></el-table-column>
        <el-table-column label="带教老师" prop="带教老师姓名"></el-table-column>
        <el-table-column label="计划入科日期">
          <template slot-scope="scope">{{scope.row.计划入科日期|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="开始日期">
          <template slot-scope="scope">{{scope.row.开始日期|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="结束日期">
          <template slot-scope="scope">{{scope.row.结束日期|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="建立时间">
          <template slot-scope="scope">{{scope.row.建立时间|dataFormat('yyyy-MM-dd')}}</template>
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
  import { URL_TEACHING_MANAGEMENT} from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';

  export default {
    data() {
      return {
        req: {
          Index: 1,
          Size: 13,
          OrderType: true,
          Like学员姓名: ''
        },
        list: [],
        listLoading: true,
        isAdd: false,
        item: {},
        isLoad: false,
        total: 0,
      }
    },
    created() {
      this.listLoading = true;
      this.getList();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_PAGING_REPAIR_ROTATION, this.req);
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
      btnAddRotation() {
        this.$router.push({ path: '/addRepairRotation' });
      },
      getMyEvent(val) {
        this.isDialog = val;
        this.multipleSelection = [];
        this.onSearch();
      },
      closeDialog() {
        this.isDialog = false;
      }
    }
  };
</script>



