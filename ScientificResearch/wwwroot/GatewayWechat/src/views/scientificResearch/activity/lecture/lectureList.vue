<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-jiangzuo"></i>主办讲座
    </div>
    <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
      <ul class="backContentTop" @click="goLectureDetails(item.编号)">
        <li>【{{item.会议类型}}】{{item.活动名称}}</li>
        <li>
          <span>所属部门：</span>
          <span>{{item.所属部门名称}}</span>
        </li>
        <li>
          <span>主办人：</span>
          <span>{{item.主办人姓名}}</span>
        </li>
        <li>
          <span>活动对象：</span>
          <span>{{item.活动对象}}</span>
        </li>
        <li>
          <span>经费：</span>
          <span>{{item.活动经费}}</span>
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
            {{startTime(item.开始时间)}}
          </span>
        </li>
      </ul>
      <span class="audit" @click="goFeedbackList">反馈列表</span>
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
      this.$http.getLectureList(this.index, this.size).then(res => {
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
    // 跳转讲座详情
    goLectureDetails(item) {
      this.$router.push({
        path: "lectureDetails",
        name: "lectureDetails",
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
    font-size: 14px;
    padding: 8px 15px;
    border: 1px dashed #ccc;
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
