<template>
  <div>
    <van-pull-refresh v-model="isDownLoading" @refresh="onDownRefresh">
      <van-list
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoad"
        class="box"
      >
        <h3>科研新闻</h3>
        <ul class="A_News" v-for="(item, key) in list" :key="key" @click="newsDetails(item.编号)">
          <li>
            <p>{{item.通知名称}}</p>
          </li>
          <li>
            <i class="icon iconfont icon-tongzhi"></i>
            <span>{{item.通知类型}}</span>
            {{startTime(item.建立时间)}}
          </li>
        </ul>
      </van-list>
    </van-pull-refresh>
    <ReturnBtn/>
    <ReturnTop/>
  </div>
</template>
<script>
export default {
  inject: ["reload"],
  data() {
    return {
      loading: false, //是否处于加载状态
      finished: false, //是否已加载完所有数据
      index: 1,
      size: 15,
      total: 0,
      isDownLoading: false,
      list: [],
      total: null
    };
  },
  methods: {
    onLoad() {
      var code = JSON.parse(localStorage.getItem("personnel"));
      var para = {
        人员编号: code.编号,
        index: this.index,
        size: this.size
      };
      this.$http.getToViewNewsList(para).then(res => {
        this.total = res.data.total;
        const data = this.list;
        this.list = data.concat(res.data.list);
        this.loading = false;
        this.index++;
        if (this.list.length >= this.total) {
          this.finished = true;
        }
      });
    },
    onDownRefresh() {
      setTimeout(() => {
        this.reload();
        this.isDownLoading = false;
      }, 1000);
    },
    newsDetails(item) {
      this.$router.push({
        path: "/KYNewsDetails",
        name: "KYNewsDetails",
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
.box {
  background-color: #fff;
}
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
