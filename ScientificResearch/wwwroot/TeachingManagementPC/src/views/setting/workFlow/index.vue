<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">流程一览</h4>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone"
        v-loading="listLoading" :data="list"
        element-loading-text="Loading" border fit
        highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="95">
          <template slot-scope="scope">
            {{ scope.row.number }}
          </template>
        </el-table-column>
        <el-table-column label="流程名称">
          <template slot-scope="scope">
            {{ scope.row.Name }}
          </template>
        </el-table-column>
        <el-table-column label="ID" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.Id }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="110">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" icon="el-icon-tickets" plain @click="btnDetails(scope.row)">详情</el-button>
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
      <el-dialog :title="title" :visible.sync="isDialog" width="30%" v-if='isDialog'
                 :close-on-click-modal="false">
          <workFlowDetails ref="child" @myEvent="closeDialog" :item="item"></workFlowDetails>
      </el-dialog>
    </div>
    <div class="not-content" v-if="isLoad&&list.length==0"><img src="@/assets/images/nothing.png"></div>
  </div>
</template>

<script>
  import { getList } from '@/api/table'
  import { URL_WORK_FLOW } from '@/assets/js/connect/ConSysUrl'
  import { getInfo, formatDate } from '@/assets/js/Common'
  import workFlowDetails from '@/views/setting/workFlow/workFlowDetails'

  export default {
    filters: {
      statusFilter(status) {
        const statusMap = {
          published: 'success',
          draft: 'gray',
          deleted: 'danger'
        }
        return statusMap[status]
      }
    },
    components:{workFlowDetails},
    data() {
      return {
        list: [],
        listLoading: true,
        req: {
          Index: 1,
          Size: 16,
          OrderType: false
        },
        total: 0,
        isDialog:false,
        isLoad:false,
        item:{}
      }
    },
    mounted() {
      this.listLoading = true
      this.getList();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_WORK_FLOW.GET_FLOW_PATH_LIST, this.req)
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
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`)
      },
      handleCurrentChange(val) {
        this.req.Index = val
        this.getList()

      },
      closeDialog(val) {
        this.isDialog = val;
      },
      btnDetails(item){
        this.title = item.Name;
        this.item = item;
        this.isDialog = true;
      }
    }
  }
</script>
