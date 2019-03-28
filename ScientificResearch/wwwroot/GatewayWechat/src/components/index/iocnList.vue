<template>
  <ul>
    <li v-for="(item,index) in iocnList" :key="index">
      <a @click="path(item)">
        <img :src="item.Logo" :alt="item.名称">
        <p>{{item.名称}}</p>
      </a>
    </li>
  </ul>
</template>
<script>
export default {
  data() {
    return {
      iocnList: []
    };
  },
  created() {},
  mounted() {
    this.getServiceName();
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
    getCodeApi(state) {
      //获取code
      // 授权后重定向的回调链接地址
      let urlNow = encodeURIComponent(window.location.href);
      let scope = "snsapi_base"; //snsapi_userinfo   //静默授权 用户无感知
      let appid = "wx5e45aca8fcb270f1";
      let url = `https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}#wechat_redirect`;
      window.location.replace(url);
    },
    getServiceName() {
      var personnel = localStorage.getItem("personnel");
      if (personnel === null) {
        let code = this.getUrlKey("code");
        if (code) {
          this.$http.LoginWithOpenId(code).then(res => {
            if (res !== undefined) {
              localStorage.personnel = JSON.stringify(res.data.人员);
              localStorage.token = `${res.data.token_type} ${
                res.data.access_token
              }`;
              var name = res.data.人员.DbKey;
              var para = {
                医院名称: name
              };
              this.$http.getServiceList(para).then(res => {
                // console.log(res,"服务列表！")
                this.iocnList = res.data;
              });
              this.$emit('getKYNews');
            } else {
              var para = {
                医院名称: ""
              };
              this.$http.getServiceList(para).then(res => {
                this.iocnList = res.data;
              });
            }
          });
        } else {
          this.getCodeApi("123");
        }
      } else {
        var personnel = JSON.parse(localStorage.getItem("personnel"));
        var para = {
          医院名称: personnel.DbKey
        };
        this.$http.getServiceList(para).then(res => {
          this.iocnList = res.data;
        });
        this.$emit('getKYNews');
      }
    },
    path(item) {
      if (item.手机链接地址 === null) {
        this.$toast.fail({
          duration: 1000,
          message: "请先购买服务!"
        });
      } else {
        var path = item.手机链接地址;
        if (path.indexOf("?") != -1) {
          this.$router.push(`/${path}&accountId=${item.编号}`);
        } else {
          this.$router.push(`/${path}?accountId=${item.编号}`);
        }
      }
    }
  }
};
</script>
<style lang="less" scoped>
ul {
  display: flex;
  flex-wrap: wrap;
  padding: 8px;
  li {
    width: 25%;
    padding: 10px 0;
    img {
      width: 40px;
      height: 40px;
    }
    p {
      margin: 0;
      font-size: 14px;
      color: #000;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
  }
}
</style>
