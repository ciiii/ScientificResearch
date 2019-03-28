<template>
  <div>
    <search/>
    <section>
      <!-- <van-pull-refresh v-model="isLoading" @refresh="onRefresh"> -->
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
        <van-swipe :autoplay="3000" vertical :show-indicators="false" class="backlogContent">
          <van-swipe-item v-for="(item,key) in KYList" :key="key">
            <span>
              <i class="iocn iconfont icon-tongzhi"></i>
              {{item.通知名称}}
            </span>
          </van-swipe-item>
        </van-swipe>
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
      <!-- </van-pull-refresh> -->
    </section>
    <navFooter/>
  </div>
</template>
<script>
import search from "@/components/index/search";
import toDoList from "@/components/toDoList/toDoList";
import navFooter from "@/components/footer/footer";
export default {
  components: {
    search,
    toDoList,
    navFooter
  },
  data() {
    return {
      isLoading: false,
      index: 1,
      size: 15,
      KYList: []
    };
  },
  mounted() {
    var code = JSON.parse(localStorage.getItem("personnel"));
    var para = {
      人员编号: code.编号,
      index: this.index,
      size: this.size
    };
    this.$http.getToViewNewsList(para).then(res => {
      res.data.list.forEach((item, index) => {
        this.KYList.push(item);
      });
    });
  },
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
      this.$router.push("/KYMoreList");
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
.backlogContent {
  height: 32px;
  font-size: 14px;
  text-align: left;
  background-color: #fffbe8;
}
.backlogContent span {
  padding: 5px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  color: #ed6a0c;
  border-bottom: 1px solid #fff;
}
.backlogContent i {
  padding-right: 5px;
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
