<template>
  <div class="app-container page-common page-addStudent" v-if="isLoad">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <p class="item-title">
      <i class="iconfont icon-teachingActivities"></i>
      <span>【{{item.教学活动类型名称}}】{{item.活动主题}}（主讲人：{{item.主讲人姓名}}）</span>
    </p>
    <h5 class="title"><i class="iconfont icon16"></i> 反馈列表：</h5>
    <div class="content" v-if="list.length>0">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" prop="number">
          <template slot-scope="scope">{{scope.$index+1}}</template>
        </el-table-column>
        <el-table-column label="学员姓名" align="center" prop="学员姓名" width="150"></el-table-column>
        <el-table-column label="建立时间" align="center" prop="建立时间" width="200">
          <template slot-scope="scope">{{scope.row.建立时间|dataFormat('yyyy-MM-dd')}}</template>
        </el-table-column>
        <el-table-column label="反馈内容" prop="反馈内容"></el-table-column>
        <el-table-column label="附件" prop="附件">
          <template slot-scope="scope">
            <div class="files">
              <a :href="getUrl(el)" download="" target="_blank" v-for="el in scope.row.files" :key="el"
                 v-if="scope.row.files.length>0"><i class="el-icon-document"></i> {{getName(el)}}</a>
            </div>
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
  import { HTTP_URL_HOST, URL_ACTIVITY } from '@/assets/js/connect/ConSysUrl';
  import { getUrl, getHtmlDocName } from '@/assets/js/Common';

  export default {
    name: 'activityFeedback',
    data() {
      return {
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          教学活动编号: null,
          学员编号: ''
        },
        listLoading: false,
        Loading: false,
        isLoad: false,
        total: 0,
        list: [],
        item: {}
      };
    },
    mounted() {
      if (sessionStorage.getItem('item')) {
        this.item = JSON.parse(sessionStorage.getItem('item'));
        this.req.教学活动编号 = this.item.编号;
        this.getActivityFeedback();
      }
    },
    methods: {
      getActivityFeedback: async function() {
        let data = await this.$http.myGet(URL_ACTIVITY.GET_PAGING_ACTIVITY_FEEDBACK, this.req);
        if (data && data.list.length > 0) {
          this.total = data.total;
          data = data.list;
          let number = (this.req.Index - 1) * this.req.Size + 1;
          data.forEach(function(item) {
            item.number = number;
            item.files = [];
            if (item.附件 && item.附件 != '') {
              item.files = item.附件.split(',');
            }
            number++;
          });
          this.list = data;
        } else {
          this.list = [];
        }
        this.listLoading = false;
        this.isLoad = true;
      },
      getUrl(item) {
        return getUrl(HTTP_URL_HOST + item);
      },
      getName(item) {
        return getHtmlDocName(item);
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getActivityFeedback();
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/AddStudent.scss";
  @import "@/assets/scss/Variable.scss";

  td {
    .files {
      a {
        color: $colorActive;
        margin-bottom: 5px;
      }

      a:hover {
        color: $loginColor;
      }
    }
  }
</style>
