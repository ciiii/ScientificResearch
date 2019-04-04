<template>
  <div>
    <ul>
      <li v-for="(item,index) in iocnList" :key="index">
        <a v-if="item.手机链接地址!=upToDateUrl" @click="path(item)">
          <img :src="item.Logo" :alt="item.名称">
          <p>{{item.名称}}</p>
        </a>
        <a v-else :href="upToDateUrl">
          <img :src="item.Logo" :alt="item.名称">
          <p>{{item.名称}}</p>
        </a>
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  data() {
    return {
      iocnList: [],
      upToDateUrl: "https://www.uptodate.com/contents/search"
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
      // let appid = "wxfcbe1c0c36e2f97c";
      let url = `https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}&connect_redirect=1#wechat_redirect`;
      window.location.replace(url);
    },
    getServiceName() {
      var personnel = localStorage.getItem("personnel");
      if (personnel === null) {
        let code = this.getUrlKey("code");
        if (code) {
          this.$http.LoginWithOpenId(code).then(res => {
            console.log(res, "111");
            if (res !== undefined) {
              localStorage.personnel = JSON.stringify(res.data.人员);
              localStorage.token = `${res.data.token_type} ${
                res.data.access_token
              }`;
              this.$emit("getPersonnel");
              var name = res.data.人员.DbKey;
              var para = {
                医院名称: name
              };
              this.$http.getServiceList(para).then(res => {
                this.iocnList = res.data;
                this.$emit("getKYNews");
              });
              return;
            } else {
              var para = {
                医院名称: ""
              };
              this.$http.getServiceList(para).then(res => {
                this.iocnList = res.data;
              });
              return;
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
          console.log(res, "222");
          this.iocnList = res.data;
        });
        this.$emit("getPersonnel");
        this.$emit("getKYNews");
        return;
      }
    },

    path(item) {
      if (item.手机链接地址 === null) {
        this.$toast.fail({
          duration: 1000,
          message: "请先购买服务!"
        });
      } else {
        this.$router.push({
          path: item.手机链接地址,
          query: {
            accountId: item.编号
          }
        });
      }
      // else {
      //   this.$router.push({
      //     path: item.手机链接地址,
      //     query: {
      //       accountId: item.编号
      //     }
      //   });
      // }
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
