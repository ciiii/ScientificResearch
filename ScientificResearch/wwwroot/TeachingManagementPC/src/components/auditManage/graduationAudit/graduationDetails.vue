<template>
  <div class="details" v-if="isLoad">
    <el-tabs type="card">
      <el-tab-pane label="基本信息">
        <div class="item-box">
          <h5 class="title">学员信息（{{form.姓名}}）</h5>
          <table class="mailTable">
            <tr>
              <th>学员姓名</th>
              <td>{{form.姓名}}</td>
              <th>工号</th>
              <td>{{form.工号}}</td>
            </tr>
            <tr>
              <th>往届应届</th>
              <td>{{form.往届应届}}</td>
              <th>培训年届(年限)</th>
              <td>{{form.学员培训年界}}（ {{form.学员培训年限}} 年）</td>
            </tr>
            <tr>
              <th>学员类型</th>
              <td>{{form.学员类型名称}}</td>
              <th>教学专业</th>
              <td>{{form.专业名称}}</td>
            </tr>
            <tr>
              <th>教学本院策略</th>
              <td>{{form.教学本院策略名称}}</td>
              <th>报到时间</th>
              <td>{{form.报到时间|dataFormat('yyyy-MM-dd')}}</td>
            </tr>
            <tr>
              <th>计划开始培训日期</th>
              <td>{{form.计划开始培训日期|dataFormat('yyyy-MM-dd')}}</td>
              <th>计划结束培训日期</th>
              <td>{{form.计划结束培训日期|dataFormat('yyyy-MM-dd')}}</td>
            </tr>
            <tr>
              <th>实际开始培训日期</th>
              <td>{{form.实际开始培训日期|dataFormat('yyyy-MM-dd')}}</td>
              <th>实际结束培训日期</th>
              <td>{{form.实际结束培训日期|dataFormat('yyyy-MM-dd')}}</td>
            </tr>
            <tr>
              <th>证书</th>
              <td>{{form.证书}}</td>
              <th>状态</th>
              <td>
                <el-tag :type="getStates(form.状态)" size="small">{{form.状态}}</el-tag>
              </td>
            </tr>
            <tr>
              <th>送培方式</th>
              <td>{{form.送培方式}}</td>
              <th>建立时间</th>
              <td>{{form.建立时间|dataFormat('yyyy-MM-dd')}}</td>
            </tr>
          </table>
          <h5 class="title">结业信息</h5>
          <table class="mailTable">
            <tr>
              <th>创建人</th>
              <td>{{form.CreatorInfo}}</td>
              <th>创建人类型</th>
              <td>{{form.CreatorType}}</td>
            </tr>
            <tr>
              <th>申请结业日期</th>
              <td>{{form.申请结业日期|dataFormat('yyyy-MM-dd')}}</td>
              <th>结业日期</th>
              <td>{{form.结业日期|dataFormat('yyyy-MM-dd')}}</td>
            </tr>
            <tr>
              <th>说明</th>
              <td colspan="3">{{form.说明}}</td>
            </tr>
          </table>
        </div>
      </el-tab-pane>
      <el-tab-pane label="审核记录">
        <auditRecord :flowId="flowId" :userName="userName"></auditRecord>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
  import { HTTP_URL_HOST, URL_WORK_FLOW } from '@/assets/js/connect/ConSysUrl';
  import { getUrl, getHtmlDocName } from '@/assets/js/Common';
  import auditRecord from '@/components/workFlow/auditRecord';

  export default {
    name: 'graduationDetails',
    components: { auditRecord },
    props: ['item'],
    data() {
      return {
        isLoad: false,
        flowId: '',
        userName: '',
        form: {}
      };
    },
    mounted() {
      this.flowId = this.item.FlowId;
      this.userName = this.item.姓名;
      this.getDetails(this.item.SourceId);
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent');
      },
      getDetails: async function(id) {
        let postData = {
          结业编号: id
        };
        let data = await this.$http.myGet(URL_WORK_FLOW.GET_GRADUATION_DETAILS, postData);
        if (data) {
          this.form = data;
        }
        this.isLoad = true;
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
