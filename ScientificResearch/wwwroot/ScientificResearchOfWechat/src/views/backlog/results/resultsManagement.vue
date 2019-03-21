<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-gerenhuojiang"></i>获奖管理
    </div>
    <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
      <ul class="backContentTop" @click="goDetails(item.编号)">
        <li>{{item.获奖名称}}</li>
        <li>
          <i class="icon iconfont icon-you"></i>
        </li>
      </ul>
      <ul>
        <li>获奖级别：{{item.获奖级别}}</li>
        <li>获奖类别：{{item.获奖类别}}</li>
        <li>获奖等级：{{item.获奖等级}}</li>
        <li>颁奖单位：{{item.颁奖单位}}</li>
        <li>第一发明人：{{item.第一发明人}}</li>
        <li>第一完成人：{{item.第一完成人}}</li>
        <li>获奖日期：{{startTime(item.获奖日期)}}</li>
        <li>年度：{{item.年度}}</li>
        <li class="contentSpan">审核进度：{{item.步骤名称}} - {{item.步骤状态说明}}</li>
        <li>
          <span :style="{'color':(item.审核进度 == flag ? '#31BD5D' : '#FF976A')}">当前步骤：{{item.审核进度}}</span>
          <span @click="audit(item)" v-show="isShow">审核</span>
        </li>
      </ul>
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
  created() {
    document.title = "获奖管理";
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
      this.$http.getResultsAllList(this.index, this.size).then(res => {
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
        path: "/resultsDetails",
        name: "resultsDetails",
        params: {
          item: item
        }
      });
    },
    audit(item) {
      this.message = item;
      this.show = true;
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
    },
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
      li {
        display: flex;
        padding: 4px 0;
        span:nth-child(1) {
          flex-grow: 1;
        }
        span:nth-child(2) {
          font-size: 12px;
          padding: 5px 12px;
          background-color: #07c160;
          border-radius: 5px;
          color: #fff;
        }
      }
      .contentSpan {
        color: #ff976a;
      }
    }
  }
  .popup {
    width: 85%;
  }
}
</style>
