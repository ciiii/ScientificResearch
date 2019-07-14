<template>
  <div class="app-container page-common page-addStudent" v-if="isLoad">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <p class="item-title">
      <span class="title"><span class="type">{{form.通知类型}}</span>{{form.通知名称}}</span>
    </p>
    <h5 class="title">基本信息：</h5>
    <table class="mailTable">
      <tr>
        <th>通知名称</th>
        <td colspan="5">{{form.通知名称}}</td>
      </tr>
      <tr>
        <th>通知类型</th>
        <td>{{form.通知类型}}</td>
        <th>发布人</th>
        <td>{{form.发送人姓名}}</td>
        <th>发布人部门</th>
        <td>{{form.发送人部门名称}}</td>
      </tr>
      <tr>
        <th>是否启用</th>
        <td>{{form.是否启用?'启用':'禁用'}}</td>
        <th>发布时间</th>
        <td>{{form.建立时间|dataFormat('yyyy-MM-dd')}}</td>
        <th>关闭时间</th>
        <td>{{form.关闭时间|dataFormat('yyyy-MM-dd')}}</td>
      </tr>
      <tr>
        <th>是否必读</th>
        <td>{{form.是否必读?'是':'否'}}</td>
        <th>接收类型</th>
        <td>{{peopleType}}</td>
        <th>已接收人数</th>
        <td>{{form.已接收人数}} 人</td>
      </tr>
      <tr>
        <th>接收者</th>
        <td colspan="5">{{peoples}}</td>
      </tr>
    </table>
    <h5 class="title">相关文件：</h5>
    <div class="files-list">
      <ul>
        <li v-for="item in files" :key="item" v-if="files.length>0">
          <a :href="getUrl(item)" download="" target="_blank"><i class="el-icon-document"></i> {{getName(item)}}</a>
        </li>
        <li v-if="files.length=0">无</li>
      </ul>
    </div>
    <h5 class="title">通知内容：</h5>
    <div class="tinymce-content" v-html="form.通知内容?form.通知内容:'暂无'"></div>
    <div slot="footer" class="dialog-footer">
      <el-button @click="$router.go(-1)">返回</el-button>
    </div>
  </div>
</template>

<script>
  import { HTTP_URL_HOST, URL_OFFICE } from '@/assets/js/connect/ConSysUrl';
  import { getHtmlDocName, getUrl } from '@/assets/js/Common';

  export default {
    name: 'NoticeDetails',
    data() {
      return {
        item: {},
        isLoad: false,
        peopleType: '',
        form: {},
        List: [],
        files: [],
        peoples: ''
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
          编号: id
        };
        let data = await this.$http.myGet(URL_OFFICE.GET_NOTICE_DETAILS, postData);
        if (data && data.通知公告) {
          this.form = data.通知公告;
          this.List = data.接收条件;
          if (this.form && this.form.相关文件路径 != '') {
            this.files = this.form.相关文件路径.split(',');
          }

          if (this.List && this.List.length > 0) {
            this.peopleType = this.List[0].接收者类型;
            let arr = [];
            this.List.forEach((item) => {
              arr.push(item.接收者名称);
            });
            this.peoples = arr.join();
          }
          this.isLoad = true;
        }
      }
    }
  };
</script>
<style type="text/scss" lang="scss">
  .tinymce-content {
    font-size: 13px !important;
  }

</style>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/AddStudent.scss";

  .item-title {
    .title {
      display: inline-block;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      flex: 1;
      height: 35px;
      line-height: 35px;

      .type {
        background: url("../../../assets/images/type-bg.png");
        background-size: 97px 35px;
        display: inline-block;
        width: 97px;
        height: 35px;
        color: #fff;
        font-size: 14px;
        padding-left: 20px;
        margin-right: 5px;
      }
    }
  }
</style>
