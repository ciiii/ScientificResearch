<template>
  <div class="app-container page-common page-addStudent">
    <span class="item-title"><i class="iconfont iconkeshikucunguanli"></i><span> {{item.教学专业名称}} -- {{item.科室名称}}</span></span>
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)"><i
        class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <h5 class="title">基本信息：</h5>
    <table class="mailTable">
      <tr>
        <th>科室名称</th>
        <td colspan="5">{{item.科室名称}}</td>
      </tr>
      <tr>
        <th>培训专业</th>
        <td>{{item.教学专业名称}}</td>
        <th>最低培训时长</th>
        <td>{{item.最低培训时长}} 周</td>
        <th>最低管床数量</th>
        <td>{{item.最低管床数量}} 例</td>
      </tr>
      <tr>
        <th>其中全程管理</th>
        <td>{{item.最低全程管理数量}} 例</td>
        <th>门诊要求</th>
        <td>{{item.门诊病例数}} 例</td>
        <th>病例要求</th>
        <td>{{item.疾病病例数}} 例</td>
      </tr>
      <tr>
        <th>技能要求</th>
        <td>{{item.技能病例数}} 例</td>
        <th>住院病例数</th>
        <td>{{item.住院病例数}} 例</td>
        <th>医技病例数</th>
        <td>{{item.医技病例数}} 例</td>
      </tr>
    </table>
    <h5 class="title">科室要求：</h5>
    <div class="tinymce-content" v-html="item.科室要求?item.科室要求:'暂无'"></div>
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
      };
    },
    mounted() {
      console.info(sessionStorage.getItem('item'));
      if (sessionStorage.getItem('item')) {
        this.item = JSON.parse(sessionStorage.getItem('item'));
        this.isLoad = true;
      }
    },
    methods: {}
  };
</script>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/AddStudent.scss";

  .mailTable {
    margin-bottom: 10px;
  }

  .item-title {
    float: left;
    padding-top: 8px;
    font-size: 18px;

    i {
      font-size: 20px;
    }
  }
</style>
