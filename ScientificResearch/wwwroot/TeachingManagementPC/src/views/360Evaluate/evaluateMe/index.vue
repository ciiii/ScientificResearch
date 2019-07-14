<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">{{direction.名称}}</h4>
    <div class="filter-container">
      <el-input v-model="req.Like评价人姓名" placeholder="评价人姓名" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" prop="number"></el-table-column>
        <el-table-column label="评价人" prop="评价人姓名" width="140"></el-table-column>
        <el-table-column label="被评价人" prop="被评价人姓名" width="140"></el-table-column>
        <el-table-column label="评价方向" prop="被评价人姓名" width="170">
          <template slot-scope="scope">{{scope.row.评价人类型}}对{{scope.row.被评价人类型}}</template>
        </el-table-column>
        <el-table-column label="评分" prop="评分" align="center" width="200">
          <template slot-scope="scopeChild">
            <el-popover
              placement="top-start"
              title="评分详情"
              width="200"
              trigger="hover">
              <p class="keshi">所有项目满分：<span>{{scopeChild.row.所有项目满分}}</span>分</p>
              <p class="keshi">所有项目总得分：<span>{{scopeChild.row.所有项目总得分}}</span>分</p>
              <el-rate v-model="scopeChild.row.得分星数" :max="5" show-text disabled slot="reference"></el-rate>
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column label="评价内容" prop="评价内容"></el-table-column>
        <el-table-column label="评价时间" align="center" width="130">
          <template slot-scope="scope">{{scope.row.评价时间|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="100">
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
  </div>
</template>

<script>
  import { URL_360EVALUATE, URL_SETTING, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';

  export default {
    components: { datePicker },
    data() {
      return {
        list: [],
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          来源类型: null,
          NotEqual来源类型: null,
          Like评价人姓名: '',
          目标类型: '',
          Like被评价人姓名: ''
        },
        listLoading: true,
        isDialog: false,
        item: {},
        total: 0,
        isLoad: false,
        directions: [],
        direction: {}
      };
    },
    mounted() {
      if (localStorage.getItem('userInfo')) {
        let userInfo = JSON.parse(localStorage.getItem('userInfo')).人员;
        this.req.Like被评价人姓名 = userInfo.姓名;
      }
      this.getList();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_360EVALUATE.GET_PAGING_EVALUATE, this.req);
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
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({ path: '/evaluateDetails' });
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  .el-cascader, .el-cascader-menu {
    width: 300px;
  }

</style>
