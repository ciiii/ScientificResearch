<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">教学活动分类设置</h4>
    <!--<div class="filter-container">-->
      <!--<el-button class="filter-item" type="success" @click="btnAddEdit('添加活动',true,'')"><i class="iconfont icontianjia"></i> 添加活动</el-button>-->
    <!--</div>-->
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit
                highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" >
          <template slot-scope="scope">
            {{ scope.$index+1 }}
          </template>
        </el-table-column>
        <el-table-column label="分类名称" prop="名称"></el-table-column>
        <el-table-column label="备注" align="center" prop="备注"></span>
        </el-table-column>
        <el-table-column label="操作" align="center" width="120">
          <template slot-scope="scope">
            <el-button size="mini" type="success" icon="el-icon-edit" plain @click="btnAddEdit('修改分类',false,scope.row)">编辑</el-button>
            <!--<el-button size="mini" type="primary" plain @click="btnDetails(scope.row)">查看活动模板</el-button>-->
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="not-content" v-if="isLoad&&list.length==0"><img src="@/assets/images/nothing.png"></div>
    <el-dialog :title="title" :visible.sync="isDialog" width="30%" v-if='isDialog' :close-on-click-modal="false" class="big-dialog">
      <classifyDetails v-if="isDetail" ref="child" :item="item" @myEvent="closeDialog"></classifyDetails>
      <addOrEditClassify v-else ref="child" @myEvent="getMyEvent" :item="item" :isAdd="isAdd"></addOrEditClassify>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl'
  import addOrEditClassify from './addOrEditClassify'
  import classifyDetails from './classifyDetails'

  export default {
    components: { addOrEditClassify ,classifyDetails},
    data() {
      return {
        list: [],
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        isLoad: false,
        isDetail:false
      }
    },
    created() {
      this.listLoading = true
      this.getList()
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TEACHING_ACTIVITIES_CLASSIFY, '')
        if (data && data.length > 0) {
          this.list = data
        } else {
          this.list = []
        }
        this.listLoading = false
        this.isLoad = true
      },
      btnAddEdit(title, isAdd, item) {
        this.isAdd = isAdd
        this.title = title
        this.isDetail = false
        this.isDialog = true
        this.item = item
      },
      btnDetails(item) {
        this.title = '查看详情'
        this.item = item
        this.isDetail = true
        this.isDialog = true
      },
      closeDialog(val){
        this.isDialog = val
      },
      getMyEvent(val) {
        this.getList()
        this.isDialog = val
      }
    }
  }
</script>
