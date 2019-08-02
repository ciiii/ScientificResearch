<template>
  <div>
    <navbar />
    <van-cell-group>
      <van-field v-model="form.oldPass" type="password" label="原密码" placeholder="请输入当前密码" required />
      <van-field v-model="form.newPass" type="password" label="新密码" placeholder="请输入新密码" required />
      <van-field
        v-model="form.confirmPass"
        type="password"
        label="确认密码"
        placeholder="再次输入新密码"
        required
      />
    </van-cell-group>

    <van-button size="large" class="btn" @click="submit" type="info">确认修改</van-button>
  </div>
</template>
<script>
import { Row, Col, Icon, Cell, CellGroup, Field } from "vant";
import navbar from "@/components/navbar.vue";
export default {
  components: {
    Row,
    Col,
    Icon,
    Cell,
    CellGroup,
    navbar,
    [Field.name]: Field
  },
  data() {
    return {
      form: {
        oldPass: "",
        newPass: "",
        confirmPass: ""
      }
    };
  },
  vuerify: {
    "form.oldPass": [
      {
        test: /\S+/,
        message: "原密码不能为空"
      }
    ],
    "form.newPass": {
      test: /\S+/,
      message: "新密码不能为空"
    },
    "form.confirmPass": {
      test: function() {
        if (this.form.newPass !== this.form.confirmPass) {
          return false;
        } else {
          return true;
        }
      },
      message: "两次密码输入不一致"
    }
  },

  methods: {
    submit() {
      for (var k in this.form) {
        if (!this.$vuerify.check(["form." + k])) {
          var err = this.$vuerify.$errors["form." + k];
          var msg = typeof err == "object" ? err[0] : err;
          this.$toast({
            message: msg,
            position: "top"
          });
          return;
        }
      }
      this.$toast('操作成功！');
      this.$router.push('/mine');
    }
  }
};
</script>
<style lang="less">
.btn {
  margin-top: 15px;
}
</style>


