<template>
  <div class="details">
    <el-form label-width="120px" size="small">
      <div class="item-box">
        <h5 class="title">基本信息</h5>
        <table class="mailTable">
          <tr>
            <th>文件名称</th>
            <td class="name">{{item.文件名称}}</td>
          </tr>
          <tr>
            <th>文件类型</th>
            <td>{{item.文件类型}}</td>
          </tr>
          <tr>
            <th>上传人</th>
            <td>{{item.上传人姓名}}</td>
          </tr>
          <tr>
            <th>上传人部门</th>
            <td>{{item.上传人部门名称}}</td>
          </tr>
          <tr>
            <th>是否启用</th>
            <td>{{item.是否启用?'是':'否'}}</td>
          </tr>
          <tr>
            <th>建立时间</th>
            <td>{{item.建立时间|dataFormat('yyyy-MM-dd')}}</td>
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
        <h5 class="title">文件说明</h5>
        <!--<div class="tinymce-content" v-html="form.通知内容?form.通知内容:'暂无'"></div>-->
        <el-input type="textarea" v-model="item.备注"/>

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
      if (this.item && this.item.文件路径 != '') {
        this.files = this.item.文件路径.split(',');
      }
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
