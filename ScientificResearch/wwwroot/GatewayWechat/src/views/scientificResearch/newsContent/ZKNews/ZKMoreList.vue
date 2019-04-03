<template>
  <van-list v-model="loading" :finished="finished" offset:10 finished-text="没有更多了" @load="onLoad">
    <h3>新闻</h3>
    <ul class="A_News" v-for="(item, key) in list" :key="key">
      <li @click="newsDetails(item)">
        <p>{{item.标题}}</p>
      </li>
      <li>
        <i class="icon iconfont icon-tongzhi"></i>
        {{startTime(item.建立时间)}}
      </li>
    </ul>
    <ReturnBtn/>
  </van-list>
</template>
<script>
export default {
  data() {
    return {
      loading: false, //是否处于加载状态
      finished: false, //是否已加载完所有数据
      index: 1,
      size: 1,
      list: [],
      total: null
    };
  },
  mounted() {
    this.getPrimaryNews();
  },
  methods: {
    getPrimaryNews() {
      // console.log(this.postInfoUp,"xx")
      var para = {
        index: 1,
        size: 10
      };
      this.$http.getNewsList(para).then(res => {
        console.log(res, "res````111111");
        this.total = res.data.total;
        this.list = res.data.list;
        // if (res.data.list != null) {
        //   this.total = res.data.total;
        //   let re = res.data.list;
        //   if (re.length != 0) {
        //     this.list = this.list.concat(re);
        //   }
        //   // 加载状态结束
        //   this.loading = false;
        //   // 数据全部加载完成
        //   if (this.list.length >= this.total) {
        //     this.finished = true;
        //   }
        // } else {
        //   this.finished = true;
        // }
      });
    },
    onLoad() {
      //   console.log("下拉刷新！");
      this.loading = false;
      //   let postInfoUp = {
      //     data: {
      //       //参数为每次访问的个数和页数
      //       index: ++this.index,
      //       size: this.size
      //     }
      //   };
      //   console.log(postInfoUp, "xx");
      //   this.getPrimaryNews(postInfoUp);
    },
    newsDetails(item) {
      this.$router.push({
        path: "/ZKNewsDetails",
        name: "ZKNewsDetails",
        params: {
          item
        }
      });
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
h3 {
  text-align: left;
  font-size: 14px;
  padding: 10px 20px;
  margin: 0;
  color: #1296db;
  background-color: #e7e7e7;
}
.A_News {
  border-bottom: 1px solid #ccc;
  padding: 10px 20px;
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
</style>
