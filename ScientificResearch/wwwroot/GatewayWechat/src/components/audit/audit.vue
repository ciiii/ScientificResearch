<template>
  <van-panel title="审核" class="box">
    <i class="icon iconfont icon-guanbi" @click="back"></i>
    <van-cell-group>
      <van-field
        v-model="value"
        label="审核说明："
        type="textarea"
        placeholder="请输入审核说明···"
        rows="5"
        :autosize="maxHeight"
      />
      <div class="btn">
        <van-button type="primary" size="small" @click="pass">通过</van-button>
        <van-button type="warning" size="small" @click="fail">不通过</van-button>
        <van-button type="danger" size="small" @click="termination">终止</van-button>
      </div>
    </van-cell-group>
  </van-panel>
</template>
<script>
export default {
  props: ["message", "getBacklog"],
  data() {
    return {
      value: "",
      maxHeight: {
        maxHeight: 90
      },
      state: {
        pass: 1,
        fail: -1,
        termination: -2
      },
      falg: true
    };
  },
  mounted() {},
  methods: {
    back() {
      this.$emit("getMessage");
      this.value = "";
    },
    pass() {
      // console.log(this.message, "通过");
      var para = {
        步骤编号: this.message.步骤编号,
        状态值: this.state.pass,
        备注: this.value
      };
      this.$http.auditStep(para).then(res => {
        if (res.error) {
          this.$toast({
            duration: 1500,
            message: res.error
          });
        } else {
          this.$toast.success({
            duration: 1500,
            message: "操作成功！"
          });
          this.$emit("getBacklog", this.falg);
        }
      });
      this.back();
    },
    fail() {
      var para = {
        步骤编号: this.message.步骤编号,
        状态值: this.state.fail,
        备注: this.value
      };
      this.$http.auditStep(para).then(res => {
        if (res.error) {
          this.$toast({
            duration: 1500,
            message: res.error
          });
        } else {
          this.$toast.success({
            duration: 1500,
            message: "操作成功！"
          });
          this.$emit("getBacklog", this.falg);
        }
      });
      this.back();
    },
    termination() {
      var para = {
        步骤编号: this.message.步骤编号,
        状态值: this.state.termination,
        备注: this.value
      };
      this.$http.auditStep(para).then(res => {
        if (res.error) {
          this.$toast({
            duration: 1500,
            message: res.error
          });
        } else {
          this.$toast.success({
            duration: 1500,
            message: "操作成功！"
          });
          this.$emit("getBacklog", this.falg);
        }
      });
      this.back();
    }
  }
};
</script>
<style lang="less" scoped>
.box {
  i {
    position: absolute;
    top: 18px;
    right: 20px;
    font-size: 20px;
  }
  padding: 10px 0;
  .btn {
    display: flex;
    justify-content: space-evenly;
    padding: 10px 0;
  }
}
</style>
