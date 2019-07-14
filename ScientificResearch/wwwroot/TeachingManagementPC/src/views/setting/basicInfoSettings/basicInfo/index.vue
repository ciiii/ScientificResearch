<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">{{this.req.分类}}设置</h4>
    <div class="filter-container">
      <el-button class="filter-item" icon="el-icon-circle-plus-outline" type="success" @click="btnAdd">添加</el-button>
      <el-input v-model="req.Like值" placeholder="名称" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch"/>
      <el-button class="filter-item" type="primary" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit
                highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" prop="number"></el-table-column>
        <el-table-column label="分类名称" prop="值"></el-table-column>
        <el-table-column label="备注" align="center" prop="备注"></el-table-column>
        <el-table-column label="操作" align="center" width="200">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" icon="el-icon-edit" plain @click="btnEdit(scope.row)">编辑</el-button>
            <el-button size="mini" type="danger" icon="el-icon-delete" @click="btnDel(scope.row)">删除</el-button>
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
    <el-dialog :title="title" :visible.sync="isDialog" width="30%" v-if='isDialog' :close-on-click-modal="false">
      <addOrEditDictionary ref="child" @myEvent="getMyEvent" :type="this.req.分类" :item="item"
                           :isAdd="isAdd"></addOrEditDictionary>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl'
  import addOrEditDictionary from '@/views/setting/basicInfoSettings/basicInfo/addOrEditDictionary'

  export default {
    components: { addOrEditDictionary },
    data() {
      return {
        list: [],
        listLoading: true,
        req: {
          Index: 1,
          Size: 16,
          OrderType: false,
          分类: '',
          Like值: ''
        },
        total: 0,
        isDialog: false,
        isAdd: false,
        isLoad: false,
        item: {}
      }
    },
    mounted() {
      this.req.分类 = '学历'
      this.listLoading = true
      this.getList()
    },
    watch: {
      $route(to, from) {
        let type = this.$route.query.type
        this.req.分类 = type
        this.$route.meta.title = type
        this.getList()
        console.log(this.getStatus(this.$route.path))
      }
    },
    methods: {
      onSearch() {
        this.req.Index = 1
        this.listLoading = true
        this.list = []
        this.getList()
      },
      getList: async function() {
        let data = await this.$http.myGet(URL_BASE_INFO.GET_PAGING_TYPE_DICTIONARY, this.req)
        if (data && data.list.length > 0) {
          this.total = data.total
          data = data.list
          let number = (this.req.Index - 1) * this.req.Size + 1
          data.forEach(function(item) {
            item.number = number
            number++
          })
          this.list = data
        } else {
          this.list = []
          this.total = 0
        }
        this.listLoading = false
        this.isLoad = true
      },
      getStatus(urlStr) {
        let urlStrArr = urlStr.split('/')
        return urlStrArr[urlStrArr.length - 1]
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`)
      },
      handleCurrentChange(val) {
        this.req.Index = val
        this.getList()
      },
      btnAdd() {
        this.isAdd = true
        this.title = '添加'
        this.isDialog = true
      },
      btnEdit(item, type) {
        this.item = item
        this.isAdd = false
        this.title = '修改'
        this.isDialog = true
      },
      btnDel(item) {
        this.$confirm('确认要删除【' + item.值 + '】吗?', '提示', {
          type: 'warning'
        }).then(() => {
          this.confirmDel(item.编号)
        })
      },
      confirmDel: async function(id) {
        let postData = []
        postData.push(id)
        let data = await this.$http.myPost(URL_BASE_INFO.POST_DELETE_DICTIONARY, postData)
        this.$message({
          message: '删除成功！',
          type: 'success'
        })
        this.getList()
      },
      getMyEvent(val) {
        this.getList()
        this.isDialog = val
      }
    }
  }
</script>
