<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">轮转手册审核</h4>
    <div class="filter-container">
      <el-input v-model="req.Like学员姓名" placeholder="请输入学员姓名" style="width: 180px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <div class="filter-item">
        审核状态
        <el-select v-model="req.StateName" placeholder="请选择" @change="onSearch" style="width: 150px;">
          <el-option label="全部" :value="''"></el-option>
          <el-option :label="item" :value="item" v-for="item in states" :key="item"></el-option>
        </el-select>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" stripe border>
        <el-table-column align="center" label="序号" prop="number" width="80"></el-table-column>
        <el-table-column label="姓名">
          <template slot-scope="scope">
            <span class="logo-img">
              <img v-if="scope.row.头像路径" :src="http+scope.row.头像路径" alt="">
              <img v-else src="@/assets/images/user.jpg" alt="">
            </span>
            <span class="title">{{scope.row.学员姓名}}</span>
          </template>
        </el-table-column>
        <el-table-column label="带教老师" prop="带教老师姓名" align="center"></el-table-column>
        <el-table-column label="本院科室" prop="本院科室名称" align="center"></el-table-column>
        <el-table-column label="科室管理员" prop="科室管理员姓名" align="center"></el-table-column>
        <el-table-column label="轮转手册类型" prop="教学轮转手册类型名称" align="center"></el-table-column>
        <el-table-column label="建立时间" align="center">
          <template slot-scope="scope">{{scope.row.建立时间|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="审核进度" align="center">
          <template slot-scope="scope">
            {{scope.row.StateName}}-{{scope.row.LastStepStateName}}
          </template>
        </el-table-column>
        <el-table-column label="当前步骤" align="center">
          <template slot-scope="scope">
             <span :class="getStates(scope.row.LastStepStateName)">
              {{scope.row.LastStepTemplateName}}-{{scope.row.LastStepStateName}}
            </span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="200">
          <template slot-scope="scope">
            <el-tooltip class="item" effect="dark" :content="scope.row.LastStepTemplateName" placement="top-start">
              <el-button size="mini" :type="getType(scope.row.LastStepTemplateName)" plain
                         @click="btnOperate(scope.row)" v-if="scope.row.IsCanOperate">
                <i :class="'iconfont '+ scope.row.LastStepTemplateStyle"></i>
              </el-button>
            </el-tooltip>
            <el-button size="mini" type="primary" plain @click="btnDetails(scope.row)">
              <i class="iconfont iconwenjian1"></i> 详情
            </el-button>
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
               class="big-dialog common-dialog">
      <component ref="child" :is="pageUrl" @myEvent="myEvent" :item="item" :isAdd="isAdd" @closeDialog="closeDialog"/>
    </el-dialog>
  </div>
</template>

<script>
  import { HTTP_URL_HOST, URL_WORK_FLOW, WORK_FLOW_STATE, URL_ORGANIZATION } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import examineCommon from '@/components/workFlow/auditCommon';
  import detailsBox from '@/components/detailsBox';

  export default {
    components: { examineCommon, detailsBox },
    data() {
      return {
        req: {
          Index: 1,
          Size: 13,
          OrderType: true,
          Like学员姓名: '',
          StateName: ''
        },
        list: [],
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        isLoad: false,
        total: 0,
        title: '',
        states: WORK_FLOW_STATE,
        http: HTTP_URL_HOST,
        details: {},
        pageUrl: ''
      };
    },
    created() {
      this.listLoading = true;
      this.getList();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_WORK_FLOW.GET_PAGING_ROTATION_APPLY, this.req);
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
      getType(type) {
        if (type.indexOf('申请') != -1) {
          return 'success';
        }
        if (type.indexOf('审核') != -1) {
          return 'danger';
        }
        if (type.indexOf('提交') != -1) {
          return 'success';
        }
      },
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        this.list = [];
        this.getList();
      },
      getStates(state) {
        switch (state) {
          case '待完善':
            return 'state-primary';
          case '待医审核':
            return 'state-warning';
          case '待审核':
            return 'state-warning';
          case '审核通过':
            return 'state-success';
          case '审核不通过':
            return 'state-error';
          case '作废':
            return 'state-error';
        }
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getList();
      },
      btnOperate(item) {
        this.item = item;
        this.title = item.LastStepTemplateName;
        this.pageUrl = item.LastEditStepComponentName;
        this.isDialog = true;
      },
      btnDetails(item) {
        this.item = item;
        this.title = '查看详情';
        this.pageUrl = detailsBox;
        this.isDialog = true;
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



