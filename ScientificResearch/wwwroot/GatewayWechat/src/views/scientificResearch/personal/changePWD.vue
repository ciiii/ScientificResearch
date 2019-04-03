<template>
  <div class="box">
    <van-cell-group class="conter">
      <!-- <van-field
        v-model="pwd_1"
        type="password"
        label="旧密码"
        placeholder="请输入旧密码"
        required
        clearable
        @blur="pwd_A"
      />-->
      <div class="input">
        <i class="iocn iconfont icon-asterisks-1-copy"></i>
        <table>旧密码</table>
        <input
          type="password"
          placeholder="请输入旧密码"
          v-model="pwd_1"
          prop="pwd_1"
          required
          clearable
          @blur="pwd_A"
        >
      </div>

      <!-- <van-field
        v-model="pwd_2"
        type="password"
        label="新密码"
        placeholder="支持6-20位非纯数字或纯英文"
        required
        clearable
        @blur="pwd_B"
      />-->
      <div class="input">
        <i class="iocn iconfont icon-asterisks-1-copy"></i>
        <table>新密码</table>
        <input
          type="password"
          placeholder="支持6-20位非纯数字或纯英文"
          v-model="pwd_2"
          prop="pwd_2"
          @blur="pwd_B"
        >
      </div>
      <!-- <van-field
        v-model="pwd_3"
        type="password"
        label="确认密码"
        placeholder="请确认新密码"
        required
        clearable
        @input="pwd_C"
      />-->
      <div class="input">
        <i class="iocn iconfont icon-asterisks-1-copy"></i>
        <table>确认密码</table>
        <input type="password" placeholder="请确认新密码" v-model="pwd_3" prop="pwd_3" @input="pwd_C">
      </div>
    </van-cell-group>
    <van-button class="btn" :disabled="disabled" @click="submit">确认修改</van-button>
    <span>本操作将会重置您的登录密码，请牢记您的新密码</span>
    <ReturnBtn/>
  </div>
</template>
<script>
import { _debounce } from "@/assets/js/common/debounce.js";
export default {
  data() {
    return {
      pwd_1: "",
      pwd_2: "",
      pwd_3: "",
      stateA: false,
      stateB: false,
      stateC: false
    };
  },
  computed: {
    disabled() {
      if (this.stateA && this.stateB && this.stateC === true) {
        return false;
      }
      return true;
    }
  },
  mounted() {},
  methods: {
    pwd_A() {
      if (!/[\S]/.test(this.pwd_1)) {
        this.$notify("旧密码不能为空！");
        return (this.stateA = false);
      } else {
        return (this.stateA = true);
      }
    },
    pwd_B() {
      if (!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z\S]{6,20}$/.test(this.pwd_2)) {
        this.$notify("仅支持由6-20字母和数字组成，不能是纯数字或纯英文");
        return (this.stateB = false);
      } else {
        if (this.pwd_2) {
          this.pwd_C();
        }
        return (this.stateB = true);
      }
    },
    pwd_C() {
      if (this.pwd_2 !== this.pwd_3) {
        this.$notify("两次密码不一致");
        return (this.stateC = false);
      } else {
        return (this.stateC = true);
      }
    },
    submit: _debounce(function() {
      var para = {
        旧密码: this.pwd_1,
        新密码: this.pwd_2
      };
      this.$http.ChangePassword(para).then(res => {
        if (!res.error) {
          const toast = this.$toast.loading({
            duration: 0, // 持续展示 toast
            forbidClick: true, // 禁用背景点击
            loadingType: "spinner",
            message: "修改成功 3 秒"
          });
          let second = 3;
          const timer = setInterval(() => {
            second--;
            if (second) {
              toast.message = `修改成功 ${second} 秒`;
            } else {
              clearInterval(timer);
              this.$toast.clear();
              this.$router.push("/login");
            }
          }, 1000);
        } else {
          this.$toast(res.error);
        }
      });
    }, 500)
  }
};
</script>
<style lang="less" scoped>
.box {
  padding: 30px 15px;
  .btn {
    margin-top: 30px;
    background-color: #57d4ce;
    color: #fff;
    font-size: 16px;
    width: 100%;
    height: 40px;
  }
  span {
    display: inline-block;
    font-size: 14px;
    color: #c1c1c9;
    padding-top: 20px;
  }
  .input {
    display: flex;
    border-bottom: 1px solid #ebedf0;
    i {
      font-size: 6px;
      color: #f44;
      line-height: 5;
      padding: 0 5px;
    }
    table {
      font-size: 14px;
      padding: 10px 0;
    }
    input {
      padding: 10px;
      border: none;
      outline-style: none;
      font-size: 14px;
      width: 65%;
    }
  }
}
</style>
