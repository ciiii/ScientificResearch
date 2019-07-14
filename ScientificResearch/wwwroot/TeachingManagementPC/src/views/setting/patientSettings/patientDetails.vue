<template>
  <div class="details">
    <el-form label-width="120px" size="small" v-if="isLoad">
      <div class="item-box">
        <h5 class="title">基本信息--{{item.姓名}}</h5>
        <table class="mailTable">
          <tr>
            <th>姓名</th>
            <td class="name">{{item.姓名}}</td>
            <th>性别</th>
            <td>{{item.性别}}</td>
          </tr>
          <tr>
            <th>性别</th>
            <td>{{item.性别}}</td>
            <th>出生日期</th>
            <td>{{item.出生日期|dataFormat('yyyy-MM-dd')}}</td>
          </tr>
          <tr>
            <th>住院号</th>
            <td>{{item.住院号}}</td>
            <th>住院床号</th>
            <td>{{item.住院床号}}</td>
          </tr>
          <tr>
            <th>入院日期</th>
            <td>{{item.入院日期|dataFormat('yyyy-MM-dd')}}</td>
            <th>出院日期</th>
            <td>{{item.出院日期|dataFormat('yyyy-MM-dd')}}</td>
          </tr>
          <tr>
            <th>主要诊断</th>
            <td colspan="3">{{item.主要诊断}}</td>
          </tr>
          <tr>
            <th>次要诊断</th>
            <td colspan="3">{{item.次要诊断}}</td>
          </tr>
          <tr>
            <th>备注</th>
            <td colspan="3">{{item.备注}}</td>
          </tr>
        </table>
      </div>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">关 闭</el-button>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'patientDetails',
    props: ['item'],
    data() {
      return {
        isLoad: false
      };
    },
    mounted() {
      this.isLoad = true;
      console.info(this.item);
    },
    methods: {
      cancelHandler() {
        this.$emit('myClosed', false);
      }
    }
  };
</script>

<style type="text/scss" lang="scss" scoped>

  .el-form-item {
    float: none !important;
    width: 100% !important;
  }

  .el-form {
    height: auto;
  }
</style>
