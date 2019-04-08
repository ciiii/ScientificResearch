<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-huiyi"></i>参会信息
    </div>
    <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
      <ul class="backContentTop" @click="goMeetingDetails(item.编号)">
        <li>{{item.会议名称}}</li>
        <li>
          <span>学科类型：</span>
          <span>{{item.学科类型}}</span>
        </li>
        <li>
          <span>主办单位：</span>
          <span>{{item.会议主办单位}}</span>
        </li>
        <li>
          <span>申请人：</span>
          <span>{{item.申请人姓名}}</span>
        </li>
        <li>
          <span>申请人部门：</span>
          <span>{{item.申请人部门名称}}</span>
        </li>
        <li>
          <span>会议地址：</span>
          <span>{{item.会议地址}}</span>
        </li>
        <li>
          <span>当前步骤：</span>
          <span id="contentSpan">{{item.步骤名称}} - {{item.步骤状态说明}}</span>
        </li>
        <li>
          <span>是否反馈：</span>
          <span
            :style="{'color':(item.是否反馈过 === flag ? '#31BD5D' : '#FF4444')}"
          >{{formatState(item.是否反馈过)}}</span>
        </li>
        <li>
          <span>审核进度：</span>
          <span>{{item.审核进度}}</span>
        </li>
        <li>
          <span>开始时间：</span>
          <span>
            <i class="icon iconfont icon-shijian1"></i>
            {{startTime(item.会议开始时间)}}
          </span>
        </li>
      </ul>
      <span class="audit" @click="goMeetingsList">反馈列表</span>
    </div>
    <ReturnBtn/>
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
      finished: false,
      flag: true
    };
  },
  mounted() {
    this.getLecture();
  },
  methods: {
    getLecture() {
      this.$http.getMeetingList(this.index, this.size).then(res => {
        console.log(res, "resssss");
        this.lectureList = res.data.list;
      });
    },
    // 状态显示转换
    formatState(item) {
      return item === true ? "已反馈" : item === false ? "未反馈" : "未知";
    },
    // 截取时间
    startTime(item) {
      if (item != null) {
        return item.slice(0, 10);
      } else {
        return "待定";
      }
    },
    conversionTime(item) {
      if (item != null) {
        return item;
      } else {
        return "待定";
      }
    },
    // 跳转参会反馈列表
    goMeetingsList() {
      this.$router.push("/meetingFeedbackList");
    },
    // 跳转参会详情
    goMeetingDetails(item) {
      this.$router.push({
        path: "/meetingDetails",
        name: "meetingDetails",
        params: {
          item: item
        }
      });
    },
    //跳转反馈列表
    goFeedbackList() {
      this.$router.push("/feedbackList");
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
    background-color: #fff;
    box-shadow: 6px 6px 6px #888888;
    margin-bottom: 20px;
    .backContentTop {
      font-size: 14px;
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
        i {
          color: rgb(6, 167, 6);
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
    }
    .audit {
      display: inline-block;
      width: 48px;
      font-size: 12px;
      padding: 8px 12px;
      background-color: #07c160;
      border-radius: 5px;
      color: #fff;
    }
  }
}
</style>

