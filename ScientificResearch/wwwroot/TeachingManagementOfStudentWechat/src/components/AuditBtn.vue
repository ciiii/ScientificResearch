<template>
  <div class="auditbtns">
    <van-cell-group title="审核">
      <p>
        <van-field
          v-model="form.Remark"
          label="说明"
          type="textarea"
          placeholder="请输入审核说明"
          rows="2"
          autosize
        />
      </p>
    </van-cell-group>
    <p class="btn">
      <van-button icon="success" type="primary" @click="save(1)" size="small">通过</van-button>
      <van-button icon="cross" type="danger" @click="save(0)" size="small">不通过</van-button>
    </p>
  </div>
</template>
<script>
import { SaveAuditRecord } from "@/api/WorkFlow";
import { Button, Field } from "vant";
export default {
  name: "AuditBtn",
  components: {
    [Button.name]: Button,
    [Field.name]: Field
  },
  props: {
    item: { type: Object, default: null },
    type: {
      type: Number | String,
      default: 0
    },
    callback: {
      type: Function,
      default: function() {}
    }
  },
  data() {
    return {
      form: {
        type: 0,
        StepId: 0,
        IsHold: false,
        Remark: "",
        Data: 0
      }
    };
  },
  mounted() {},
  methods: {
    save(action) {
      this.form.StepId = this.item.LastStepId;
      this.form.Data = this.item.学员编号;
      this.form.type = this.type + "" + action;
      SaveAuditRecord(this.form).then(res => {
        if (!res.error) {
          this.callback(res);
        }
      });
    }
  }
};
</script>
<style lang="less">
.auditbtns {
  .btn {
    text-align: center;
    margin: 30px 0px;
  }
  button {
    margin: 0px 30px;
  }
}
</style>


