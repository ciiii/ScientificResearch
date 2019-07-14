<template>
  <div class="details">
    <el-form label-width="120px" size="small">
      <div class="item-box">
        <h5 class="title">基本信息</h5>
        <table class="mailTable">
          <tr>
            <th>学员姓名</th>
            <td class="name">{{item.学员姓名}}</td>
          </tr>
          <tr>
            <th>本院科室</th>
            <td>{{item.本院科室名称}}</td>
          </tr>
          <tr>
            <th>状态</th>
            <td>
              <el-tag :type="getStates(item.状态)" size="small">{{item.状态}}</el-tag>
            </td>
          </tr>
          <tr>
            <th>带教老师</th>
            <td>{{item.带教老师姓名}}</td>
          </tr>
          <tr>
            <th>处理类别</th>
            <td>{{item.处理类别}}</td>
          </tr>
          <tr>
            <th>处理日期</th>
            <td>{{item.处理日期|dataFormat('yyyy-MM-dd')}}</td>
          </tr>
        </table>
        <h5 class="title">文件附件</h5>
        <div class="files-list">
          <ul>
            <li v-for="item in files" :key="item" v-if="files.length>0">
              <a :href="getUrl(item)" download="" target="_blank"><i class="el-icon-document"></i> {{getName(item)}}</a>
            </li>
            <li v-if="files.length=0">无</li>
          </ul>
        </div>
        <h5 class="title">处理原因</h5>
        <el-input type="textarea" v-model="item.处理原因" readonly/>
        <h5 class="title">处理意见</h5>
        <el-input type="textarea" v-model="item.处理意见" readonly/>
      </div>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">关 闭</el-button>
    </div>
  </div>
</template>

<script>
  import { HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
  import { getUrl, getHtmlDocName } from '@/assets/js/Common';

  export default {
    name: 'downloadDetails',
    props: ['item'],
    data() {
      return {
        files: []
      };
    },
    mounted() {
      if (this.item && this.item.附件 != '') {
        this.files = this.item.附件.split(',');
      }
      console.info(this.item);
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false);
      },
      getUrl(item) {
        return getUrl(HTTP_URL_HOST + item);
      },
      getName(item) {
        return getHtmlDocName(item);
      },
      getStates(state) {
        switch (state) {
          case '未入科':
            return 'warning';
          case '在科':
            return 'success';
          case '已出科':
            return 'primary';
        }
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
