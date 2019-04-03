<template>
  <div>
    <!-- <search/> -->
    <div class="nav">
      <img src="@/assets/images/iocn/homeLogo.jpg" alt="科研logo">
      <span @click="toLogin" v-if="!personnel">登 录</span>
    </div>
    <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
      <div class="section">
        <swipe/>
        <div class="listBox">
          <iocnList @getKYNews="getKYNews" @getPersonnel="getPersonnel"/>
        </div>
        <div class="A_News_box">
          <div class="newsTitle">
            <h3>新闻</h3>
            <span @click="ZKMore">
              更多
              <i class="icon iconfont icon-you"></i>
            </span>
          </div>
          <ul class="A_News" v-for="(item, key) in list" :key="key" @click="ZKNewsDetails(item)">
            <li>
              <p>{{item.标题}}</p>
            </li>
            <li>
              <i class="icon iconfont icon-tongzhi"></i>
              {{startTime(item.建立时间)}}
            </li>
          </ul>
        </div>
        <div v-show="isShow" class="A_News_box">
          <div class="newsTitle">
            <h3>科研新闻</h3>
            <span @click="KYmore">
              更多
              <i class="icon iconfont icon-you"></i>
            </span>
          </div>
          <ul
            class="A_News"
            v-for="(item, key) in KYList"
            :key="key"
            @click="KYNewsDetails(item.编号)"
          >
            <li>
              <p>{{item.通知名称}}</p>
            </li>
            <li>
              <i class="icon iconfont icon-tongzhi"></i>
              <span>{{item.通知类型}}</span>
              {{startTime(item.建立时间)}}
            </li>
          </ul>
        </div>
      </div>
    </van-pull-refresh>
    <HomeFooter/>
  </div>
</template>
<script>
// import search from "@/components/index/search";
import swipe from "@/components/index/swipe";
import iocnList from "@/components/index/iocnList";
import HomeFooter from "@/components/footer/homeFooter";
export default {
  name: "home",
  components: {
    // search,
    swipe,
    iocnList,
    HomeFooter
  },
  data() {
    return {
      isLoading: false, //控制下拉刷新的加载动画
      list: [],
      index: 1,
      size: 3,
      total: 0,
      KYList: [],
      isShow: false,
      personnel: null
    };
  },
  mounted() {
    this.getPrimaryNews();
  },
  methods: {
    toLogin() {
      if (this.personnel === null) {
        console.log(this.personnel,"sssssssssddddd")
        this.$router.push("/guidance");
      }
    },
    getPersonnel(){
      this.personnel = JSON.parse(localStorage.getItem("personnel"));
      console.log(this.personnel,">>>>>")
    },
    getPrimaryNews() {
      var para = {
        index: this.index,
        size: this.size
      };
      this.$http.getNewsList(para).then(res => {
        console.log(res, "res````111111");
        this.list = res.data.list;
        this.total = res.data.total;
      });
    },
    getKYNews() {
      var code = JSON.parse(localStorage.getItem("personnel"));
      var para = {
        人员编号: code.编号,
        index: this.index,
        size: this.size
      };
      this.$http.getToViewNewsList(para).then(res => {
        // console.log(res,"取科研新闻")
        this.KYList = res.data.list;
        this.isShow = true;
      });
    },

    ZKNewsDetails(item) {
      this.$router.push({
        path: "/ZKNewsDetails",
        name: "ZKNewsDetails",
        params: {
          item
        }
      });
    },
    ZKMore() {
      this.$router.push("/ZKMoreList");
    },
    KYNewsDetails(item) {
      this.$router.push({
        path: "/KYNewsDetails",
        name: "KYNewsDetails",
        params: {
          item
        }
      });
    },
    KYmore() {
      this.$router.push("/KYMoreList");
    },
    // 下拉刷新
    onRefresh() {
      setTimeout(() => {
        this.getPrimaryNews();
        this.$toast("刷新成功");
        this.isLoading = false;
      }, 500);
    },
    // 截取时间
    startTime(item) {
      if (item != null) {
        return item.slice(0, 10);
      }
    }
  }
};
</script>
<style lang="less" scoped>
@background-color: #f4f8fb;
@ContentColor: #fff;
.nav {
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
.section {
  background-color: @background-color;
}
.listBox {
  background-color: @ContentColor;
  margin-top: 20px;
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
        //   width:80px;
      }
    }
  }
}
.A_News_box {
  margin-top: 10px;
  background-color: @ContentColor;
  padding: 8px;
  .newsTitle {
    display: flex;
    justify-content: space-between;
    background-color: #f5f5f5;
    h3 {
      font-size: 14px;
      text-align: left;
      padding: 10px;
      margin: 0;
    }
    span {
      font-size: 14px;
      display: flex;
      align-items: center;
      i {
        font-size: 14px;
      }
    }
  }
  .A_News {
    border-bottom: 1px solid #ccc;
    padding: 8px;
    margin: 10px 0;
    li:nth-child(1) {
      overflow: hidden;
      -webkit-line-clamp: 2;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      max-height: 40px;
      p {
        font-size: 14px;
        font-weight: 400;
        margin: 0;
        line-height: 1.6;
        text-align: left;
      }
    }
    li:nth-child(2) {
      margin-top: 10px;
      font-size: 12px;
      text-align: left;
      span {
        font-size: 14px;
        font-weight: 800;
        color: #ff976a;
        margin: 0 5px;
      }
    }
  }
}
</style>
