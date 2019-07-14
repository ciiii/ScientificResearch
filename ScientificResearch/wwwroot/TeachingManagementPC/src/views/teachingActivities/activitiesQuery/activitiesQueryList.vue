<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">教学活动查询</h4>
    <div class="filter-container">
      <el-input v-model="req.Like活动主题" placeholder="请输入活动主题" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-input v-model="req.Like主讲人姓名" placeholder="请输入主讲人姓名" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        活动分类
        <el-select v-model="req.教学活动类型编号" placeholder="请选择" class="filter-item" @change="onSearch">
          <el-option label="全部" value=""></el-option>
          <el-option v-for="item in types" :key="item.编号" :label="item.名称" :value="item.编号"></el-option>
        </el-select>
      </div>
      <div class="filter-item">
        <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" prop="number"></el-table-column>
        <el-table-column label="活动主题">
          <template slot-scope="scope">
            <a @click="btnDetails(scope.row)" class="td-title" href="javascript:;">{{scope.row.活动主题}}</a>
          </template>
        </el-table-column>
        <el-table-column label="活动类型" align="center" prop="教学活动类型名称" width="120"></el-table-column>
        <el-table-column label="主讲人" align="center" prop="主讲人姓名"></el-table-column>
        <el-table-column label="主讲人职称" align="center" prop="主讲人职称"></el-table-column>
        <el-table-column label="开始时间" align="center" width="130">
          <template slot-scope="scope">{{scope.row.活动开始时间|dataFormat('yyyy-MM-dd hh:mm')}}</template>
        </el-table-column>
        <el-table-column label="结束时间" align="center" width="130">
          <template slot-scope="scope">{{scope.row.活动结束时间|dataFormat('yyyy-MM-dd hh:mm')}}</template>
        </el-table-column>
        <el-table-column label="活动地点" property="活动地点" align="center"></el-table-column>
        <el-table-column label="操作" align="center" width="200">
          <template slot-scope="scope">
            <el-button size="mini" type="danger" plain @click="btnEvaluate(scope.row)">评价</el-button>
            <el-button size="mini" type="warning" plain @click="btnFeedback(scope.row)">反馈</el-button>
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
  </div>
</template>

<script>
  import { URL_ACTIVITY, URL_SETTING, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';

  export default {
    components: { datePicker },
    data() {
      return {
        list: [],
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          教学活动类型编号: null,
          Like活动主题: '',
          Like主讲人姓名: '',
          Begin活动开始时间: '',
          End活动开始时间: ''
        },
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        types: [],
        typeName: '小讲课',
        total: 0,
        isLoad: false,
        typeContent: '',
        time: [],
        placeholder: {
          start: '活动开始时间',
          end: '活动结束时间'
        }
      };
    },
    mounted() {
      this.getTypes();
      this.getList();

    },
    methods: {
      getTypes: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TEACHING_ACTIVITIES_CLASSIFY, '');
        if (data && data.length > 0) {
          this.types = data.reverse();
        }
      },
      getList: async function() {
        let data = await this.$http.myGet(URL_ACTIVITY.GET_PAGING_ACTIVITY, this.req);
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
        }
        this.listLoading = false;
        this.isLoad = true;
      },
      changeTime(time) {
        this.time = time;
      },
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        if (this.time && this.time.length != 0) {
          this.req.Begin活动开始时间 = formatDate(this.time[0], 'yyyy-MM-dd');
          this.req.End活动开始时间 = formatDate(this.time[1], 'yyyy-MM-dd');
        } else {
          this.req.Begin活动开始时间 = '';
          this.req.End活动开始时间 = '';
        }
        this.list = [];
        this.getList();
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getList();
      },
      btnDetails(item) {
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({ path: '/activityDetails' });
      },
      btnEvaluate(item) {
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({ path: '/activityEvaluate' });
      },
      btnFeedback(item) {
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({ path: '/activityFeedback' });
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  .el-cascader, .el-cascader-menu {
    width: 300px;
  }

</style>
