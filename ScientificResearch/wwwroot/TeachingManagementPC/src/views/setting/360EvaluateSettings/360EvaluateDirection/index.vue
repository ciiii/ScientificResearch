<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">360评价方向</h4>
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
        <el-table-column label="名称" prop="名称"></el-table-column>
        <el-table-column label="评价人类型" align="center" prop="评价人类型"></el-table-column>
        <el-table-column label="被评价人类型" align="center" prop="被评价人类型"></el-table-column>
        <el-table-column label="说明" prop="说明"></el-table-column>
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
        list: [],
        listLoading: true,
        isLoad: false
      }
    },
    mounted() {
      this.listLoading = true
      this.getList()
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_360_EVALUATE_DIRECTION, '')
        if (data && data.length > 0) {
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
      }
    }
  }
</script>
