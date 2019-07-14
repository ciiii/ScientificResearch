<template>
  <div class="details">
    <div class="filter-container">
      <el-button class="filter-item" type="success" size="small" @click="btnBatchReport"><i
        class="iconfont iconyanshoutongguo"></i> 确定选择
      </el-button>
      <el-input v-model="req.LikeAllName" placeholder="请输入姓名" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        所属科室
        <cascaderDepartment ref="child" @myEvent="getDepartmentMyEvent" :departmentId="req.部门编号"
                            v-if="isLoad" ></cascaderDepartment>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <div class="content">
      <el-table class="tableone" ref="multipleTable"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" stripe
                @selection-change="handleSelectionChange" :row-key="getRowKeys">
        <el-table-column type="selection" align="center" width="50" :reserve-selection="true"
                         prop="编号"></el-table-column>
        <el-table-column align="center" label="序号" prop="number" width="60"></el-table-column>
        <el-table-column label="姓名" prop="姓名"></el-table-column>
        <el-table-column align="center" label="工号" prop="工号"></el-table-column>
        <el-table-column align="center" label="部门名称" prop="部门名称"></el-table-column>
        <el-table-column align="center" label="手机" prop="手机"></el-table-column>
        <el-table-column align="center" label="职务名称" prop="职务名称"></el-table-column>
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
  </div>
</template>

<script>
  import { URL_SETTING, HTTP_URL_HOST, URL_ORGANIZATION, URL_USER } from '@/assets/js/connect/ConSysUrl';
  import { arrayToJson, formatDate, isSelected } from '@/assets/js/Common';
  import cascaderDepartment from '@/components/setting/cascaderDepartment';

  export default {
    name: 'selectUserTable',
    props: ['selectArr'],
    components: { cascaderDepartment },
    data() {
      return {
        req: {
          Index: 1,
          Size: 10,
          OrderType: false,
          部门编号: '',
          LikeAllName: ''
        },
        list: [],
        multipleSelection: [],
        newSelection: [],
        types: [],
        majors: [],
        total: 0,
        loading: false,
        listLoading: true,
        isLoad: true,
        http: HTTP_URL_HOST,
        getRowKeys(row) {
          return row.编号;
        },
        isFirst: true
      };
    },
    mounted() {
      this.listLoading = true;
      this.getList();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_USER.GET_ENABLE_PAGING_ALL_USER, this.req);
        if (data && data.list.length > 0) {
          this.total = data.total;
          data = data.list;
          let number = (this.req.Index - 1) * this.req.Size + 1;
          data.forEach((itemA) => {
            itemA.number = number;
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
      btnBatchReport() {
        if (this.multipleSelection.length == 0) {
          this.$message.error('请先勾选人员！');
        } else {
          this.$emit('myEvent', this.multipleSelection);
        }
      },
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        this.list = [];
        this.getList();
      },
      getDepartmentMyEvent(value) {
        this.req.部门编号 = value;
        this.onSearch();
      },
      handleSelectionChange(rows) {
        this.multipleSelection = [];
        if (rows) {
          rows.forEach(row => {
            if (row) {
              this.multipleSelection.push(row);
            }
          });
        }
        console.info('this.multipleSelection---');
        console.info(this.multipleSelection);
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getList();
      }
    }
  };
</script>

<style scoped>

</style>
