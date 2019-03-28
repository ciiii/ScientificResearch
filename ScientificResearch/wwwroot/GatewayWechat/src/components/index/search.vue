<template>
  <div>
    <img src="@/assets/images/iocn/homeLogo.jpg" alt="科研logo">
    <span @click="toLogin">登 录</span>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  methods: {
    toLogin() {
      var personnel = JSON.parse(localStorage.getItem("personnel"));
      if (personnel === null) {
        this.$router.push("/login");
      } else {
        this.$toast("您已登录过了耶！");
      }
    }
  }
};
</script>
<style lang="less" scoped>
div {
  background-color: #fff;
  img {
    height: 50px;
  }
  span {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 16px;
    color: #a3a3a3;
  }
}
</style>
