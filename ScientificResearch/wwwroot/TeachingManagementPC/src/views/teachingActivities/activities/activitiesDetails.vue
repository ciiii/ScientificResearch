<template>
  <div class="app-container page-common page-addStudent" v-if="isLoad">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <p class="item-title"><i class="iconfont icon-notice"></i><span>【{{form.教学活动.教学活动类型名称}}】{{form.教学活动.活动主题}}</span>
    </p>
    <h5 class="title">基本信息：</h5>
    <table class="mailTable">
      <tr>
        <th>活动主题</th>
        <td colspan="5">{{form.教学活动.活动主题}}</td>
      </tr>
      <tr>
        <th>教学活动类型</th>
        <td>{{form.教学活动.教学活动类型名称}}</td>
        <th>主讲人</th>
        <td>{{form.教学活动.主讲人姓名}}</td>
        <th>主讲人职称</th>
        <td>{{form.教学活动.主讲人职称}}</td>
      </tr>
      <tr>
        <th>教学病例</th>
        <td>{{form.教学活动.教学病例}}</td>
        <th>活动开始时间</th>
        <td>{{form.教学活动.活动开始时间}}</td>
        <th>活动结束时间</th>
        <td>{{form.教学活动.活动结束时间|dataFormat('yyyy-MM-dd')}}</td>
      </tr>
      <tr>
        <th>建立时间</th>
        <td>{{form.教学活动.建立时间|dataFormat('yyyy-MM-dd')}}</td>
        <th>活动地点</th>
        <td colspan="3">{{form.教学活动.活动地点}}</td>
      </tr>
      <tr>
        <th>反馈数量</th>
        <td>{{form.教学活动.反馈数量}} 个</td>
        <th>评价次数</th>
        <td>{{form.教学活动.评价次数}} 次</td>
        <th>备注</th>
        <td>{{form.教学活动.备注}}</td>
      </tr>
      <tr>
        <th>可参与者</th>
        <td colspan="5">{{studentNames}}</td>
      </tr>
    </table>
    <h5 class="title">病人信息：</h5>
    <table class="mailTable">
      <tr>
        <th>病人姓名</th>
        <td>{{form.教学活动.病人姓名}}</td>
        <th>病人编号</th>
        <td>{{form.教学活动.病人编号}}</td>
        <th>病人性别</th>
        <td>{{form.教学活动.病人性别}}</td>
      </tr>
      <tr>
        <th>病人出生日期</th>
        <td>{{form.教学活动.病人出生日期|dataFormat('yyyy-MM-dd')}}</td>
        <th>病人住院号</th>
        <td>{{form.教学活动.病人住院号}}</td>
        <th>病人住院床号</th>
        <td>{{form.教学活动.病人住院床号}}</td>
      </tr>
      <tr>
        <th>病人入院日期</th>
        <td>{{form.教学活动.病人入院日期|dataFormat('yyyy-MM-dd')}}</td>
        <th>病人出院日期</th>
        <td colspan="3">{{form.教学活动.病人出院日期|dataFormat('yyyy-MM-dd')}}</td>
      </tr>
      <tr>
        <th>病人主要诊断</th>
        <td colspan="5">{{form.教学活动.病人主要诊断}}</td>
      </tr>
      <tr>
        <th>病人次要诊断</th>
        <td colspan="5">{{form.教学活动.病人次要诊断}}</td>
      </tr>
    </table>
    <h5 class="title">附件：</h5>
    <div class="files-list">
      <ul>
        <li v-for="item in files" :key="item" v-if="files.length>0">
          <a :href="getUrl(item)" download="" target="_blank"><i class="el-icon-document"></i> {{getName(item)}}</a>
        </li>
        <li v-if="files.length=0">无</li>
      </ul>
    </div>
    <h5 class="title">活动内容：</h5>
    <div class="tinymce-content" v-html="form.教学活动.活动内容?form.教学活动.活动内容:'暂无'"></div>
    <div slot="footer" class="dialog-footer">
      <el-button @click="$router.go(-1)">返回</el-button>
    </div>
  </div>
</template>

<script>
  import { HTTP_URL_HOST, URL_ACTIVITY } from '@/assets/js/connect/ConSysUrl';
  import { getHtmlDocName, getUrl } from '@/assets/js/Common';

  export default {
    name: 'activitiesDetails',
    data() {
      return {
        isLoad: false,
        form: {},
        files: [],
        studentNames: ''
      };
    },
    mounted() {
      if (sessionStorage.getItem('item')) {
        this.item = JSON.parse(sessionStorage.getItem('item'));
        this.getDetails(this.item.编号);
      }
    },
    methods: {
      getUrl(item) {
        return getUrl(HTTP_URL_HOST + item);
      },
      getName(item) {
        return getHtmlDocName(item);
      },
      getDetails: async function(id) {
        let postData = {
          教学活动编号: id
        };
        let data = await this.$http.myGet(URL_ACTIVITY.GET_ACTIVITY_DETAILS, postData);
        if (data && data.教学活动) {
          this.form = data;
          if (this.form && this.form.教学活动.附件 != '') {
            this.files = this.form.教学活动.附件.split(',');
          }
          if (this.form.可参与者 && this.form.可参与者.length > 0) {
            let arr = [];
            this.form.可参与者.forEach(function(item) {
              arr.push(item.学员姓名);
            });
            this.studentNames = arr.join();
          }
        }
        this.isLoad = true;
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/AddStudent.scss";
</style>
