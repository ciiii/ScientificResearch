<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">医疗差错及事故记录</h4>
    <div class="filter-container">
      <el-button class="filter-item" type="success" @click="btnAdd">
        <i class="iconfont icontianjia"></i> 添加事故记录
      </el-button>
      <el-input v-model="req.Like学员姓名" placeholder="请输入学员姓名" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-input v-model="req.Like科室管理员姓名" placeholder="请输入科室管理员姓名" style="width: 150px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        所属科室
        <el-select v-model="req.本院科室编号" placeholder="请选择" @change="onSearch" style="width: 150px;">
          <el-option label="全部" :value="''"></el-option>
          <el-option v-for="item in departments" :key="item.编号" :label="item.名称" :value="item.编号"></el-option>
        </el-select>
      </div>
      <div class="filter-item">
        状态
        <el-select v-model="req.状态" placeholder="请选择" @change="onSearch" style="width: 150px;">
          <el-option label="全部" :value="''"></el-option>
          <el-option :label="item" :value="item" v-for="item in states" :key="item"></el-option>
        </el-select>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" stripe @selection-change="handleSelectionChange" :row-key="getRowKeys">
        <el-table-column type="selection" align="center" width="55" :reserve-selection="true"
                         prop="编号"></el-table-column>
        <el-table-column align="center" label="序号" prop="number" width="80"></el-table-column>
        <el-table-column label="学员姓名" prop="学员姓名"></el-table-column>
        <el-table-column label="本院科室" prop="本院科室名称" align="center"></el-table-column>
        <el-table-column label="科室管理员" prop="科室管理员姓名" align="center"></el-table-column>
        <el-table-column label="带教老师" prop="带教老师姓名" align="center"></el-table-column>
        <el-table-column label="处理类别" prop="处理类别" align="center"></el-table-column>
        <el-table-column label="处理意见" prop="处理意见" align="center"></el-table-column>
        <el-table-column label="处理日期" align="center">
          <template slot-scope="scope">{{scope.row.处理日期|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="状态" align="center">
          <template slot-scope="scope">
            <el-tag :type="getStates(scope.row.状态)" size="small">{{scope.row.状态}}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="150">
          <template slot-scope="scope">
            <el-button size="mini" type="success" plain icon="el-icon-edit"
                       @click="btnAddEdit(scope.row)">编辑
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
    <div class="not-content" v-if="isLoad&&list.length==0"><img src="@/assets/images/nothing.png"></div>
    <el-dialog :title="title" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               class="common-dialog">
      <recordDetails ref="child" @myEvent="myEvent" :item="item" v-if="isDetails"></recordDetails>
      <addEditRecordForm ref="child" @myEvent="myEvent" :item="item" :isAdd="isAdd" v-else></addEditRecordForm>

    </el-dialog>
  </div>
</template>

<script>
  import { URL_TEACHING_MANAGEMENT, ROTATION_STATE, URL_ORGANIZATION } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import recordDetails from './recordDetails';
  import addEditRecordForm from './addEditRecordForm';

  export default {
    components: { recordDetails,addEditRecordForm },
    data() {
      return {
        req: {
          Index: 1,
          Size: 13,
          OrderType: true,
          Like学员姓名: '',
          处理类别: '',
          本院科室编号: '',
          Begin处理日期: '',
          End处理日期: '',
          Like科室管理员名称: ''
        },
        reqDepartment: {
          是否启用: true,
          是否教学科室: true
        },
        list: [],
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        isLoad: false,
        isDetails: false,
        total: 0,
        title: '',
        departments: [],
        multipleSelection: [],
        states: ROTATION_STATE,
        getRowKeys(row) {
          return row.编号;
        }
      };
    },
    created() {
      this.listLoading = true;
      this.getList();
      this.getTeachingDepartment();
    },
    methods: {
      getTeachingDepartment: async function() {
        let data = await this.$http.myGet(URL_ORGANIZATION.GET_TEACHING_DEPARTMENT_LIST, this.reqDepartment);
        if (data && data.length > 0) {
          this.departments = data;
        }
      },
      getList: async function() {
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_PAGING_MEDICAL_ERROR_RECORD, this.req);
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
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        this.list = [];
        this.getList();
      },
      getStates(state) {
        switch (state) {
          case '未入科':
            return 'warning';
          case '在科':
            return 'success';
          case '已出科':
            return 'primary';
        }
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
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getList();
      },
      btnAdd() {
        this.$router.push({ path: '/addEditRecord' });
      },
      btnAddEdit(item) {
        this.isAdd = false;
        this.item = item;
        this.title = '修改事故记录';
        this.isDialog = true;
        this.isDetails = false;
      },
      btnDetails(item) {
        this.item = item;
        this.title = '查看事故记录';
        this.isDialog = true;
        this.isDetails = true;
      },
      myEvent() {
        this.isDialog = false;
        this.onSearch();
      },
      closeDialog() {
        this.isDialog = false;
      }
    }
  };
</script>



