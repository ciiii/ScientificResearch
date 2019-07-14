<template>
  <div class="details" v-if="isLoad">
    <el-tabs type="card">
      <el-tab-pane label="基本信息">
        <div class="item-box">
          <h5 class="title">轮转信息（{{form.学员姓名}}）</h5>
          <table class="mailTable">
            <tr>
              <th>学员姓名</th>
              <td>{{form.学员姓名}}</td>
              <th>带教老师</th>
              <td>{{form.带教老师姓名}}</td>
            </tr>
            <tr>
              <th>本院科室</th>
              <td>{{form.本院科室名称}}</td>
              <th>科室管理员</th>
              <td>{{form.科室管理员姓名}}</td>
            </tr>
            <tr>
              <th>教学本院策略</th>
              <td>{{form.教学本院策略名称}}</td>
              <th>状态</th>
              <td>
                <el-tag :type="getStates(form.状态)" size="small">{{form.状态}}</el-tag>
              </td>
            </tr>
            <tr>
              <th>计划入科日期</th>
              <td>{{form.计划入科日期|dataFormat('yyyy-MM-dd')}}</td>
              <th>计划出科日期</th>
              <td>{{form.计划出科日期|dataFormat('yyyy-MM-dd')}}</td>
            </tr>
            <tr>
              <th>实际入科日期</th>
              <td>{{form.实际入科日期|dataFormat('yyyy-MM-dd')}}</td>
              <th>实际出科日期</th>
              <td>{{form.实际出科日期|dataFormat('yyyy-MM-dd')}}</td>
            </tr>
          </table>
          <h5 class="title">请假信息</h5>
          <table class="mailTable">
            <tr>
              <th>创建人</th>
              <td>{{form.CreatorInfo}}</td>
              <th>创建人类型</th>
              <td>{{form.CreatorType}}</td>
            </tr>
            <tr>
              <th>请假开始日期</th>
              <td>{{form.请假开始日期|dataFormat('yyyy-MM-dd')}}</td>
              <th>请假天数</th>
              <td>{{form.请假天数}} 天</td>
            </tr>
            <tr>
              <th>请假事由</th>
              <td colspan="3">{{form.请假事由}}</td>
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
  import { URL_WORK_FLOW } from '@/assets/js/connect/ConSysUrl';
  import auditRecord from '@/components/workFlow/auditRecord';

  export default {
    name: 'leaveDetails',
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
      this.userName = this.item.学员姓名;
      this.getDetails(this.item.SourceId);
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent');
      },
      getDetails: async function(id) {
        let postData = {
          请假编号: id
        };
        let data = await this.$http.myGet(URL_WORK_FLOW.GET_LEAVE_DETAILS, postData);
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
