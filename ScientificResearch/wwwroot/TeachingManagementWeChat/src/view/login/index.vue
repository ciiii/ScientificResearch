<template>
  <div class="loginFrom">
    <div class="box">
      <h2>Welcome</h2>
      <p>
        <van-field v-model="loginForm.username" clearable label="账号" right-icon="manager" />
      </p>
      <p>
        <van-field
          v-model="loginForm.password"
          type="password"
          label="密码"
          clearable
          right-icon="lock"
        />
      </p>
      <p>
        <input class="btn" type="button" value="立即登录" @click="handleSubmit" />
      </p>
    </div>
  </div>
</template>
<script>
import { Field, Panel } from "vant";
import { mapActions } from "vuex";

export default {
  components: {
    [Field.name]: Field,
    [Panel.name]: Panel
  },
  data() {
    return {
      loginForm: {
        username: "admin",
        password: "123456"
      }
    };
  },
  vuerify: {
    "loginForm.username": [
      {
        test: /\S+/,
        message: "账号不能为空"
      },
      {
        test: /\w{4,}/,
        message: "账号至少 4 位字符"
      }
    ],
    "loginForm.password": {
      test: /\S+/,
      message: "密码不能为空"
    }
  },

  methods: {
    ...mapActions(["handleLogin", "getUserInfo"]),
    handleSubmit() {
      for (var k in this.loginForm) {
        if (!this.$vuerify.check(["loginForm." + k])) {
          var err = this.$vuerify.$errors["loginForm." + k];
          var msg = (typeof err) == "object" ? err[0] : err;
          this.$toast({
            message: msg,
            position: "top"
          });
          return;
        }
      }
      const loadding = this.$toast.loading({
        duration: 0,
        mask: true,
        message: "正在登录..."
      });
      var userName = this.loginForm.username;
      var password = this.loginForm.password;
      this.handleLogin({ userName, password }).then(res => {
        loadding.clear();
        if (res.err) {
          this.$toast.fail("账号或者密码错误");
        } else {
          this.getUserInfo().then(() => {
            this.$router.push({
              name: this.$config.homeName
            });
          });
        }
      });
    }
  }
};
</script>
<style lang="less">
.loginFrom {
  position: absolute;
  top: 0px;
  bottom: 0px;
  left: 0px;
  right: 0px;
  min-height: 450px;
  background: -moz-linear-gradient(left 30deg, #68c9b6, #3879cd);
  background: -webkit-gradient(
    linear,
    0 0,
    100% 100%,
    from(#68c9b6),
    to(#3879cd)
  );
  background: -o-linear-gradient(30deg, #68c9b6, #3879cd);
  .box {
    margin: 10px auto;
    width: 90%;
    max-width: 600px;
    background: transparent;
    h2 {
      text-align: center;
      color: #fff;
      font-weight: normal;
      font-size: 40px;
      margin-top: 70px;
      margin-bottom: 90px;
    }
    .van-cell,
    .btn {
      background: transparent;
      border: 0.05em solid #fff;
      border-radius: 20px;
      color: #fff;
      line-height: 24px;
      .van-field__label {
        width: 40px;
      }
      .van-field__right-icon {
        color: #fff;
      }
      input {
        color: #fff;
      }
    }

    .btn {
      width: 100%;
      line-height: 43px;
      letter-spacing: 10px;
      margin-top: 0px;
    }
  }
}
</style>


