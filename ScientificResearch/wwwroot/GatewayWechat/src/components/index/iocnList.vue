<template>
  <div>
    <ul>
      <li v-for="(item,index) in iocnList" :key="index">
        <a v-if="item.手机链接地址!=upToDateUrl" @click="path(item)">
          <img v-if="item.手机链接地址!=url" :src="url + item.Logo">
          <img v-else :src="item.Logo">
          <p>{{item.名称}}</p>
        </a>
        <a v-else :href="upToDateUrl">
          <img :src="item.Logo">
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
      upToDateUrl: "https://www.uptodate.com/contents/search",
      url: "http://192.168.0.99:63739",
      HospitalInformation:''
    };
  },
  created() {},
  mounted() {
    this.login();
    // let urlNow = encodeURIComponent("http://192.168.0.157:8080/#/login?name=测试医院第一家");
    // console.log(urlNow,"eee")
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
    // getCodeApi(state) {
    //   //获取code
    //   // 授权后重定向的回调链接地址
    //   let urlNow = encodeURIComponent(window.location.href);
    //   console.log(urlNow,"67677")
    //   let scope = "snsapi_base"; //snsapi_userinfo   //静默授权 用户无感知
    //   // 测试号 appid
    //   let appid = "wx5e45aca8fcb270f1";
    //   if (process.env.NODE_ENV === "production") {
    //     // 正式号 appid
    //     appid = "wxfcbe1c0c36e2f97c";
    //   }
    //   let url = `https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}&connect_redirect=1#wechat_redirect`;
    //   window.location.replace(url);
    // },
    // getServiceName() {
    //   var personnel = localStorage.getItem("personnel");
    //   if (personnel === null) {
    //     let code = this.getUrlKey("code");
    //     if (code) {
    //       this.$http.LoginWithOpenId(code).then(res => {
    //         console.log(res, "111");
    //         if (res !== undefined) {
    //           localStorage.personnel = JSON.stringify(res.data.人员);
    //           localStorage.token = `${res.data.token_type} ${
    //             res.data.access_token
    //           }`;
    //           this.$emit("getPersonnel");
    //           var name = res.data.人员.DbKey;
    //           var para = {
    //             医院名称: name
    //           };
    //           this.$http.getServiceList(para).then(res => {
    //             this.iocnList = res.data;
    //             this.$emit("getKYNews");
    //           });
    //           return;
    //         } else {
    //           var para = {
    //             医院名称: ""
    //           };
    //           this.$http.getServiceList(para).then(res => {
    //             this.iocnList = res.data;
    //           });
    //           return;
    //         }
    //       });
    //     } else {
    //       // this.getCodeApi("123");
    //     }
    //   } else {
    //     var personnel = JSON.parse(localStorage.getItem("personnel"));
    //     var para = {
    //       医院名称: personnel.DbKey
    //     };
    //     this.$http.getServiceList(para).then(res => {
    //       console.log(res, "222");
    //       this.iocnList = res.data;
    //     });
    //     this.$emit("getPersonnel");
    //     this.$emit("getKYNews");
    //     return;
    //   }
    // },
    async login() {
      //本地存储
      let personnel = JSON.parse(localStorage.getItem("personnel"));
      //如果没有本地储存
      if (!personnel) {
        let code = this.getUrlKey("code");
        let res = await this.$http.LoginWithOpenId(code);
        //如果有绑定的
        if (res) {
          localStorage.personnel = JSON.stringify(res.data.人员);
          localStorage.token = `${res.data.token_type} ${
            res.data.access_token
          }`;
          this.$emit("getPersonnel");
          this.$emit("getKYNews");
        }
        //取医院服务列表
        let returnOfGetServiceList = await this.$http.getServiceList({
          医院名称: !!res ? res.data.人员.DbKey : ""
        });
        this.iocnList = returnOfGetServiceList.data;
      }
      //如果有本地存储
      else {
        var para = {
          医院名称: personnel.DbKey
        };
        let res = await this.$http.getServiceList(para);
        this.iocnList = res.data;
        this.$emit("getPersonnel");
        this.$emit("getKYNews");
      }
    },

    path(item) {
      if (item.手机链接地址 === null) {
        // this.$toast.fail({
        //   duration: 1000,
        //   message: "请先购买服务!"
        // });
        this.$toast({
          duration: 2000,
          message: "你还没有权限，请先联系医院管理员!"
        });
      } else {
        this.$router.push({
          path: item.手机链接地址,
          query: {
            accountId: item.编号
          }
        });
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
