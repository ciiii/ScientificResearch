<template>
  <div class="app-container page-common page-rotaion">
    <h4 class="page-title" align="center">学员入科</h4>
    <div class="btn-box" align="center">
      <span class="explain">(说明：点击科室可添加学员入科操作。)</span>
    </div>
    <rotationList @myEvent="myEvent" :state="state" v-if="isLoad"></rotationList>
    <el-dialog title="学员入科" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               class="common-dialog">
      <addStudentEntry ref="child" @myEvent="myEventDialog" :item="item" :isAdd="isAdd"></addStudentEntry>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_TEACHING_MANAGEMENT } from '@/assets/js/connect/ConSysUrl';
  import rotationList from '@/components/rotation/rotationList';
  import addStudentEntry from './addStudentEntry';

  export default {
    components: { rotationList, addStudentEntry },
    data() {
      return {
        item: {},
        state: '轮转计划已安排',
        isDialog: false,
        isAdd: false,
        isLoad: false
      };
    },
    created() {
      if (this.$route.query.state) {
        this.state = this.$route.query.state;
      }
    },
    mounted() {
      this.isLoad = true;
    },
    methods: {
      myEvent(item, state, one) {
        if (new Date(one.计划入科日期).getTime() <= new Date().getTime()) {
          this.item = one;
          this.isAdd = true;
          if (one.状态 == '未入科') {
            this.isDialog = true;
          } else {
            this.$message.error('学员已经是【' + one.状态 + '】状态！');
          }
        } else {
          this.$message.error('还未到入科日期！');
        }

      },
      myEventDialog() {
        this.isDialog = false;
        this.isLoad = false;
        setTimeout(() => {
          this.isLoad = true;
        }, 50);
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  .btn-box {
    margin-bottom: 10px;
  }
</style>


