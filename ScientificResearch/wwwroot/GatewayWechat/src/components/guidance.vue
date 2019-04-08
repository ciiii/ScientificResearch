<template>
  <div>
    <img src="@/assets/images/timg.gif" alt>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  created() {
    var flag = localStorage.getItem("flag");
    if (flag === null) {
      var str = String(window.location.href);
      var toIP = str.split("?")[0];
      this.getCodeApi(`${toIP}#/login`, "123");
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
    getCodeApi(toURL, state) {
      //获取code
      // 授权后重定向的回调链接地址
      let urlNow = encodeURIComponent(toURL);
      let scope = "snsapi_base"; //snsapi_userinfo   //静默授权 用户无感知
      // 测试号 appid
      let appid = "wx5e45aca8fcb270f1";
      // 正式号 appid
      // let appid = "wxfcbe1c0c36e2f97c";
      let url = `https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}&connect_redirect=1#wechat_redirect`;
      window.location.replace(url);
    }
  }
};
</script>
<style lang="less" scoped>
div {
  height: 100vh;
  img {
    width: 100%;
    height: 100%;
  }
}
</style>
