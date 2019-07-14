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
    <h5 class="title"><i class="iconfont iconpingjiaguanli"></i> 评价列表：<span class="score">（标准总分：{{standardTotal}} 分，实际总分：{{actualTotal}} 分）</span></h5>
    <div class="content">
      <el-table class="tableone" v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" prop="number">
          <template slot-scope="scope">{{scope.$index+1}}</template>
        </el-table-column>
        <el-table-column label="评价项目" prop="名称"></el-table-column>
        <el-table-column label="标准分（分）" align="center" prop="标准分" width="150"></el-table-column>
        <el-table-column label="平均得分（分）" align="center" prop="平均得分" width="150"></el-table-column>
        <el-table-column label="评价人数（人）" align="center" prop="评价人数" width="150"></el-table-column>
        <el-table-column label="评价说明" prop="说明"></el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
  import { HTTP_URL_HOST, URL_ACTIVITY } from '@/assets/js/connect/ConSysUrl';

  export default {
    name: 'activityEvaluate',
    data() {
      return {
        listLoading: false,
        Loading: false,
        isLoad: false,
        list: [],
        item: {},
        standardTotal: 0,
        actualTotal: 0
      };
    },
    mounted() {
      if (sessionStorage.getItem('item')) {
        this.item = JSON.parse(sessionStorage.getItem('item'));
        this.getActivityEvaluate(this.item);
      }
    },
    methods: {
      getActivityEvaluate: async function(item) {
        let postData = {
          教学活动类型编号: item.教学活动类型编号,
          教学活动编号: item.编号

        };
        let data = await this.$http.myGet(URL_ACTIVITY.GET_ACTIVITY_EVALUATE, postData);
        if (data && data.length > 0) {
          data.forEach((item) => {
            this.standardTotal += item.标准分;
            this.actualTotal += item.平均得分;
          });
          this.list = data;
        }
        this.listLoading = false;
        this.isLoad = true;
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/AddStudent.scss";
  .score{
    color: #f60;
    font-size: 14px;
  }
</style>
