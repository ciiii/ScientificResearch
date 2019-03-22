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
            :style="{'color':(item.是否反馈过 === flag1 ? '#31BD5D' : '#FF4444')}"
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
    <van-popup v-model="show" class="popup">
      <van-tabs v-model="active" swipeable>
        <van-tab title="学术任职详情">
          <ul class="servicel">
            <h4>基本信息</h4>
            <li class="title">
              <span>活动名称</span>
              <p>{{this.servicelList.活动名称}}</p>
            </li>
            <li>
              <span>活动类型</span>
              <span>{{this.servicelList.会议类型}}</span>
            </li>
            <li>
              <span>经费</span>
              <span>{{this.servicelList.活动经费}}</span>
            </li>
            <li>
              <span>主办人部门</span>
              <span>{{this.servicelList.主办人部门名称}}</span>
            </li>
            <li>
              <span>主办人</span>
              <span>{{this.servicelList.主办人姓名}}</span>
            </li>
            <li>
              <span>开始时间</span>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{startTime(this.servicelList.开始时间)}}
              </span>
            </li>
            <li>
              <span>讲座地点</span>
              <span>{{this.servicelList.讲座地点}}</span>
            </li>
            <h4>主讲人信息</h4>
            <li>
              <span>姓名</span>
              <span>{{this.servicelList.主讲人姓名}}</span>
            </li>
            <li>
              <span>国别</span>
              <span>{{this.servicelList.主讲人国别}}</span>
            </li>
            <li>
              <span>单位</span>
              <span>{{this.servicelList.主讲人单位}}</span>
            </li>
            <li>
              <span>学位</span>
              <span>{{this.servicelList.主讲人学位}}</span>
            </li>
            <li>
              <span>职称</span>
              <span>{{this.servicelList.主讲人职称}}</span>
            </li>
            <h4>主讲的学术或技术内容概述</h4>
            <li>
              <span>内容概述</span>
              <span>{{this.servicelList.内容概述}}</span>
            </li>
          </ul>
        </van-tab>
        <van-tab title="审核记录">
          <ul v-for="(item,key) in auditList" :key="key" class="audit">
            <li>
              <span>步骤名称</span>
              <span>{{item.名称}}</span>
            </li>
            <li>
              <span>处理人</span>
              <span>{{item.姓名}}</span>
            </li>
            <li>
              <span>状态</span>
              <span :style="{'color':(item.状态说明 == flag ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
            </li>
            <li>
              <span>执行时间</span>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{startTimeB(item.执行时间)}}
              </span>
            </li>
            <li>
              <span>备注</span>
              <span>{{item.备注}}</span>
            </li>
          </ul>
        </van-tab>
      </van-tabs>
      <div class="backtrack" @click="backtrack">
        <i class="icon iconfont icon-fanhui1"></i> 返回
      </div>
    </van-popup>
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
      show: false,
      servicelList: [],
      auditList: [],
      active: 0,
      flag: "审核通过",
      flag1: true
    };
  },
  created() {
    document.title = "主办讲座列表";
  },
  mounted() {
    this.getLecture();
  },
  methods: {
    getLecture() {
      this.$http.getLectureList(this.index, this.size).then(res => {
        // console.log(res, "resssss");
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
    startTimeB(item) {
      if (item === null) {
        return "待定";
      } else {
        return item;
      }
    },
    // 跳转讲座详情
    goLectureDetails(item) {
      var para = {
        主办讲座编号: item
      };
      // 获取讲座详情
      this.$http.getLectureDetails(para).then(res => {
        this.servicelList = res.data.学术任职详情;
        this.auditList = res.data.审核情况;
      });
      this.show = true;
    },
    // 关闭弹窗
    backtrack() {
      this.show = false;
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
  .popup {
    width: 100%;
    height: 100%;
    transform: none;
    top: 0;
    left: 0;
    background-color: #f5f3fb;
    .van-tab__pane {
      padding: 10px;
      height: 100vh;
    }
    .audit,
    .servicel {
      font-size: 14px;
      padding: 10px;
      margin-bottom: 20px;
      border-bottom: 2px solid #ccc;
      background-color: #fff;
      h4 {
        margin: 5px 0;
        padding: 5px;
        color: #1296db;
        background-color: #e7e7e7;
      }
      li {
        padding: 10px 0;
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid #f2f2f2;
        p {
          width: 80%;
          color: #5a5a5a;
          margin: 0;
          text-align: right;
        }
        span:nth-child(1) {
          color: #888;
        }
        span:nth-child(2) {
          color: #5a5a5a;
        }
        i {
          color: rgb(6, 167, 6);
        }
      }
      .title span {
        display: flex;
        align-items: center;
      }
    }
    .backtrack {
      line-height: 1.6;
      font-size: 14px;
      color: #fff;
      width: 80px;
      height: 26px;
      padding: 6px;
      text-align: center;
      position: fixed;
      bottom: 60px;
      right: 20px;
      border-radius: 20px;
      background-color: rgba(28, 134, 238, 0.5);
    }
  }
}
</style>
