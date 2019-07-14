<template>
  <div class="app-container page-common page-addStudent">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <h5 class="personal-title">添加补轮转 <span class="explain">(说明：点击科室可添加补轮转。)</span></h5>
    <rotationList @myEvent="myEvent" :state="state" v-if="isLoad"></rotationList>
    <el-dialog title="添加补轮转" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               class="common-dialog">
      <addRepaorForm ref="child" @myEvent="myEventDialog" :item="item"></addRepaorForm>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_TEACHING_MANAGEMENT } from '@/assets/js/connect/ConSysUrl';
  import {
    _debounce,
    deepCopy,
    matchingProperty,
    alterItem,
    countDays,
    addDay,
    reduceDay
  } from '@/assets/js/Common';
  import addRepaorForm from './addRepaorForm';
  import rotationList from '@/components/rotation/rotationList';

  export default {
    name: 'editRotation',
    components: { addRepaorForm, rotationList },
    data() {
      return {
        multipleSelection: [],
        isLoad: false,
        isDialog: false,
        state: '轮转计划已安排',
        itemState: '',
        item: {}
      };
    },
    mounted() {
      this.isLoad = true;
    },
    methods: {
      myEvent(item, state, one) {
        this.item = one;
        this.itemState = state;
        if (one.状态 == '出科') {
          this.$message.error('【出科】状态不能添加补轮转！');
        } else {
          this.isDialog = true;
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
  @import "@/assets/scss/Variable.scss";
  @import "@/assets/scss/AddStudent.scss";

  .mailTable {
    margin-bottom: 10px;
  }

  .personal-title {
    padding-bottom: 5px;
    margin: 0 0 10px 20px;
    color: #696d73;
    font-size: 22px;
    font-style: italic;
    font-weight: normal;
    text-align: left;
  }

  .rotation-box {
    width: 80%;
    margin: 0 auto 10px;
    overflow: hidden;

    display: flex;
    border-radius: 5px;

    .left {
      flex: 1;
      padding: 15px 20px;
      border: 1px solid $border;
      min-height: 350px;
      max-height: 600px;
      overflow-y: auto;

      ul {
        padding: 0;
        margin: 0;
      }

      li {
        border-radius: 5px;
        overflow: hidden;

        a {
          display: block;
          padding: 10px;
          font-size: 13px;
          border-bottom: 1px solid $border;
        }

        .state {
          float: right;
        }
      }

      .active {
        background: #f0f3f9;
        box-shadow: 0 1px 4px rgba(0, 21, 41, .08);
        border: 1px solid #e9edf7;

        a {
          color: $colorActive;
        }
      }
    }

    .right {
      width: 60px;
      padding-top: 100px;
      margin-left: 15px;

      .el-button {
        margin-left: 0;
        margin-bottom: 10px;
        padding: 8px 12px;

        i {
          font-size: 22px;
        }
      }
    }
  }
</style>

