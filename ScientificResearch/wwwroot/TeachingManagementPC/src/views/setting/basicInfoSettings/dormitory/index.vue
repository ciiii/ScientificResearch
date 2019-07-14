<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">学员宿舍设置</h4>
    <div class="filter-container">
      <el-button class="filter-item" type="success" @click="btnAdd"><i class="iconfont icontianjia"></i> 添加</el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit
                highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90">
          <template slot-scope="scope">
            {{ scope.$index+1 }}
          </template>
        </el-table-column>
        <el-table-column label="楼栋名称" prop="名称"></el-table-column>
        <el-table-column label="层数" align="center" prop="名称"></el-table-column>
        <el-table-column label="单元数" align="center" prop="单元数"></el-table-column>
        <el-table-column label="每层户数" align="center" prop="每单元每层户数"></el-table-column>
        <el-table-column label="每户床数" align="center" prop="每户床数"></el-table-column>
        <el-table-column label="备注" align="center" prop="备注"></span>
        </el-table-column>
        <el-table-column label="操作" align="center" width="120">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" icon="el-icon-edit" plain @click="btnEdit(scope.row)">编辑</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="not-content" v-if="isLoad&&list.length==0"><img src="@/assets/images/nothing.png"></div>
    <el-dialog :title="title" :visible.sync="isDialog" width="30%" v-if='isDialog' :close-on-click-modal="false">
      <addOrEditDormitory ref="child" @myEvent="getMyEvent" :item="item" :isAdd="isAdd"></addOrEditDormitory>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl';
  import addOrEditDormitory from '@/views/setting/basicInfoSettings/dormitory/addOrEditDormitory';

  export default {
    components: { addOrEditDormitory },
    data() {
      return {
        list: [],
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        isLoad: false
      };
    },
    created() {
      this.listLoading = true;
      this.getList();
    },
    mounted() {

    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_BASE_INFO.GET_DORMITORY_LIST, '');
        if (data && data.length > 0) {
          this.list = data;
          this.showContent = true;
        } else {
          this.list = [];
          this.showContent = false;
        }
        this.listLoading = false;
        this.isLoad = true;
      },
      btnAdd() {
        this.isAdd = true;
        this.title = '添加';
        this.isDialog = true;
      },
      btnEdit(item, type) {
        this.item = item;
        this.isAdd = false;
        this.title = '修改';
        this.isDialog = true;
      },
      getMyEvent(val) {
        this.getList();
        this.isDialog = val;
      }
    }
  };
</script>
