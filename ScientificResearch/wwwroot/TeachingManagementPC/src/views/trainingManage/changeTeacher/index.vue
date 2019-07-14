<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">更换带教老师</h4>
    <div class="btn-box" align="center">
      <span class="explain">(说明：点击科室可更换带教老师。)</span>
    </div>
    <rotationList @myEvent="myEvent" :state="state" v-if="isLoad"></rotationList>
    <el-dialog title="更换带教老师" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               class="common-dialog">
      <changeTeacher ref="child" @myEvent="myEventDialog" :item="item" :isAdd="isAdd"></changeTeacher>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_TEACHING_MANAGEMENT, ROTATION_STATE, URL_ORGANIZATION } from '@/assets/js/connect/ConSysUrl';
  import { formatDate } from '@/assets/js/Common';
  import rotationList from '@/components/rotation/rotationList';
  import changeTeacher from './changeTeacher';

  export default {
    components: { changeTeacher, rotationList },
    data() {
      return {
        isDialog: false,
        isAdd: false,
        item: {},
        state: '轮转计划已安排',
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
        this.item = one;
        this.isAdd = false;
        if (one.状态 == '未入科') {
          this.$message.error('【未入科】不能更换带教老师，请先入科！');
        }
        if (one.状态 == '在科') {
          this.isDialog = true;
        }
        if (one.状态 == '已出科') {
          this.$message.error('学员已经是【已出科】状态，不能更换带教老师！');
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



