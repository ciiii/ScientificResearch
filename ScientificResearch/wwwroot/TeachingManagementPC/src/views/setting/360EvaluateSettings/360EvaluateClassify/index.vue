<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">360评价分类</h4>
    <div class="filter-container">
      <div class="filter-item">
        评价方向
        <el-select v-model="type" placeholder="请选择" class="filter-item" @change="changeSelect">
          <el-option v-for="item in directions" :key="item.编号" :label="item.名称" :value="item.编号"></el-option>
        </el-select>
      </div>
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
        <el-table-column label="分类名称" prop="名称"></el-table-column>
        <el-table-column label="被评价人类型" align="center" prop="被评价人类型" width="150"></el-table-column>
        <el-table-column label="说明" prop="说明"></span>
        </el-table-column>
      </el-table>
    </div>
    <div class="not-content" v-if="isLoad&&list.length==0"><img src="@/assets/images/nothing.png"></div>
  </div>
</template>

<script>
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl'

  export default {
    data() {
      return {
        directions: [],
        list: [],
        type: 1,
        req: {
          目标类型: 0
        },
        listLoading: true,
        isDialog: false,
        isLoad: false
      }
    },
    mounted() {
      this.listLoading = true
      this.getDirection()
      this.getList()
    },
    methods: {
      getDirection: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_360_EVALUATE_DIRECTION, '')
        if (data && data != []) {
          this.directions = data
        }
      },
      getList: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_360_EVALUATE_CLASSIFY, this.req)
        if (data && data != []) {
          this.list = data
        } else {
          this.list = []
        }
        this.listLoading = false
        this.isLoad = true
      },
      onSearch() {
        this.listLoading = true
        this.list = []
        this.getList()
      },
      changeSelect(value) {
        let item = this.directions.find((item) => item.编号 == value)
        this.req.目标类型 = item.目标类型
        this.onSearch()
      }
    }
  }
</script>
