<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-shouquanicon"></i>著作管理
    </div>
    <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
      <ul class="backContentTop" @click="goDetails(item.编号)">
        <li>{{item.著作名称}}</li>
        <li>
          <span>出版社名称：</span>
          <span>{{item.出版社名称}}</span>
        </li>
        <li>
          <span>著作类型：</span>
          <span>{{item.著作类型}}</span>
        </li>
        <li>
          <span>主编：</span>
          <span>{{item.主编}}</span>
        </li>
        <li>
          <span>年度：</span>
          <span>{{item.年度}}</span>
        </li>
        <li>
          <span>当前步骤：</span>
          <span id="contentSpan">{{item.步骤名称}} - {{item.步骤状态说明}}</span>
        </li>
        <li>
          <span>审核进度：</span>
          <span :style="{'color':(item.审核进度 == flag ? '#31BD5D' : '#FF976A')}">{{item.审核进度}}</span>
        </li>
        <li>
          <span>出版日期：</span>
          <span>{{startTime(item.著作出版日期)}}</span>
        </li>
      </ul>
      <span class="audit" @click="audit(item)" v-show="isShow">审核</span>
    </div>
    <van-popup v-model="show" class="popup">
      <Audit :message="message" @getMessage="getMessage"></Audit>
    </van-popup>
    <ReturnBtn/>
  </van-list>
</template>
<script>
import Audit from "@/components/audit/audit";
export default {
  components: {
    Audit
  },
  data() {
    return {
      lectureList: [],
      index: 1,
      size: 5,
      loading: false,
      finished: false,
      flag: "已完成-审核通过",
      show: false,
      isShow: false,
      message: ""
    };
  },
  mounted() {
    this.getPaper();
  },
  methods: {
    // 子组件方法
    getMessage() {
      this.show = false;
    },
    getPaper() {
      this.$http.getWorkAllList(this.index, this.size).then(res => {
        console.log(res);
        this.lectureList = res.data.list;
        this.lectureList.forEach((item, index) => {
          if (item.步骤状态说明 === "待审核") {
            this.isShow = true;
          }
        });
      });
    },
    // 查看详情
    goDetails(item) {
      this.$router.push({
        path: "/workDetails",
        name: "workDetails",
        params: {
          item: item
        }
      });
    },
    audit(item) {
      this.message = item;
      this.show = true;
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
    padding: 8px 15px;
    border: 1px dashed #ccc;
    font-size: 14px;
    background-color: #fff;
    box-shadow: 6px 6px 6px #ccc;
    margin-bottom: 20px;
    .backContentTop {
      li {
        padding: 4px 0;
        span:nth-child(1) {
          color: #888;
        }
        span:nth-child(2) {
          color: #5a5a5a;
        }
        #contentSpan {
          color: #ff976a;
        }
      }
      li:nth-child(1) {
        font-weight: 800;
        margin: 10px 0;
        color: #1296db;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
      li:nth-child(2) {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
    }
    .audit {
      display: inline-block;
      width: 26px;
      font-size: 12px;
      padding: 5px 12px;
      background-color: #07c160;
      border-radius: 5px;
      color: #fff;
    }
  }
  .popup {
    width: 85%;
  }
}
</style>
