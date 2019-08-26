<template>
  <van-steps direction="vertical" :active="active" class="box">
    <van-step v-for="item in list" :key="item.Id">
      <div v-if="item.OperatorId">
        <h3>{{item.OperatorDatetime}}</h3>
        <div class="boxContent">
          <h4>{{item.StepTemplateName}}</h4>
          <p>{{item.OpeartorInfo}}【{{item.OperatorType}}】 {{item.StateName}}于 {{item.OperatorDatetime}}</p>
          <p>
            <van-tag plain :type="item.State==1?'success':'danger'">{{item.StateName}}</van-tag>
          </p>
        </div>
      </div>
      <div v-else>
        <h3>{{item.StepTemplateName}} <van-tag plain :type="item.State==1?'success':'danger'">{{item.StateName}}</van-tag></h3>
        
      </div>
    </van-step>
  </van-steps>
</template>
<script>
import { Step, Steps, Tag } from "vant";
import { GetAuditRecord } from "@/api/WorkFlow";
export default {
  name: "AuditStep",
  props: {
    flowid: {
      type: Number,
      default: 0
    }
  },
  components: {
    [Step.name]: Step,
    [Steps.name]: Steps,
    [Tag.name]: Tag
  },
  data() {
    return {
      active:-1,
      list: []
    };
  },
  mounted() {
    let _this = this;
    GetAuditRecord({ id: this.flowid }).then(res => {
      for (let i = 0; i < res.data.data.length; i++) {
        let item = res.data.data[i];
        _this.list.push(item);
        if(item.OperatorId)
        {
          this.active++;
        }
      }
    });
  }
};
</script>
<style lang="less">
.box {
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
  }
}
</style>


