<template>
  <section class="box">
    <!-- <img src="@/assets/images/iocn/logo.png" alt="logo图片" class="img"> -->
    <img :src="this.Logo || this.defaultImg" class="img">
    <form action="/" onsubmit="return false">
      <div class="input">
        <!-- <input type="text" placeholder="医院" v-model="DbKey" @click="hospital" readonly> -->
        <!-- <input type="text" placeholder="医院" v-model="DbKey" readonly> -->
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
    <!-- <van-popup v-model="show" position="bottom" overlay close-on-click-overlay>
      <van-picker
        show-toolbar
        title="医院列表"
        :columns="columns"
        @cancel="onCancel"
        @confirm="onConfirm"
      />
    </van-popup>-->
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
      工号: null,
      密码: null,
      DbKey: null,
      Logo: "",
      HospitalInformation: "",
      url: "http://192.168.0.99:63739",
      defaultImg: require("@/assets/images/iocn/logo.png")
      // columns: [],
      // show: false
    };
  },
  created() {
    this.DbKey = this.getUrlKey("name");
    console.log(this.DbKey)
    this.getLogo();
  },
  mounted() {
    // 获取医院列表
    // this.$http
    //   .getHospitalList()
    //   .then(res => {
    //     this.columns = res.data;
    //   })
    //   .catch(error => {
    //     console.log(error);
    //   });
  },
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
    async getLogo() {
      let para = {
        k: this.DbKey
      };
      let res = await this.$http.getHospitalInformation(para);
      if (process.env.NODE_ENV === "production") {
        this.Logo = res.data.Logo;
      }
      this.Logo = this.url + res.data.Logo;
      this.HospitalInformation = res.data;
    },
    // 登录 防抖
    bind: _debounce(function() {
      if (this.工号 === null || this.密码 === null || this.DbKey === null) {
        this.$notify("医院 工号 密码 不能为空！");
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
        var code = this.getUrlKey("code");
        if (code) {
          this.$http
            .BindOpenId(code, this.工号, this.密码, this.DbKey)
            .then(res => {
              if (!res.error) {
                // 登录成功 储存 token
                localStorage.personnel = JSON.stringify(res.data.人员);
                localStorage.token = `${res.data.token_type} ${
                  res.data.access_token
                }`;
                this.$router.push("/");
                localStorage.HospitalInformation = JSON.stringify(
                  this.HospitalInformation
                );
                localStorage.flag = false;
              } else {
                this.$notify("登录信息有误！");
              }
            });
        } else {
          this.$notify("请授权后再登录！");
        }
      }
    }, 500)

    // 显示医院列表
    // hospital() {
    //   this.show = true;
    // },
    // onConfirm(value, index) {
    //   this.DbKey = value;
    //   this.show = false;
    // },
    // onCancel() {
    //   this.show = false;
    // }
  }
};
</script>
<style scoped>
.box {
  height: 100vh;
  /* padding-bottom: 50px; */
  background-color: #fff;
}
.img {
  width: 200px;
  height: 60px;
  margin: 50px 0 20px 0;
}

.input > input {
  display: block;
  margin: 0 auto;
  /* padding: 10px 5px; */
  line-height: 2;
  margin-top: 5px;
  border: none;
  border-bottom: 1px solid #57d4ce;
  width: 250px;
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
  width: 260px;
  font-size: 16px;
}
</style>
