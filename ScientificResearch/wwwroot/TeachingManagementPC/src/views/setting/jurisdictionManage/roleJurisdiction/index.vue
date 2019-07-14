<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">角色及权限设置</h4>
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
        <el-table-column label="角色名称" prop="名称"></el-table-column>
        <el-table-column label="用户人数" align="center">
          <template slot-scope="scope">
            <el-button type="success" round size="mini" @click="btnRoleUser(scope.row)">{{ scope.row.人数 }}</el-button>
          </template>
        </el-table-column>
        <el-table-column label="功能数" align="center">
          <template slot-scope="scope">
            <el-button type="primary" round size="mini" plain @click="btnJurisdiction(scope.row)">{{ scope.row.功能数 }}</el-button>
          </template>
        </el-table-column>
        <el-table-column label="备注" align="center" prop="备注"></el-table-column>
        <el-table-column label="操作" align="center" width="250">
          <template slot-scope="scope">
            <el-button size="mini" type="success" icon="el-icon-setting" plain @click="btnRoleUser(scope.row)" v-if="scope.row.能否直接配置人员">角色人员
            </el-button>
            <el-button size="mini" type="primary" icon="el-icon-view" @click="btnJurisdiction(scope.row)">角色权限
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="not-content" v-if="isLoad&&list.length==0"><img src="@/assets/images/nothing.png"></div>
    <el-dialog :title="title" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               :class="{'big-dialog':isRoleUser}">
      <roleUser ref="child" @myEvent="getMyEvent" :item="item" v-if="isRoleUser"></roleUser>
      <roleJurisdiction ref="child" @myEvent="getMyEvent" :item="item" v-else></roleJurisdiction>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_PERMISSION, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl'
  import roleJurisdiction from '@/views/setting/jurisdictionManage/roleJurisdiction/roleJurisdiction'
  import roleUser from '@/views/setting/jurisdictionManage/roleJurisdiction/roleUser'

  export default {
    components: { roleJurisdiction, roleUser },
    data() {
      return {
        list: [],
        listLoading: true,
        isDialog: false,
        isAdd: false,
        isLoad: false,
        isRoleUser: false,
        item: {}
      }
    },
    mounted() {
      this.listLoading = true
      this.getList()
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_PERMISSION.GET_ROLE_LIST, '')
        if (data && data.length > 0) {
          this.list = data
        } else {
          this.list = []
        }
        this.listLoading = false
        this.isLoad = true
      },
      btnRoleUser(item, type) {
        this.item = item
        this.isAdd = false
        this.title = '设置角色人员'
        this.isRoleUser = true
        this.isDialog = true
      },
      btnJurisdiction(item) {
        this.item = item
        this.title = '设置角色权限'
        this.isRoleUser = false
        this.isDialog = true
        console.info(this.item)
      },
      getMyEvent(val) {
        this.getList()
        this.isDialog = val
      }
    }
  }
</script>
