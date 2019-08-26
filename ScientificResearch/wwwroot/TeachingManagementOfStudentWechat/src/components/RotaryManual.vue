<template>
  <van-steps direction="vertical" :active="active" class="boxRotaryManual">
    <van-step v-for="item in list" :key="item.编号">
      <div>
        <h3 v-if="item.实际入科日期">
          {{item.实际入科日期.format('yyyy-MM-dd')}}
          至
          <span
            v-if="item.实际出科日期"
          >{{item.实际出科日期.format('yyyy-MM-dd')}}</span>
          <span v-else>{{item.计划出科日期.format('yyyy-MM-dd')}}</span>
        </h3>
        <h3 v-else>{{item.计划入科日期.format('yyyy-MM-dd')}}至 <span >{{item.计划出科日期.format('yyyy-MM-dd')}}</span></h3>
        <div class="boxContent">
          <h4>{{item.本院科室名称}}</h4>
          <p>
            <van-tag plain :type="item.状态=='未入科'?'danger':'success'">{{item.状态}}</van-tag>
          </p>
          <p>
            <van-tag plain>医技:{{item.已完成医技病例数 + "/" + item.医技病例数}}</van-tag>
            <van-tag plain>技能:{{item.已完成技能病例数 + "/" + item.技能病例数}}</van-tag>
            <van-tag plain>疾病:{{item.已完成疾病病例数 + "/" + item.疾病病例数}}</van-tag>
            <van-tag plain>病房:{{item.已完成病房病例数 + "/" + item.住院病例数}}</van-tag>
            <van-tag plain>医技:{{item.已完成门诊病例数 + "/" + item.门诊病例数}}</van-tag>
          </p>
        </div>
      </div>
    </van-step>
  </van-steps>
</template>
<script>
import { Step, Steps, Tag } from "vant";

export default {
  name: "RotaryManual",

  components: {
    [Step.name]: Step,
    [Steps.name]: Steps,
    [Tag.name]: Tag
  },
  data() {
    return {
      active: -1,
      list: []
    };
  },
  mounted() {
    let _this = this;
    let RotaryManual = [];
    if (localStorage.getItem("RotaryManual")) {
      RotaryManual = JSON.parse(localStorage.getItem("RotaryManual"));
      RotaryManual.forEach(item => {
        _this.list.push(item.轮转基本信息);
        if ( item.轮转基本信息.状态 == "已出科") {
          _this.active++;
        }
      });
    }
  }
};
</script>
<style lang="less">
.boxRotaryManual {
  padding-bottom: 40px;
  h3 {
    text-align: left;
  }
  .boxContent {
    line-height: 30px;
    margin-top: 10px;
    border: 1px #ebedf0 solid;
    border-radius: 5px;
    padding: 10px;
    .van-tag--default {
      margin-right: 8px;
    }
  }
}
</style>


