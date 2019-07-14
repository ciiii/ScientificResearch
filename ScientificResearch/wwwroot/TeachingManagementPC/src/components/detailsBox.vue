<template>
  <div class="details" v-if="isLoad">
    <div class="content-box">
      <component :is="pageUrl" :item="item"/>
    </div>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">返 回</el-button>
    </div>
  </div>
</template>

<script>
  import retireTrainingDetails from '@/components/auditManage/retireTraining/retireTrainingDetails';
  import leaveDetails from '@/components/auditManage/leaveAudit/leaveDetails';
  import outDepartmentDetails from '@/components/auditManage/outDepartment/outDepartmentDetails';
  import rotationDetails from '@/components/auditManage/rotationAudit/rotationDetails';
  import graduationDetails from '@/components/auditManage/graduationAudit/graduationDetails';

  export default {
    name: 'detailsBox',
    components: { retireTrainingDetails, leaveDetails, outDepartmentDetails, rotationDetails,graduationDetails },
    props: ['item'],
    data() {
      return {
        isLoad: false,
        pageUrl: ''
      };
    },
    mounted() {
      this.pageUrl = this.item.LastViewStepComponentName;
      this.isLoad = true;
    },
    methods: {
      cancelHandler() {
        this.$emit('closeDialog');
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
