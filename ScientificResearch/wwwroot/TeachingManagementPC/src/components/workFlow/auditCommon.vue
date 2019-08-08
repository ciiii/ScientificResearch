<template>
  <div class="details shenhe-box" v-if="isLoad">
    <div class="details-content">
      <component :is="pageUrl" :item="item"/>
    </div>
    <div class="item-box">
      <h5 class="title">审核</h5>
      <el-form label-width="120px" size="small">
        <el-form-item label="说明">
          <el-input v-model="form.Remark" type="textarea"></el-input>
        </el-form-item>
      </el-form>
    </div>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler" size="small">返 回</el-button>
      <el-button type="success" @click="btnPass" size="small">通 过</el-button>
      <!-- <el-button type="warning" @click="btnNoPass" size="small">不通过</el-button>
      <el-button type="danger" @click="btnStop" size="small">作 废</el-button> -->
     
      <el-button type="danger" @click="btnStop" size="small">不通过</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_WORK_FLOW } from '@/assets/js/connect/ConSysUrl';
  import { _debounce } from '@/assets/js/Common';
  import retireTrainingDetails from '@/components/auditManage/retireTraining/retireTrainingDetails';
  import leaveDetails from '@/components/auditManage/leaveAudit/leaveDetails';
  import outDepartmentDetails from '@/components/auditManage/outDepartment/outDepartmentDetails';
  import rotationDetails from '@/components/auditManage/rotationAudit/rotationDetails';
  import graduationDetails from '@/components/auditManage/graduationAudit/graduationDetails';

  export default {
    name: 'examineCommon',
    props: ['item'],
    components: { retireTrainingDetails, leaveDetails, outDepartmentDetails, rotationDetails, graduationDetails },
    data() {
      return {
        form: {
          StepId: 0,
          IsHold: false,
          Remark: '',
          Data: 0
        },
        type: [],
        isLoad: false,
        pageUrl: ''
      };
    },
    mounted() {
      this.type = this.item.FlowTemplateName;
      this.form.StepId = this.item.LastStepId;
      this.form.Data = this.item.学员编号;
      this.isLoad = true;
      this.pageUrl = this.item.LastViewStepComponentName;
    },
    methods: {
      btnPass() {
        this.getTypeUrl(this.type, 0);
      },
      btnNoPass() {
        this.getTypeUrl(this.type, 1);
      },
      btnStop() {
        this.getTypeUrl(this.type, 2);
      },
      getTypeUrl(type, state) {
        console.info(type);
        let url = '';
        switch (type) {
          case '教学退培申请':
            switch (state) {
              case 0:
                url = URL_WORK_FLOW.POST_PASS_STUDENT_EXIT;
                break;
              case 1:
                url = URL_WORK_FLOW.POST_NO_PASS_STUDENT_EXIT;
                break;
              case 2:
                url = URL_WORK_FLOW.POST_STOP_STUDENT_EXIT;
                break;
            }
            break;
          case '教学请假申请':
            switch (state) {
              case 0:
                url = URL_WORK_FLOW.POST_PASS_LEAVE_APPLY;
                break;
              case 1:
                url = URL_WORK_FLOW.POST_NO_PASS_LEAVE_APPLY;
                break;
              case 2:
                url = URL_WORK_FLOW.POST_STOP_LEAVE_APPLY;
                break;
            }
            break;
          case '轮转登记手册':
            switch (state) {
              case 0:
                url = URL_WORK_FLOW.POST_PASS_ROTATION_APPLY;
                break;
              case 1:
                url = URL_WORK_FLOW.POST_NO_PASS_ROTATION_APPLY;
                break;
              case 2:
                url = URL_WORK_FLOW.POST_STOP_ROTATION_APPLY;
                break;
            }
            break;
          case '教学出科申请':
            switch (state) {
              case 0:
                url = URL_WORK_FLOW.POST_PASS_OUT_DEPARTMENT;
                break;
              case 1:
                url = URL_WORK_FLOW.POST_NO_PASS_OUT_DEPARTMENT;
                break;
              case 2:
                url = URL_WORK_FLOW.POST_STOP_OUT_DEPARTMENT;
                break;
            }
            break;
          case '教学结业申请':
            switch (state) {
              case 0:
                url = URL_WORK_FLOW.POST_PASS_GRADUATION_APPLY;
                break;
              case 1:
                url = URL_WORK_FLOW.POST_NO_PASS_GRADUATION_APPLY;
                break;
              case 2:
                url = URL_WORK_FLOW.POST_STOP_GRADUATION_APPLY;
                break;
            }
            break;
          case '教学活动反馈审核':
            switch (state) {
              case 0:
                url = '';
                break;
              case 1:
                url = '';
                break;
              case 2:
                url = '';
                break;
            }
            break;
        }
        if (state != 0) {
          delete this.form.Data;
        }
        console.info(url);
        this.confirmHandler(url);
      },
      confirmHandler: _debounce(async function(url) {
        await this.$http.myPost(url, this.form);
        this.$message.success('提交成功！');
        this.$emit('myEvent', false);

      }, 300),
      cancelHandler() {
        this.$emit('closeDialog', false);
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>

  .el-form-item {
    float: none !important;
    width: 100% !important;
  }

  .tinymce {
    padding-right: 10px;
  }

  .el-form {
    height: auto;
  }
</style>
