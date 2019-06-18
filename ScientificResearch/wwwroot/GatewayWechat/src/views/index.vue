<template>
  <div>
    <div class="nav">
      <!-- <img src="@/assets/images/iocn/logo.png" alt="科研logo"> -->
      <img :src="url+this.Logo || this.defaultImg">
    </div>
    <section>
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
            <span @click="newsItem(item.编号)">
              <i class="iocn iconfont icon-tongzhi"></i>
              {{item.通知名称}}
            </span>
          </van-swipe-item>
        </van-swipe>
      </div>
      <div class="box">
        <div>
          <div class="boxI">
            <i class="iocn iconfont icon-diyiming"></i>
          </div>
          <div class="boxContent">
            <p>第一作者</p>
            <span>10</span>
          </div>
        </div>
        <div>
          <div class="boxI">
            <i class="iocn iconfont icon-xiangmu1"></i>
          </div>
          <div class="boxContent">
            <p>横项</p>
            <span>15</span>
          </div>
        </div>
        <div>
          <div class="boxI">
            <i class="iocn iconfont icon-xiangmu"></i>
          </div>
          <div class="boxContent">
            <p>纵项</p>
            <span>17</span>
          </div>
        </div>
        <div>
          <div class="boxI">
            <i class="iocn iconfont icon-feiyong"></i>
          </div>
          <div class="boxContentX">
            <p>费用</p>
            <span>3728元</span>
          </div>
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
    </section>
    <navFooter/>
  </div>
</template>
<script>
import toDoList from "@/components/toDoList/toDoList";
import navFooter from "@/components/footer/footer";
export default {
  // inject: ["reload"],
  components: {
    toDoList,
    navFooter
  },
  data() {
    return {
      isLoading: false,
      index: 1,
      size: 15,
      KYList: [],
      url:
        process.env.NODE_ENV === "development"
          ? "http://192.168.0.99:63739"
          : "",
      Logo: "",
      HospitalInformation: JSON.parse(
        localStorage.getItem("HospitalInformation")
      ),
      defaultImg: require("@/assets/images/iocn/logo.png")
    };
  },
  created() {
    this.Logo = this.HospitalInformation.Logo;
    if (!localStorage.token) {
      let code = this.getUrlKey("code");
      if (code) {
        this.$http.LoginWithOpenId(code).then(res => {
          // console.log(res, "res```````");
          localStorage.personnel = JSON.stringify(res.data.人员);
          localStorage.token = `${res.data.token_type} ${
            res.data.access_token
          }`;
          // console.log(localStorage.token, "localStorage.token  ????????");
          this.$refs.toDoList.getBacklog();
        });
      } else {
        this.$router.push("/login");
        this.$notify("没有权限，请绑定！");
      }
    }
  },
  mounted() {
    var code = JSON.parse(localStorage.getItem("personnel"));
    var para = {
      人员编号: code.编号,
      index: this.index,
      size: this.size
    };
    this.$http.getToViewNewsList(para).then(res => {
      this.KYList = res.data.list;
    });
  },
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
    more() {
      this.$router.push("/KYMoreList");
    },
    newsItem(item) {
      this.$router.push({
        path: "/KYNewsDetails",
        name: "KYNewsDetails",
        params: {
          item
        }
      });
    }
  }
};
</script>
<style lang="less" scoped>
.nav {
  background-color: #fff;
  img {
    height: 40px;
    padding: 5px 0;
  }
}
section {
  background-color: #f4f8fb;
  .backlogBox {
    padding: 10px;
    background-color: #fff;
    margin: 10px 0;
    .backlog {
      display: flex;
      justify-content: space-between;
      font-size: 14px;
      margin-bottom: 10px;
      span {
        padding: 5px 0;
      }
    }
    .backlogContent {
      height: 32px;
      font-size: 14px;
      text-align: left;
      background-color: #fffbe8;
      span {
        padding: 5px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
        color: #ed6a0c;
        border-bottom: 1px solid #fff;
        i {
          padding-right: 5px;
        }
      }
    }
  }
  .box {
    display: flex;
    justify-content: space-between;
    padding: 0 8px;
    background-color: #fff;
    div {
      display: flex;
      font-size: 12px;
      .boxI {
        line-height: 5;
      }
      .boxContent {
        flex-direction: column;
        padding: 0 10px;
        margin: 10px 0;
        border-right: 1px solid #ccc;
        p {
          font-size: 14px;
          color: #a3a3a3;
          margin: 5px;
        }
        span {
          font-size: 16px;
          color: #303030;
          font-weight: bold;
        }
      }
      .boxContentX {
        border: none;
        flex-direction: column;
        margin: 10px 5px;
        p {
          font-size: 14px;
          color: #a3a3a3;
          margin: 5px;
        }
        span {
          font-size: 16px;
          color: #303030;
          font-weight: bold;
        }
      }
    }
  }
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
.icon-diyiming {
  color: #ffaa15;
}
.icon-xiangmu1 {
  color: #04a1e2;
}
.icon-xiangmu {
  color: #a67feb;
}
.icon-feiyong {
  color: #00d6cf;
}
</style>
