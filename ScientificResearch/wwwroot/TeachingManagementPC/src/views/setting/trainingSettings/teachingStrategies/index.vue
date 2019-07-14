<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">教学策略设置</h4>
    <div class="filter-container">
      <el-button class="filter-item" type="success" @click="btnAddEdit('添加策略',true,'')">
        <i class="iconfont icontianjia"></i> 添加策略
      </el-button>
      <el-input v-model="req.Like名称" placeholder="请输入策略名称" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        教学专业
        <el-select v-model="req.教学专业编号" placeholder="请选择" @change="onSearch">
          <el-option value="">全部</el-option>
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
    <div class="content">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90">
          <template slot-scope="scope">{{scope.$index+1}}</template>
        </el-table-column>
        <el-table-column label="策略名称" prop="名称"></el-table-column>
        <el-table-column label="教学专业" align="center" prop="教学专业名称"></el-table-column>
        <el-table-column label="专业年份" align="center" prop="教学专业年份" width="150"></el-table-column>
        <el-table-column label="科室数量（个）" align="center" prop="教学本院科室数量" width="150"></el-table-column>
        <el-table-column label="培训总时长（周）" align="center" prop="培训总时长"></el-table-column>
        <el-table-column label="建立日期" align="center">
          <template slot-scope="scope">{{scope.row.建立日期|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="状态" property="是否启用" align="center" width="150">
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
        <el-table-column label="操作" align="center" width="120">
          <template slot-scope="scope">
            <el-button size="mini" type="success" plain icon="el-icon-edit"
                       @click="btnAddEdit('修改策略',false,scope.row)">编辑
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <el-dialog :title="title" :visible.sync="isDialog" width="30%" v-if='isDialog' :close-on-click-modal="false">
      <addOrEditStrategy ref="child" @myEvent="getMyEvent" :item="item" :isAdd="isAdd" :majors="majors"></addOrEditStrategy>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl';
  import addOrEditStrategy from './addOrEditStrategy'

  export default {
    components:{addOrEditStrategy},
    data() {
      return {
        list: [],
        req: {
          教学专业编号: '',
          Like名称: '',
          是否启用: ''
        },
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        isLoad: false,
        majors: [],
        isSetAsk: false,
        title:''
      };
    },
    mounted() {
      this.listLoading = true;
      this.getMajors();
      this.getList();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_HOSPITAL_STRATEGY_LIST, this.req);
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
        }
      },
      onSearch() {
        this.listLoading = true;
        this.list = [];
        this.getList();
      },
      enableStrategy: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_ENABLE_HOSPITAL_STRATEGY, data);
        this.$message.success('启用成功！');
      },
      disableStrategy: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_DISABLE_HOSPITAL_STRATEGY, data);
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
        this.$confirm('您确定要【' + title + '】此策略吗', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          if (el.是否启用) {
            this.enableStrategy([el.编号]);
          } else {
            this.disableStrategy([el.编号]);
          }
        }).catch(() => {
          el.是否启用 = !el.是否启用;
        });
      },
      btnAddEdit(title, isAdd, item) {
        this.isAdd = isAdd
        this.title = title
        this.isDialog = true
        this.item = item
      },
      closeDialog(val){
        this.isDialog = val
      },
      getMyEvent(val) {
        this.onSearch()
        this.isDialog = val
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
