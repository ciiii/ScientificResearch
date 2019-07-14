<template>
  <div v-if="isLoad" style="height: 480px" class="page-common">
    <h4 class="item-title">
      <i class="iconfont iconwenjian--copy" style="color: #4ec4f7"></i> 待办事宜
      <a class="more" href="javascript:;" @click="clickMore" v-if="list.length>6">
        更多 <i class="iconfont icongengduo_"></i>
      </a>
    </h4>
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
          Size: 7,
          OrderType: false
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
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/Variable.scss";

  .el-button {
    padding: 7px 10px !important;
  }

  .item-title {
    font-size: 18px;
    color: #4d4d4d;
    margin: 5px 0;
    padding-left: 5px;
    position: relative;

    i {
      font-size: 20px;
      margin-right: 5px;
    }

    .more {
      position: absolute;
      right: 20px;
      top: 10px;
      font-size: 14px;
      color: #888;

      i {
        color: #888;
        font-size: 14px;
      }

      &:hover {
        color: $colorActive;

        i {
          color: $colorActive;;
        }
      }
    }
  }

  .paging {
    position: absolute;
    right: 0;
    bottom: 23px;
  }
</style>
