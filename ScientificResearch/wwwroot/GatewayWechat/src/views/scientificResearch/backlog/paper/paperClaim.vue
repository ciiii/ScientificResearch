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
        <div class="title">
          <i class="icon iconfont icon-lunwentimu"></i>论文未认领列表
        </div>
        <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
          <ul class="bacnButtom" @click="goDetails(item.编号)">
            <li>{{item.论文标题}}</li>
            <li>
              <span>刊物名称：</span>
              <span>{{item.刊物名称}}</span>
            </li>
            <li>
              <span>在线日期：</span>
              <span>{{startTime(item.论文Online日期)}}</span>
            </li>
            <li>
              <span>正式出版日期：</span>
              <span>{{startTime(item.论文正式出版日期)}}</span>
            </li>
            <li>
              <span>第一作者：</span>
              <span>{{item.第一作者}}</span>
            </li>
          </ul>
          <div class="audit">
            <!-- 暂时不做 -->
            <!-- <span @click="goMeetingsList">论文认领</span> -->
          </div>
        </div>
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
      lectureList: [],
      index: 1,
      size: 15,
      total: 0,
      loading: false,
      finished: false,
      isDownLoading: false
    };
  },
  methods: {
    onLoad() {
      this.$http.getPaperList(this.index, this.size).then(res => {
        this.total = res.data.total;
        const data = this.lectureList;
        this.lectureList = data.concat(res.data.list);
        this.loading = false;
        this.index++;
        if (this.lectureList.length >= this.total) {
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
    // 论文认领 暂时不做
    // goMeetingsList() {
    //   console.log("lt-ie9");
    // },
    // 截取时间
    startTime(item) {
      if (item != null) {
        return item.slice(0, 10);
      } else {
        return;
      }
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
    padding: 10px;
    background-color: #fff;
    i {
      font-weight: 800;
      color: #d4237a;
      margin-right: 5px;
    }
  }
  .backContentBox {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    padding: 10px 15px;
    border: 1px dashed #ccc;
    background-color: #fff;
    box-shadow: 6px 6px 6px #ccc;
    margin-bottom: 20px;
    .bacnButtom {
      font-size: 14px;
      li {
        padding: 4px 0;
        span:nth-child(1) {
          color: #888;
        }
        span:nth-child(2) {
          color: #5a5a5a;
        }
      }
      li:nth-child(1) {
        margin: 10px 0;
        font-weight: 800;
        color: #1296db;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
      li:nth-chlid(2) {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
    }
    .audit {
      span {
        display: inline-block;
        width: 48px;
        font-size: 12px;
        padding: 5px 12px;
        background-color: #07c160;
        border-radius: 5px;
        color: #fff;
      }
    }
  }
}
</style>