<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">登录日志列表</h4>
    <div class="filter-container">
      <el-input v-model="req.Like姓名" placeholder="姓名" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
      </div>
      <el-button class="filter-item" type="primary" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit
                highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90">
          <template slot-scope="scope">
            {{ scope.row.number }}
          </template>
        </el-table-column>
        <el-table-column label="姓名">
          <template slot-scope="scope">
            {{ scope.row.姓名 }}
          </template>
        </el-table-column>
        <el-table-column label="工号" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.工号 }}</span>
          </template>
        </el-table-column>
        <el-table-column label="IP地址" align="center">
          <template slot-scope="scope">
            {{ scope.row.IP }}
          </template>
        </el-table-column>
        <el-table-column align="center" prop="created_at" label="登录时间">
          <template slot-scope="scope">
            <i class="el-icon-time"/>
            <span>{{ scope.row.登录时间 }}</span>
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
  </div>
</template>

<script>
  import { getList } from '@/api/table';
  import { URL_PERMISSION } from '@/assets/js/connect/ConSysUrl';
  import { getInfo, formatDate} from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';

  export default {
    components:{datePicker},
    filters: {
      statusFilter(status) {
        const statusMap = {
          published: 'success',
          draft: 'gray',
          deleted: 'danger'
        };
        return statusMap[status];
      }
    },
    data() {
      return {
        list: [],
        listLoading: true,
        req: {
          Index: 1,
          Size: 16,
          OrderType: false,
          工号: '',
          Like姓名: '',
          Begin登录时间: '',
          End登录时间: ''
        },
        time: [],
        total: 0,
        isLoad: false,
        placeholder: {
          start: '开始报到日期',
          end: '开始报到日期'
        },
      };
    },
    mounted() {
      this.req.工号 = getInfo().data.人员.工号;
      this.listLoading = true;
      this.getLogList();
    },
    methods: {
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        if (this.time && this.time.length != 0) {
          this.req.Begin登录时间 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.End登录时间 = formatDate(this.time[1], 'yyyy-MM-dd');
        }else{
          this.req.Begin登录时间 = '';
          this.req.End登录时间 = '';
        }
        this.list = [];
        this.getLogList();
      },
      getLogList: async function() {
        let data = await this.$http.myGet(URL_PERMISSION.GET_LOGIN_LOG, this.req);
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
          this.total = 0;
        }
        this.listLoading = false;
        this.isLoad = true;
      },
      changeTime(time) {
        this.time = time;
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getLogList();

      }
    }
  };
</script>
