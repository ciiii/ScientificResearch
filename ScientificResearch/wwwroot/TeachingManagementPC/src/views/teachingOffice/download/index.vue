<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">下载中心列表</h4>
    <div class="filter-container">
      <el-button class="filter-item" type="success" @click="btnAddEdit('添加下载',true,'')">
        <i class="iconfont icontianjia"></i> 添加下载
      </el-button>
      <el-input v-model="req.Like文件名称" placeholder="请输入文件名称" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-input v-model="req.Like上传人姓名" placeholder="请输入上传人姓名" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        文件类型
        <el-select v-model="req.Like文件类型" placeholder="请选择" @change="onSearch">
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
        <el-table-column align="center" label="序号" width="90" prop="number"></el-table-column>
        <el-table-column label="文件名称">
          <template slot-scope="scope">
            <a @click="btnDetails('查看详情',scope.row)" class="td-title" href="javascript:;">{{scope.row.文件名称}}</a>
          </template>
        </el-table-column>
        <el-table-column label="文件类型" align="center" prop="文件类型" width="120"></el-table-column>
        <el-table-column label="上传人" align="center" prop="上传人姓名"></el-table-column>
        <el-table-column label="上传人部门" align="center" prop="上传人部门名称"></el-table-column>
        <el-table-column label="建立日期" align="center" width="120">
          <template slot-scope="scope">{{scope.row.建立时间|dataFormat('yyyy-MM-dd')}}</template>
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
                       @click="btnAddEdit('修改下载',false,scope.row)">编辑
            </el-button>
            <el-button size="mini" type="primary" plain @click="btnDetails('查看详情',scope.row)">详情</el-button>
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
    <el-dialog :title="title" :visible.sync="isDialog" width="30%" v-if='isDialog' :close-on-click-modal="false"
               class="common-dialog">
      <downloadDetails v-if="isDetail" ref="child" :item="item" @myEvent="closeDialog"></downloadDetails>
      <addDownload v-else ref="child" @myEvent="getMyEvent" :item="item" :isAdd="isAdd" :types="types"></addDownload>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_OFFICE, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl';
  import addDownload from './addDownload';
  import downloadDetails from './downloadDetails';

  export default {
    components: { addDownload, downloadDetails },
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
        isDetail: false
      };
    },
    mounted() {
      this.listLoading = true;
      this.getList();
      this.getTypes();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_OFFICE.URL_GET_DOWNLOAD_CENTER, this.req);
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
          分类: '下载中心文件类型'
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
      btnAddEdit(title, isAdd, item) {
        this.title = title;
        this.isAdd = isAdd;
        this.item = item;
        this.isDialog = true;
        this.isDetail = false;
      },
      enableOrDisableNotice: async function(data) {
        await this.$http.myPost(URL_OFFICE.URL_POST_ENABLE_OR_DISABLE_DOWNLOAD, data);
        this.$message.success('启用成功！');
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
          let postData = {
            编号: el.编号,
            上传人编号: el.上传人编号,
            是否启用: el.是否启用
          };
          this.enableOrDisableNotice(postData);

        }).catch(() => {
          el.是否启用 = !el.是否启用;
        });
      },
      btnDetails(title,item) {
        this.title = title;
        this.item = item;
        this.isDetail = true;
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
