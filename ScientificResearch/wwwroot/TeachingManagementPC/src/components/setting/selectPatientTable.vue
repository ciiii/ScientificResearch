<template>
  <div class="details selectUserTable">
    <div class="filter-container">
      <el-button class="filter-item" type="primary" size="small" @click="btnBatchReport">
        <i class="iconfont iconyanshoutongguo"></i> 确定选择
      </el-button>
      <el-button class="filter-item" type="success" size="small" @click="btnAddEdit(true,null,'添加病人')">
        <i class="iconfont icontianjia"></i> 添加病人
      </el-button>
      <el-input v-model="req.Like姓名" placeholder="请输入姓名" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-input v-model="req.Like住院号" placeholder="请输入住院号" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-input v-model="req.Like住院床号" placeholder="请输入住院床号" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
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
        <el-table-column label="性别" prop="性别" width="60"></el-table-column>
        <el-table-column align="center" label="住院号" prop="住院号"></el-table-column>
        <el-table-column align="center" label="床号" prop="住院床号"></el-table-column>
        <el-table-column align="center" label="主要诊断" prop="主要诊断"></el-table-column>
        <el-table-column align="center" label="入院日期" prop="入院日期">
          <template slot-scope="scope">{{scope.row.入院日期|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column align="center" label="出院日期" prop="出院日期">
          <template slot-scope="scope">{{scope.row.出院日期|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="145">
          <template slot-scope="scope">
            <el-button size="mini" type="success" plain icon="el-icon-edit"
                       @click="btnAddEdit(false,scope.row,'修改病人')">编辑
            </el-button>
            <el-button size="mini" type="primary" plain @click="btnDetails(scope.row)">详情</el-button>
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
    <el-dialog :title="title" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               class="common-dialog">
      <component :is="pageUrl" @myEvent="getMyEvent" :item="item" :isAdd="isAdd" @myClosed="myEventClosed"/>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_SETTING, HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
  import { arrayToJson, formatDate, isSelected } from '@/assets/js/Common';
  import addPatient from '@/views/setting/patientSettings/addPatient';
  import patientDetails from '@/views/setting/patientSettings/patientDetails';

  export default {
    name: 'selectPatientTable',
    components: { addPatient, patientDetails },
    data() {
      return {
        req: {
          Index: 1,
          Size: 10,
          OrderType: false,
          Like姓名: '',
          Like住院号: '',
          Like住院床号: ''
        },
        list: [],
        multipleSelection: [],
        newSelection: [],
        types: [],
        majors: [],
        total: 0,
        loading: false,
        isDialog: false,
        listLoading: true,
        pageUrl: '',
        item:{},
        isLoad: true,
        http: HTTP_URL_HOST,
        getRowKeys(row) {
          return row.编号;
        }
      };
    },
    mounted() {
      this.listLoading = true;
      this.getList();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_PAGING_PATIENT, this.req);
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
      btnAddEdit(isAdd, item, title) {
        this.isAdd = isAdd;
        this.item = item;
        this.title = title;
        this.pageUrl = 'addPatient';
        this.isDialog = true;
      },
      btnDetails(item) {
        console.info(item);
        this.title = '查看病人详情';
        this.item = item;
        this.isAdd = false;
        this.pageUrl = 'patientDetails';
        this.isDialog = true;
      },
      getMyEvent() {
        this.isDialog = false;
        this.onSearch();
      },
      myEventClosed() {
        this.isDialog = false;
      },
      btnBatchReport() {
        if (this.multipleSelection.length == 0) {
          this.$message.error('请先勾选病人！');
        } else {
          if (this.multipleSelection.length > 1) {
            this.$message.error('只能选择一位病人！');
          } else {
            this.$emit('myEvent', this.multipleSelection);
          }
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

<style type="text/scss" lang="scss">
  .v-modal {
    z-index: 9 !important;
  }
</style>
