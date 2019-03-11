<template>
  <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
    <div class="section">
      <search/>
      <swipe/>
      <div class="listBox">
        <iocnList/>
      </div>
      <van-list
        offset:300
        v-model="loading"
        :finished="finished"
        finished-text="别拉了,已经到底了···"
        @load="onLoad"
      >
        <div class="A_News_box">
          <div class="newsTitle">
            <h3>总库新闻</h3>
            <span>
              更多
              <i class="icon iconfont icon-you"></i>
            </span>
          </div>
          <div class="A_News" v-for="(item, key) in list" :key="key" @click="newsContent">
            <ul>
              <li>
                <p>{{item.标题}}</p>
              </li>
              <li>
                <span>精选</span>
                {{item.建立时间}}
              </li>
            </ul>
            <div>
              <img src="../assets/images/logo.png" alt>
            </div>
          </div>
        </div>

        <div v-show="isShow" class="A_News_box">
          <div class="newsTitle">
            <h3>科研新闻</h3>
            <span>
              更多
              <i class="icon iconfont icon-you"></i>
            </span>
          </div>
          <div class="A_News" v-for="(item, key) in list" :key="key" @click="newsContent">
            <ul>
              <li>
                <p>{{item.标题}}</p>
              </li>
              <li>
                <span>精选</span>
                {{item.建立时间}}
              </li>
            </ul>
            <div>
              <img src="../assets/images/logo.png" alt>
            </div>
          </div>
        </div>

      </van-list>
    </div>
  </van-pull-refresh>
</template>
<script>
import search from "@/components/index/search";
import swipe from "@/components/index/swipe";
import iocnList from "@/components/index/iocnList"
export default {
  name: "home",
  components: {
    search,
    swipe,
    iocnList
  },
  data() {
    return {
      isLoading: false, //控制下拉刷新的加载动画
      loading: false, //控制上拉加载的加载动画
      finished: false, //控制在页面往下移动到底部时是否调用接口获取数据
      list: [],
      index: 1,
      size: 15,
      total: 0,
      isShow:false
    };
  },
  created() {
    document.title = "入口页面";
  },
  mounted() {
    this.getPrimaryNews();
  },
  methods: {
    getPrimaryNews() {
      this.$http.getNewsList(this.index, this.size).then(res => {
        console.log(res, "res````111111");
        this.list = res.data.list;
        this.total = res.data.total;
        if( res.data.list != null){
          this.isShow = true;
        }
      });
    },
    newsContent() {
      this.$router.push("/newsContent");
      console.log("新闻详情");
    },
    // 下拉刷新
    onRefresh() {
      setTimeout(() => {
        this.getPrimaryNews();
        this.$toast("刷新成功");
        this.isLoading = false;
      }, 500);
    },
    // 上拉加载
    onLoad() {
      setTimeout(() => {
        // 加载状态结束
        // this.loading = false;
        if (this.list.length >= this.total) {
          // 加载状态结束
          this.loading = false;
          // this.finished = true;
        }
        this.finished = true;
      }, 2000);
    }
  }
};
</script>
<style lang="less" scoped>
@background-color: #f4f8fb;
@ContentColor: #fff;
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
    // box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    border-bottom: 1px solid #ccc;
    padding: 8px;
    display: flex;
    margin: 10px 0;
    ul {
      width: 90%;
      li:nth-child(1) {
        height: 40px;
        overflow: hidden;
        -webkit-line-clamp: 2;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        p {
          font-size: 14px;
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
          color: #FF976A;
          margin-right: 5px;
        }
      }
    }
    div {
      height: 60px;
      padding: 8px;
      img {
        width: 60px;
        height: 60px;
      }
    }
  }
}
</style>
