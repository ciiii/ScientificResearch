<template>
  <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
    <div class="section">
      <search/>
      <swipe/>
      <div class="listBox">
        <ul>
          <li>
            <router-link :to="{ path: '/index' }">
              <img src="../assets/images/iocn/1.png" alt>
              <p>科研</p>
            </router-link>
          </li>
          <li>
            <img src="../assets/images/iocn/15.png" alt>
            <p>医学</p>
          </li>
          <li>
            <img src="../assets/images/iocn/17.png" alt>
            <p>考试</p>
          </li>
          <li>
            <img src="../assets/images/iocn/3.png" alt>
            <p>教学</p>
          </li>
          <li>
            <img src="../assets/images/iocn/5.png" alt>
            <p>泉方</p>
          </li>
          <li>
            <img src="../assets/images/iocn/6.png" alt>
            <p>知网</p>
          </li>
          <li>
            <img src="../assets/images/iocn/8.png" alt>
            <p>泉方</p>
          </li>
          <li>
            <img src="../assets/images/iocn/9.png" alt>
            <p>知网</p>
          </li>
        </ul>
      </div>
      <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad">
        <div class="A_News_box" v-for="item in 2" :key="item">
          <h3>A 新闻</h3>
          <div class="A_News" v-for="item in 3" :key="item">
            <ul>
              <li>
                <p>Vue 的研发及其生态建设出自一个国际化的团队,的研发及其生态建设出自一个国际化的团队,的研发及其生态建设出自一个国际化的团队</p>
              </li>
              <li>
                <span>精选</span>
                2019-02-01
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
import search from "@/components/search/search";
import swipe from "@/components/swipe/swipe";
export default {
  name: "home",
  components: {
    search,
    swipe
  },
  data() {
    return {
      isLoading: false, //控制下拉刷新的加载动画
      loading: false, //控制上拉加载的加载动画
      finished: false, //控制在页面往下移动到底部时是否调用接口获取数据
      list:[]
    };
  },
  created() {
    document.title = "主库 - 入口";
  },
  mounted() {},
  methods: {
    onRefresh() {
      setTimeout(() => {
        this.$toast("刷新成功");
        this.isLoading = false;
      }, 500);
    },
    onLoad() {
      // 异步更新数据
      setTimeout(() => {
        for (let i = 0; i < 5; i++) {
          this.list.push(this.list.length + 1);
        }
        // 加载状态结束
        this.loading = false;

        // 数据全部加载完成
        if (this.list.length >= 40) {
          this.finished = true;
        }
      }, 500);
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
      }
    }
  }
}
.A_News_box {
  margin-top: 10px;
  background-color: @ContentColor;
  padding: 8px;
  h3 {
    font-size: 14px;
    text-align: left;
    padding: 10px;
    margin: 0;
    background-color: #f5f5f5;
  }
  .A_News {
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    border-bottom: 1px solid #ccc;
    padding: 8px;
    display: flex;
    margin: 10px 0;
    ul {
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
        }
      }
      li:nth-child(2) {
        margin-top: 10px;
        font-size: 12px;
        text-align: left;
        span {
          font-size: 14px;
          font-weight: 800;
          color: #f9ad58;
          margin-right: 5px;
        }
      }
    }
    div {
      width: 60px;
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
