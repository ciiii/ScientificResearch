<template>
  <div>
    <div class="contentbody">
      <van-cell-group>
        <van-cell title="学员姓名" :value="data.学员姓名" />
        <!-- <van-cell title="学员类型" value="data.学员类型" /> -->
        <van-cell title="轮转科室" :value="data.本院科室名称" />
        <van-cell title="计划入科日期" :value="data.计划入科日期.ToDate().format('yyyy-MM-dd')" />
        <van-cell title="计划出科日期" :value="data.计划出科日期.ToDate().format('yyyy-MM-dd')" />
        <van-cell title="技能病例数" :value="data.技能病例数" />
        <van-cell title="最低管床数" :value="data.最低管床数量" />
        <van-cell title="最低全程管理数量" :value="data.最低全程管理数量" />
        <van-cell title="疾病病例数" :value="data.疾病病例数" />
        <van-cell title="门诊病例数" :value="data.门诊病例数" />
        <van-cell title="最大学员人数" :value="data.最大学员人数" />
        <van-cell v-if="data.带教老师姓名" title="带教老师" :value="data.带教老师姓名" />
        <van-cell title="状态" :value="data.状态" />
      </van-cell-group>

      <van-submit-bar v-if="(typeof callback)=='function'" :decimal-length="0" currency :button-text="label" @submit="onSubmit"></van-submit-bar>
    </div>
  </div>
</template>
<script>
import {
  List,
  Button,
  Popup,
  Field,
  CellGroup,
  Divider,
  SubmitBar,
  Search,
  Tag
} from "vant";

export default {
  components: {
    [List.name]: List,
    [Button.name]: Button,
    [Popup.name]: Popup,
    [Field.name]: Field,
    [CellGroup.name]: CellGroup,
    [Divider.name]: Divider,
    [SubmitBar.name]: SubmitBar,
    [Search.name]: Search,
    [Tag.name]: Tag
  },
  data() {
    return {};
  },
  props: {
    label: {
      type: String,
      default: "下一步"
    },
    data: {},
    callback: {
      type: Function,
      default: null
    }
  },  
  methods: {
    onSubmit() {
      this.callback();
    }
  }
};
</script>
<style lang="less">
.selectItem {
  padding-top: 10px;
  span {
    margin-right: 20px;
    margin-bottom: 15px;
  }
  .tag {
    font-size: 18px;
    position: relative;
    padding-right: 20px;
  }
  .tag i {
    position: absolute;
    top: -5px;
    color: red;
    right: -5px;
  }
}
.contentbody {
  .selectbox {
    border: 1px #ebedf0 solid;
    border-radius: 5px;
    background: #fff;
    margin-bottom: 15px;
    -moz-box-shadow: 0px 2px 10px #ebedf0;
    -webkit-box-shadow: 0px 2px 10px #ebedf0;
    box-shadow: 0px 2px 10px #ebedf0;
    padding: 15px;
    p {
      margin: 0px;
    }
    label {
      width: 80px;
      display: inline-block;
    }
    span {
      color: #6c6c6e;
    }
    span.red {
      color: red;
    }
    .actions {
      border-top: 1px solid #ebedf0;
      text-align: right;
      margin-top: 5px;
      padding-top: 10px;
      button {
        margin-left: 20px;
      }
    }
  }
  .selected {
    background-color: rgb(7, 193, 96);
    color: #fff;
    span {
      color: #efefef;
    }
  }
}
</style>


