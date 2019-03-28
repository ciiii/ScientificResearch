<template>
  <section class="box">
    <img src="@/assets/images/logo.png" alt="logo图片" class="img">
    <form action="/" onsubmit="return false">
      <div class="input">
        <input type="text" placeholder="医院" v-model="DbKey" @click="hospital">
        <input
          type="text"
          placeholder="工号"
          v-model="工号"
          :maxlength="max"
          :minlength="min"
          prop="工号"
        >
        <input
          type="password"
          placeholder="密码"
          v-model="密码"
          :maxlength="max"
          :minlength="min"
          prop="密码"
        >
      </div>
      <div class="btn" @click="bind">
        <span>登 录</span>
      </div>
    </form>
    <van-popup v-model="show" position="bottom" overlay close-on-click-overlay>
      <van-picker
        show-toolbar
        title="医院列表"
        :columns="columns"
        @cancel="onCancel"
        @confirm="onConfirm"
      />
    </van-popup>
  </section>
</template>
<script>
import { _debounce } from "@/assets/js/common/debounce.js";
export default {
  name: "login",
  data() {
    return {
      max: 20,
      min: 3,
      code: null,
      工号: null,
      密码: null,
      DbKey: null,
      columns: [],
      show: false
    };
  },
  created() {
    document.title = "登录";
    this.code = this.getUrlKey("code");
    if (!this.code) {
      // console.log(this.code,"code")
       this.getCodeApi("123");
    } 
  },
  mounted() {},
  methods: {
    getUrlKey(name) {
      //获取url 参数
      return (
        decodeURIComponent(
          (new RegExp("[?|&]" + name + "=" + "([^&;]+?)(&|#|;|$)").exec(
            location.href
          ) || [, ""])[1].replace(/\+/g, "%20")
        ) || null
      );
    },
    getCodeApi(state) {
      //获取code
      // 授权后重定向的回调链接地址
      let urlNow = encodeURIComponent(window.location.href);
      let scope = "snsapi_base"; //snsapi_userinfo   //静默授权 用户无感知
      let appid = "wx5e45aca8fcb270f1";
      let url = `https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}#wechat_redirect`;
      window.location.replace(url);
    },
    // getCodeApi(urlInit, state) {
    //   console.log(urlInit, state,"wwee")
    //   //获取code
    //   // 授权后重定向的回调链接地址

    //   // let urlNow = encodeURIComponent(window.location.href);
    //   let urlNow = encodeURIComponent(urlInit);
    //   // let urlNow = encodeURIComponent('http://192.168.0.99:63739/Manage/Access/BindOpenId')

    //   let scope = "snsapi_base"; //静默授权 用户无感知
    //   let appid = "wx5e45aca8fcb270f1";
    //   let url = `https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}#wechat_redirect`;
    //   // console.log(url,"123")
    //   // window.location.replace(url);
    //   return url;
    // },

    // 登录 防抖
    bind: _debounce(function() {
      if (this.工号 == null || this.密码 == null) {
        this.$notify("工号 密码 不能为空！");
        return;
      } else if (this.工号.length < 4) {
        this.$notify("工号长度不能少于【4】位");
        return;
      } else if (this.密码 == null) {
        this.$notify("密码长度不能少于【3】位");
        return;
      } else if (this.密码.length < 3) {
        this.$notify("密码长度不能少于【3】位");
        return;
      } else {
        // this.code = this.getUrlKey("code");
        if (this.code) {
          this.$http
            .BindOpenId(this.code, this.工号, this.密码, this.DbKey)
            .then(res => {
              console.log(res, "res000");
              // 登录成功
              if (res.data) {
                // 储存 token
                console.log(res.data, "data....");
                localStorage.personnel = JSON.stringify(res.data.人员);
                localStorage.token = `${res.data.token_type} ${
                  res.data.access_token
                }`;
                console.log(localStorage.token, "localStorage.token``````````");
                this.$router.push("/");
              } else {
                this.$notify(res.error);
              }
            });
        } else {
          this.$notify("登录失败，请绑定！");
        }
      }
    }, 500),

    // 获取医院列表
    hospital() {
      this.$http
        .getHospitalList()
        .then(res => {
          this.columns = res.data;
          this.show = true;
        })
        .catch(error => {
          console.log(error);
        });
    },
    onConfirm(value, index) {
      this.DbKey = value;
      this.show = false;
    },
    onCancel() {
      this.show = false;
    }
  }
};
</script>
<style scoped>
.box {
  padding-bottom: 50px;
  background-color: #fff;
}
.img {
  width: 180px;
  height: 180px;
  margin-top: 50px;
}

.input > input {
  display: block;
  margin: 0 auto;
  padding: 6px 5px;
  margin-top: 5px;
  border: none;
  border-bottom: 1px solid #57d4ce;
  width: 180px;
  outline-style: none;
  font-size: 14px;
}
.btn {
  margin: auto;
  margin-top: 30px;
  padding: 8px 5px;
  border-radius: 20px;
  background-color: #57d4ce;
  color: #fff;
  width: 180px;
  font-size: 16px;
}
</style>
