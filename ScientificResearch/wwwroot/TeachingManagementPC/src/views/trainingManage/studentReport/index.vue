<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">学员报到情况</h4>
    <div class="filter-container">
      <div class="filter-item">
        <el-button class="filter-item" type="primary" :plain="getPlain(false)" @click="clickReport(false)">未报到
        </el-button>
        <el-button class="filter-item" type="primary" :plain="getPlain(true)" @click="clickReport(true)">已报到</el-button>
      </div>
      <el-input v-model="req.Like姓名" placeholder="请输入学员姓名" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        学员类型
        <el-select v-model="req.Like学员类型名称" placeholder="请选择" @change="onSearch" style="width: 150px;">
          <el-option label="全部" :value="''"></el-option>
          <el-option :label="item.名称" :value="item.名称" v-for="item in types" :key="item.编号"></el-option>
        </el-select>
      </div>
      <div class="filter-item">
        <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
      <el-button class="filter-item" v-if="!req.是否已报到" type="warning" @click="btnBatchReport('添加学员报到',true,'')"><i
        class="iconfont icontianjia"></i> 批量添加学员报到
      </el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" ref="multipleTable"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" fit
                highlight-current-row stripe
                @selection-change="handleSelectionChange" :row-key="getRowKeys">
        <el-table-column type="selection" align="center" width="55" v-if="!req.是否已报到" :reserve-selection="true" prop="编号"></el-table-column>
        <el-table-column align="center" label="序号" width="90" prop="number"></el-table-column>
        <el-table-column label="姓名">
          <template slot-scope="scope">
            <span class="logo-img">
              <img v-if="scope.row.头像路径" :src="http+scope.row.头像路径" alt="">
              <img v-else src="@/assets/images/user.jpg" alt="">
            </span>
            <span class="title">{{scope.row.姓名}}</span>
          </template>
        </el-table-column>
        <el-table-column label="工号" align="center" prop="工号" width="120px"></el-table-column>
        <el-table-column label="学员类型" align="center" prop="学员类型名称"></el-table-column>
        <el-table-column label="培训专业" align="center" prop="专业名称"></el-table-column>
        <el-table-column label="教学本院策略" align="center" prop="教学本院策略名称"></el-table-column>
        <el-table-column label="是否已报到" align="center">
          <template slot-scope="scope">
            <span :class="getClass(scope.row.是否已报到)" class="state">{{scope.row.是否已报到?'已报到':'未报到'}}</span>
          </template>
        </el-table-column>
        <el-table-column label="报到时间" align="center">
          <template slot-scope="scope">
            {{scope.row.报到时间|dataFormat('yyyy-MM-dd')}}
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="150">
          <template slot-scope="scope">
            <el-button v-if="scope.row.是否已报到" size="mini" type="success" icon="el-icon-edit" plain
                       @click="addStudent('修改学员报到',false,scope.row)">编辑
            </el-button>
            <el-button v-else size="mini" type="warning" plain @click="addStudent('添加学员报到',true,scope.row)"><i
              class="iconfont icontianjia"></i> 报到
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
               :class="{'big-dialog':isDetails}" class="common-dialog">
      <studentReportDetails v-if="isDetails" ref="child" @myEvent="closeDialog" :item="item"></studentReportDetails>
      <addStudentReport v-else ref="child" @myEvent="getMyEvent" :item="item" :isAdd="isAdd"
                        :arr="arr" :nameArr="names"></addStudentReport>
    </el-dialog>
  </div>
</template>

<script>
  import { HTTP_URL_HOST, URL_TEACHING_MANAGEMENT, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';
  import addStudentReport from './addStudentReport';
  import studentReportDetails from './studentReportDetails';

  export default {
    components: { datePicker, addStudentReport, studentReportDetails },
    data() {
      return {
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          是否已报到: false,
          Like学员类型名称: '',
          Like工号: '',
          Like姓名: '',
          Begin报到时间: '',
          End报到时间: ''
        },
        list: [],
        listLoading: true,
        isDialog: false,
        isDetails: false,
        isAdd: false,
        item: {},
        isLoad: false,
        total: 0,
        types: [],
        http: HTTP_URL_HOST,
        time: [],
        multipleSelection: [],
        arr: [],
        names: '',
        placeholder: {
          start: '开始报到日期',
          end: '结束报到日期'
        },
        getRowKeys(row) {
          return row.编号;
        }
      };
    },
    created() {
      this.listLoading = true;
      this.getStudents();
      this.getStudentType();
    },
    methods: {
      getStudents: async function() {
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_PAGING_STUDENT_REPORT, this.req);
        if (data && data.list.length > 0) {
          this.total = data.total;
          data = data.list;
          let number = (this.req.Index - 1) * this.req.Size + 1;
          data.forEach((item) => {
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
      getStudentType: async function() {
        let data = await this.$http.myGet(URL_BASE_INFO.GET_STUDENT_TYPE, '');
        if (data && data.length > 0) {
          this.types = data;
        } else {
          this.types = [];
        }
      },
      changeTime(time) {
        this.time = time;
      },
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        if (this.time && this.time.length != 0) {
          this.req.Begin报到时间 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.End报到时间 = formatDate(this.time[1], 'yyyy-MM-dd');
        } else {
          this.req.Begin报到时间 = '';
          this.req.End报到时间 = '';
        }
        this.list = [];
        this.getStudents();
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
        console.info(this.multipleSelection)
      },
      clickReport(value) {
        this.req.是否已报到 = value;
        this.onSearch();
      },
      getPlain(value) {
        if (this.req.是否已报到 == value) {
          return false;
        } else {
          return true;
        }
      },
      btnBatchReport(title, isAdd, item) {
        this.arr = [];
        this.names = '';
        if (this.multipleSelection.length == 0) {
          this.$message.error('请先勾选需要报到的学员！');
        } else {
          this.arr = [];
          let nameArr = [];
          this.multipleSelection.forEach((item) => {
            this.arr.push(item.编号);
            nameArr.push(item.姓名);
          });
          this.names = nameArr.join();
          this.title = title;
          this.isAdd = isAdd;
          this.item = item;
          this.isDialog = true;
          this.isDetails = false;
        }
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getStudents();
      },
      getClass(value) {
        if (value) {
          return 'state-success';
        } else {
          return 'state-error';
        }
      },
      addStudent(title, isAdd, item) {
        this.arr = [item.编号];
        this.title = title;
        this.isAdd = isAdd;
        this.item = item;
        this.isDialog = true;
        this.isDetails = false;
        this.names = item.姓名;
      },
      btnDetails(item) {
        this.item = item;
        this.title = '学员报到详情';
        this.isDialog = true;
        this.isDetails = true;
      },
      getMyEvent(val) {
        this.isDialog = val;
        this.multipleSelection = [];
        this.onSearch();
      },
      closeDialog() {
        this.isDialog = false;
      }
    }
  };
</script>
