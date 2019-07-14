<template>
  <div class="app-container page-common page-addStudent">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)"><i
        class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <h5 class="title">基本信息：</h5>
    <table class="mailTable">
      <tr>
        <th>专业名称</th>
        <td>{{item.名称}}</td>
        <th>专业年份</th>
        <td>{{item.年份}}年</td>
      </tr>
      <tr>
        <th>最低培训时长</th>
        <td>{{item.最低培训时长}}</td>
        <th>标准代码</th>
        <td>{{item.标准代码}}</td>
      </tr>
      <tr>
        <th>是否国家标准</th>
        <td colspan="3">{{item.是否国家标准?'是':'否'}}</td>
      </tr>
    </table>
    <h5 class="title">学习要求及目标：</h5>
    <div class="tinymce-content" v-html="item.学习要求及目标"></div>
    <div slot="footer" class="dialog-footer">
      <el-button @click="$router.go(-1)">返回</el-button>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'MajorDetails',
    data() {
      return {
        item: {},
        isLoad: false
      }
    },
    mounted() {
      console.info(sessionStorage.getItem('item'))
      if (sessionStorage.getItem('item')) {
        this.item = JSON.parse(sessionStorage.getItem('item'))
        this.isLoad = true
      }
    },
    methods: {}
  }
</script>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/AddStudent.scss";
.mailTable{
  margin-bottom: 10px;
}

</style>
