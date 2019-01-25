<template>
  <div>
    <nav>
      <form action="/">
        <van-search
          v-model="search"
          placeholder="请输入搜索关键词"
          show-action
          @search="onSearch"
          @cancel="onCancel"
        />
      </form>
    </nav>
    <section>
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
            <i class="iconfont icon-tongzhi1"></i>
            <span>通知公告</span>
          </span>
          <span @click="more">更多 》</span>
        </div>
        <van-notice-bar text="足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。" left-icon="volume-o"/>
        <h3>暂无数据！</h3>
      </div>

      <div class="backlogBox">
        <div class="backlog">
          <span>
            <i class="iconfont icon-liti"></i>
            <span>我的待办</span>
          </span>
          <span @click="more">更多 》</span>
        </div>
        <van-list class="backlogList">
          <van-card desc="科研管理员复核-待审核" title="横向经费到账">
            <div slot="footer">
              <van-button type="warning" size="small" @click="review">复核</van-button>
              <van-button type="primary" size="small" @click="details">详情</van-button>
            </div>
          </van-card>

          <!-- <van-cell :value='item.步骤状态说明' style="color:#f47920" is-link class="audit"  v-for="item in list" :key="item.index" :title="item.流程名称" >
            <template slot="title">
              <span class="custom-text">{{item.流程名称}}</span>
            </template>
            <span style="color:red">{{item.步骤状态说明}}</span>
          </van-cell> -->
        </van-list>
      </div>
      
    </section>
    <div class="footer"></div>
    <navFooter/>
  </div>
</template>
<script>
import navFooter from "@/../src/components/footer";
export default {
  components: {
    navFooter
  },
  data() {
    return { 
      list: [],
      search: null,
      backlogList: [],
      index: 1,
      size: 15
    };
  },
  mounted() {
    this.getBacklog();
  },
  //https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx5e45aca8fcb270f1&redirect_uri=http%3A%2F%2F192.168.0.157%3A8080%2F%23%2Flogin&response_type=code&scope=snsapi_base&state=undefined&connect_redirect=1#wechat_redirect
  //https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx5e45aca8fcb270f1&redirect_uri=http%3A%2F%2F192.168.0.157%3A8080%2F%23&response_type=code&scope=snsapi_base&state=undefined&connect_redirect=1#wechat_redirect
  methods: {
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
    // 用户点击键盘回车/搜索触发事件
    onSearch() {
      console.log("点击键盘回车");
    },
    // 用户点击取消触发事件
    onCancel() {
      console.log("点击右边取消");
    },
    more() {
      this.$router.push("/backlog");
    },
    // 获取待办流程
    getBacklog() {
      this.$api
        .getBacklogProcess(this.index, this.size)
        .then(res => {
          console.log(res, "获取待办流程");
          // this.list = res.data.list;
        })
        .catch(error => {
          console.log(error);
        });
    },
    review() {
      console.log("复核");
    },
    details() {
      console.log("详情");
    }
  },
  created() {
    document.title = "科研管理系统 - 主页";
    if (!localStorage.token) {
      let code = this.getUrlKey("code");
      if (code) {
        console.log(code, 111111111);
        this.$api.LoginWithOpenId(code).then(res => {
          console.log(res, "res```````");
          localStorage.personnel = JSON.stringify(res.data.人员);
          let token_type = res.data.token_type;
          let access_token = res.data.access_token;
          localStorage.token = `${token_type} ${access_token}`;
          console.log(localStorage.token, "localStorage.token");
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
  padding: 8px;
  /* background-color: antiquewhite; */
}
.box {
  display: flex;
  justify-content: space-between;
  margin: 10px 0;
}
.box > div {
  width: 60px;
  height: 60px;
  border: 4px solid #7bbfea;
  border-radius: 50%;
  color: #224b8f;
  background-color: #d9d6c3;
  font-size: 12px;
}
.box > div > h3 {
  margin-bottom: 0;
}
.list {
  width: 100%;
  border: 1px solid #ccc;
}
/* .backlogList{
  height: 140px;
  overflow: auto;
} */
.audit{
  padding: 4px 2px;
  text-align: left;
}

.buttom {
  text-align: right;
}
.buttomBtn {
  margin-right: 6px;
}
.backlogBox {
  padding: 10px;
  background-color: #fff;
  margin-top: 10px;
}
.backlogBox > h3 {
  margin: 0;
  font-size: 18px;
}
.backlog {
  display: flex;
  justify-content: space-between;
  background-color: #eceff4;
  font-size: 14px;
}
.backlog > span {
  padding: 5px 0;
}
.content{
  padding: 6px;
}
.content > p {
  font-size: 14px;
  margin: 0;
}
.iconfont {
  font-size: 18px;
  color: #d4237a;
  padding-right: 2px;
}
.footer {
  height: 60px;
}
</style>
