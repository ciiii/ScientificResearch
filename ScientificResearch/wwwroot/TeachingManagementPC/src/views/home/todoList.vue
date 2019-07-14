<template>
  <div class="app-container page-common">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <h4 class="page-title" align="center">我的待办事宜</h4>
    <div class="filter-container">
      <div class="filter-item">
        创建人姓名
        <el-input v-model="req.LikeCreatorInfo" placeholder="请输入创建人姓名" style="width: 180px;" class="filter-item"
                  @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      </div>
      <div class="filter-item">
        事项类别
        <el-input v-model="req.LikeFlowTemplateName" placeholder="请输入事项类别" style="width: 180px;" class="filter-item"
                       @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      </div>

      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询</el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" stripe style="width: 100%;">
        <el-table-column align="center" label="序号" prop="number" width="80"></el-table-column>
        <el-table-column label="事项类别" prop="FlowTemplateName"></el-table-column>
        <el-table-column label="创建人" prop="CreatorInfo" align="center"></el-table-column>
        <el-table-column label="创建人类型" prop="CreatorType" align="center"></el-table-column>
        <el-table-column label="建立时间" align="center">
          <template slot-scope="scope">{{scope.row.CreateDateTime|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="审核进度" align="center">
          <template slot-scope="scope">
          <span :class="getStates(scope.row.LastStepStateName)">
           {{scope.row.StateName}}-{{scope.row.LastStepStateName}}
          </span>
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
  import { HTTP_URL_HOST, URL_HOME } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import examineCommon from '@/components/workFlow/auditCommon';
  import detailsBox from '@/components/detailsBox';

  export default {
    components: { examineCommon, detailsBox },
    data() {
      return {
        list: [],
        isLoad: false,
        isDialog: false,
        listLoading: false,
        isAdd: false,
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          LikeCreatorInfo:'',
          LikeFlowTemplateName:'',
        },
        total: 0,
        details: {},
        item: {},
        pageUrl: '',
        title: ''
      };
    },
    mounted() {
      this.listLoading = true;
      this.getList();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_HOME.GET_PAGING_TODO, this.req);
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
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        this.list = [];
        this.getList();
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
      clickMore() {
        this.$router.push({ path: '/todoList' });
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
<style lang="scss" scoped type="text/scss">
  .btn-back-box{
    margin-bottom: 0;
  }
  .page-title{
    margin-top: 0;
  }
</style>



