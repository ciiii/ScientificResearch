<template>
  <div class="app-container page-common">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <h4 class="page-title" align="center">我的通知公告</h4>
    <div class="filter-container">
      <el-input v-model="req.Like发送人姓名" placeholder="请输入发送人姓名" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        通知类型
        <el-select v-model="req.通知类型" placeholder="请选择" @change="onSearch">
          <el-option label="全部" value=""></el-option>
          <el-option v-for="item in types" :key="item.编号" :label="item.值" :value="item.值"></el-option>
        </el-select>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="80" prop="number"></el-table-column>
        <el-table-column label="通知名称">
          <template slot-scope="scope">
            <a @click="btnDetails(scope.row)" class="td-title" href="javascript:;">{{scope.row.通知名称}}</a>
          </template>
        </el-table-column>
        <el-table-column label="通知类型" align="center" prop="通知类型" width="120"></el-table-column>
        <el-table-column label="发布人" align="center" prop="发送人姓名" width="130"></el-table-column>
        <el-table-column label="发布人部门" align="center" prop="发送人部门名称" width="130"></el-table-column>
        <el-table-column label="已接收人数" align="center" prop="已接收人数" width="70"></el-table-column>
        <el-table-column label="是否必读" align="center" width="60">
          <template slot-scope="scope">{{scope.row.是否必读?'是':'否'}}</template>
        </el-table-column>
        <el-table-column label="建立日期" align="center" width="120">
          <template slot-scope="scope">{{scope.row.建立时间|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="关闭时间" align="center" width="120">
          <template slot-scope="scope">{{scope.row.关闭时间|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="状态" property="是否启用" align="center" width="100">
          <template slot-scope="scope">
            <el-switch class="switch"
                       style="display: block"
                       v-model="scope.row.是否启用"
                       active-color="#13ce66"
                       inactive-color="#ff4949"
                       @change="switchChange(scope.row)"
                       active-text="启用">
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="150">
          <template slot-scope="scope">
            <el-button size="mini" type="success" plain icon="el-icon-edit"
                       @click="btnAddEdit(false,scope.row)">编辑
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
  </div>
</template>

<script>
  import { URL_BASE_INFO, URL_HOME } from '@/assets/js/connect/ConSysUrl';

  export default {
    data() {
      return {
        list: [],
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          是否已接收: '',
          是否必读: '',
          是否启用: true,
          通知类型: '',
          Like通知内容: '',
          Like发送人姓名: ''
        },
        isDialog: false,
        isAdd: false,
        item: {},
        types: [],
        total: 0,
        isLoad: false
      };
    },
    mounted() {
      this.listLoading = true;
      this.getList();
      this.getTypes();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_HOME.GET_PAGING_NOTICE, this.req);
        if (data && data.list.length > 0) {
          this.total = data.total;
          data = data.list;
          this.list = data;
        } else {
          this.list = [];
        }
        this.listLoading = false;
        this.isLoad = true;
      },
      getTypes: async function() {
        let postData = {
          分类: '通知类型'
        };
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TYPE_DICTIONARY, postData);
        if (data && data.length > 0) {
          this.types = data.reverse();
        }
      },
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        this.list = [];
        this.getList();
      },
      btnDetails(item) {
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({ path: '/noticeDetails' });
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
<style lang="scss" scoped type="text/scss">
  .btn-back-box {
    margin-bottom: 0;
  }

  .page-title {
    margin-top: 0;
  }
</style>



