<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">教学活动评价项目设置</h4>
    <div class="filter-container">
      <el-button class="filter-item" type="success" @click="btnAddEdit('添加评价项目',true,'')"><i class="iconfont icontianjia"></i> 添加评价项目</el-button>
      <div class="filter-item">
        活动分类
        <el-select v-model="req.教学活动类型编号" placeholder="请选择" class="filter-item" @change="onSearch">
          <el-option v-for="item in types" :key="item.编号" :label="item.名称" :value="item.编号" ></el-option>
        </el-select>
      </div>
    </div>
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
        <el-table-column label="名称" prop="名称"></el-table-column>
        <el-table-column label="标准分" align="center" prop="标准分" width="150"></el-table-column>
        <el-table-column label="说明" prop="说明"></span>
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
            <el-button size="mini" type="success" plain icon="el-icon-edit" @click="btnAddEdit('修改评价项目',false,scope.row)">编辑</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="not-content" v-if="isLoad&&list.length==0"><img src="@/assets/images/nothing.png"></div>
    <el-dialog :title="title" :visible.sync="isDialog" width="30%" v-if='isDialog' :close-on-click-modal="false">
      <addOrEditProject ref="child" @myEvent="getMyEvent" :item="item" :isAdd="isAdd" :type="req.教学活动类型编号"></addOrEditProject>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl'
  import addOrEditProject from './addOrEditProject'

  export default {
    components: { addOrEditProject },
    data() {
      return {
        types: [],
        list: [],
        req:{
          教学活动类型编号:1,
          是否启用:''
        },
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        isLoad: false
      }
    },
    mounted() {
      this.listLoading = true
      this.getTypes()
      this.getList()
    },
    methods: {
      getTypes: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TEACHING_ACTIVITIES_CLASSIFY, '')
        if (data && data.length > 0) {
          this.types = data
        }
      },
      getList: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TEACHING_ACTIVITIES_PROJDECT, this.req)
        if (data && data.length > 0) {
          this.list = data
        } else {
          this.list = []
        }
        this.listLoading = false
        this.isLoad = true
      },
      onSearch(){
        this.listLoading = true
        this.list = []
        this.getList()
      },
      btnAddEdit(title, isAdd, item) {
        this.isAdd = isAdd
        this.title = title
        this.isDialog = true
        this.item = item
      },
      enableProject: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_ENABLE_ACTIVITIES_PROJDECT, data)
        this.$message.success('启用成功！')
      },
      disableProject: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_DISABLE_ACTIVITIES_PROJDECT, data)
        this.$message.success('禁用成功！')
      },
      switchChange(el) {
        let title = '启用'
        if (el.是否启用) {
          title = '启用'
        } else {
          title = '禁用'
        }
        this.enableDisableProject(title, el)
      },
      enableDisableProject(title, el) {
        this.$confirm('您确定要【' + title + '】此评价项目吗', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          if (el.是否启用) {
            this.enableProject([el.编号])
          } else {
            this.disableProject([el.编号])
          }
        }).catch(() => {
          el.是否启用 = !el.是否启用
        })
      },
      getMyEvent(val) {
        this.getList()
        this.isDialog = val
      }
    }
  }
</script>
