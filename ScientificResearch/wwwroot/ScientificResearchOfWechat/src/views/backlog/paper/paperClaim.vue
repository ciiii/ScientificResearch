<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-huiyi"></i>论文未认领列表
    </div>
    <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
      <ul class="backContentTop" @click="goDetails(item.编号)">
        <li>{{item.论文标题}}</li>
        <li>
          <i class="icon iconfont icon-you"></i>
        </li>
      </ul>
      <ul>
        <li>刊物名称：{{item.刊物名称}}</li>
        <li>在线日期：{{startTime(item.论文Online日期)}}</li>
        <li>正式出版日期：{{startTime(item.论文正式出版日期)}}</li>
        <li>
          <span>第一作者:{{item.第一作者}}</span>
          <span class="auditBtn" @click="goMeetingsList">论文认领</span>
        </li>
      </ul>
    </div>
  </van-list>
</template>
<script>
export default {
  data() {
    return {
      lectureList: [],
      index: 1,
      size: 5,
      loading: false,
      finished: false
    };
  },
  created() {
    document.title = "导入认领";
  },
  mounted() {
    this.getPaper();
  },
  methods: {
    getPaper() {
      this.$http.getPaperList(this.index, this.size).then(res => {
        // console.log(res);
        this.lectureList = res.data.list;
      });
    },
    // 查看详情
    goDetails(item) {
      this.$router.push({
        path: "/paperDetails",
        name: "paperDetails",
        params: {
          item: item
        }
      });
    },
    goMeetingsList() {
      console.log("lt-ie9");
    },
    // 截取时间
    startTime(item) {
      if (item != null) {
        return item.slice(0, 10);
      } else {
        return;
      }
    },
    onLoad() {
      // 异步更新数据
      setTimeout(() => {
        for (let i = 0; i < 0; i++) {
          this.lectureList.push(this.lectureList.length + 1);
        }
        // 加载状态结束
        this.loading = false;
        // 数据全部加载完成
        if (this.lectureList.length >= 0) {
          this.finished = true;
        }
      }, 500);
    }
  }
};
</script>
<style lang="less" scoped>
.box {
  padding: 12px;
  text-align: left;
  background-color: #f5f3fb;
  .title {
    font-size: 14px;
    padding: 10px 0;
    background-color: #fff;
    i {
      font-weight: 800;
      color: #d4237a;
      margin-right: 5px;
    }
  }
  .backContentBox {
    padding: 8px 15px;
    border: 1px dashed #ccc;
    background-color: #fff;
    box-shadow: 6px 6px 6px #888888;
    margin-bottom: 20px;
    .backContentTop {
      display: flex;
      font-weight: 800;
      li:nth-child(1) {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
        flex-grow: 1;
      }
    }
    ul {
      font-size: 14px;
      .contentLi {
        color: #07c160;
      }
      li {
        display: flex;
        padding: 4px 0;
        span:nth-child(2) {
          text-align: right;
        }
        .auditBtn {
          font-size: 12px;
          text-align: right;
          padding: 5px 12px;
          background-color: #07c160;
          border-radius: 5px;
          color: #fff;
        }
        span:nth-child(1) {
          flex-grow: 1;
          i {
            color: rgb(6, 167, 6);
          }
        }
      }
    }
  }
}
</style>
