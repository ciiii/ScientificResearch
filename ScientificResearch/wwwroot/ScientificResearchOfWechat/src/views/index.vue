<template>
  <div>
    <search/>
    <section>
      <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
        <div class="backlogBox">
          <div class="backlog">
            <span>
              <i class="icon iconfont icon-tongzhi1"></i>
              <span>通知公告</span>
            </span>
            <span @click="more">
              更多
              <i class="icon iconfont icon-you"></i>
            </span>
          </div>
          <van-notice-bar text="足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。" left-icon="volume-o"/>
        </div>
        <div class="box">
          <div>
            <h3>第一作者</h3>
            <span>10</span>
          </div>
          <div>
            <h3>横项</h3>
            <span>15</span>
          </div>
          <div>
            <h3>纵项</h3>
            <span>17</span>
          </div>
          <div>
            <h3>费用</h3>
            <span>3728元</span>
          </div>
        </div>
        <div class="backlogBox">
          <div class="backlog">
            <span>
              <i class="icon iconfont icon-liti"></i>
              <span>我的待办</span>
            </span>
          </div>
          <toDoList ref="toDoList"/>
        </div>
      </van-pull-refresh>
    </section>
    <navFooter/>
  </div>
</template>
<script>
import search from "@/components/index/search";
import toDoList from "@/components/toDoList/toDoList";
import navFooter from "@/../src/components/footer/footer";
export default {
  components: {
    search,
    toDoList,
    navFooter
  },
  data() {
    return {
      isLoading: false
    };
  },
  mounted() {},
  //https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx5e45aca8fcb270f1&redirect_uri=http%3A%2F%2F192.168.0.157%3A8080%2F%23%2Flogin&response_type=code&scope=snsapi_base&state=undefined&connect_redirect=1#wechat_redirect
  //https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx5e45aca8fcb270f1&redirect_uri=http%3A%2F%2F192.168.0.157%3A8080%2F%23&response_type=code&scope=snsapi_base&state=undefined&connect_redirect=1#wechat_redirect
  methods: {
    onRefresh() {
      setTimeout(() => {
        this.$refs.toDoList.getBacklog();
        this.$toast("刷新成功");
        this.isLoading = false;
      }, 500);
    },
    getUrlKey(name) {
      //获取url 参数 解码
      return (
        decodeURIComponent(
          (new RegExp("[?|&]" + name + "=" + "([^&;]+?)(&|#|;|$)").exec(
            location.href
          ) || [, ""])[1].replace(/\+/g, "%20")
        ) || null
      );
    },
    getCodeApi(urlInit, state) {
      //获取code
      // 授权后重定向的回调链接地址
      // let urlNow = encodeURIComponent(window.location.href);
      let urlNow = encodeURIComponent(urlInit);
      // let urlNow = encodeURIComponent('http://192.168.0.99:63739/Manage/Access/LoginWithOpenId')

      let scope = "snsapi_base"; //静默授权 用户无感知
      let appid = "wx5e45aca8fcb270f1";
      let url = `https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}#wechat_redirect`;
      return url;
    },

    more() {
      // this.$router.push("/backlog");
      console.log("更多通知");
    }
  },
  created() {
    document.title = "科研管理 - 主页";
    if (!localStorage.token) {
      let code = this.getUrlKey("code");
      if (code) {
        this.$http.LoginWithOpenId(code).then(res => {
          console.log(res, "res```````");
          localStorage.personnel = JSON.stringify(res.data.人员);
          localStorage.token = `${res.data.token_type} ${
            res.data.access_token
          }`;
          console.log(localStorage.token, "localStorage.token  ????????");
          this.$refs.toDoList.getBacklog();
        });
      } else {
        this.$router.push("/login");
        this.$notify("没有权限，请绑定！");
      }
    }
  }
};
</script>
<style scoped>
section {
  background-color: #f4f8fb;
}
.box {
  display: flex;
  justify-content: space-between;
  padding: 10px 8px;
  background-color: #fff;
}
.box > div {
  width: 75px;
  height: 75px;
  border: 4px solid #d9dada;
  border-radius: 50%;
  color: #224b8f;
  background-color: #eaefef;
  font-size: 12px;
}
.box > div > h3 {
  margin-top: 20px;
  margin-bottom: 0;
}
.detailsBtn {
  margin-left: 10px;
}
.backlogBox {
  padding: 10px;
  background-color: #fff;
  margin: 10px 0;
}
.backlogBox > h3 {
  margin: 0;
  font-size: 18px;
}
.backlog {
  display: flex;
  justify-content: space-between;
  font-size: 14px;
  margin-bottom: 10px;
}
.backlog > span {
  padding: 5px 0;
}
.icon-liti,
.icon-tongzhi1 {
  font-size: 18px;
  color: #d4237a;
  padding-right: 2px;
}
.icon-you {
  font-size: 12px;
}
</style>
