<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">通知公告列表</h4>
    <div class="filter-container">
      <el-button class="filter-item" type="success" @click="btnAddEdit(true,'')">
        <i class="iconfont icontianjia"></i> 添加公告
      </el-button>
      <el-input v-model="req.Like通知名称" placeholder="请输入通知名称" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-input v-model="req.Like发送人姓名" placeholder="请输入发送人姓名" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        通知类型
        <el-select v-model="req.通知类型" placeholder="请选择" @change="onSearch">
          <el-option label="全部" value=""></el-option>
          <el-option v-for="item in types" :key="item.编号" :label="item.值" :value="item.值"></el-option>
        </el-select>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
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
  import { URL_OFFICE, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl';

  export default {
    data() {
      return {
        list: [],
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          通知类型: '',
          Like通知名称: '',
          Like发送人姓名: ''
        },
        listLoading: true,
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
        let data = await this.$http.myGet(URL_OFFICE.GET_PAGING_NOTICE_LIST, this.req);
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
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getList();
      },
      btnAddEdit(isAdd, item) {
        let itemData = {
          isAdd: isAdd,
          item: item
        };
        sessionStorage.setItem('itemData', JSON.stringify(itemData));
        this.$router.push({ path: '/addNotice' });
      },
      enableNotice: async function(data) {
        await this.$http.myPost(URL_OFFICE.POST_ENABLE_NOTICE, data);
        this.$message.success('启用成功！');
      },
      disableNotice: async function(data) {
        await this.$http.myPost(URL_OFFICE.POST_DISABLE_NOTICE, data);
        this.$message.success('禁用成功！');
      },
      switchChange(el) {
        let title = '启用';
        if (el.是否启用) {
          title = '启用';
        } else {
          title = '禁用';
        }
        this.enableDisableStrategy(title, el);
      },
      enableDisableStrategy(title, el) {
        this.$confirm('您确定要【' + title + '】此公告吗', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          if (el.是否启用) {
            this.enableNotice([el.编号]);
          } else {
            this.disableNotice([el.编号]);
          }
        }).catch(() => {
          el.是否启用 = !el.是否启用;
        });
      },
      btnDetails(item) {
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({ path: '/noticeDetails' });
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
