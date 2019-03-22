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
            {{startTime(item.会议开始时间)}}
          </span>
        </li>
      </ul>
      <span class="audit" @click="goMeetingsList">反馈列表</span>
    </div>
    <van-popup v-model="show" class="popup">
      <van-tabs v-model="active" swipeable>
        <van-tab title="参加会议详情">
          <ul class="servicel">
            <h4>基本信息</h4>
            <li class="title">
              <span>会议名称</span>
              <p>{{this.servicelList.会议名称}}</p>
            </li>
            <li>
              <span>主办单位：</span>
              <span>{{this.servicelList.会议主办单位}}</span>
            </li>
            <li>
              <span>承办单位：</span>
              <span>{{this.servicelList.会议承办单位}}</span>
            </li>
            <li>
              <span>申请人：</span>
              <span>{{this.servicelList.申请人姓名}}</span>
            </li>
            <li>
              <span>申请人部门：</span>
              <span>{{this.servicelList.申请人部门名称}}</span>
            </li>
            <li>
              <span>研讨领域：</span>
              <span>{{this.servicelList.研讨领域}}</span>
            </li>
            <li>
              <span>学科类型：</span>
              <span>{{this.servicelList.学科类型}}</span>
            </li>
            <li>
              <span>开始时间：</span>
              <span>{{startTime(this.servicelList.会议开始时间)}}</span>
            </li>
            <li>
              <span>结束时间：</span>
              <span>{{startTime(this.servicelList.会议结束时间)}}</span>
            </li>
            <li>
              <span>会议网址：</span>
              <a :href="this.servicelList.会议网址">{{this.servicelList.会议网址}}</a>
            </li>
            <li>
              <span>会议地址：</span>
              <span>{{this.servicelList.会议地址}}</span>
            </li>
            <li>
              <span>往返时间：</span>
              <span>{{this.servicelList.往返时间}} 天</span>
            </li>
            <h4>会议简介及申请理由</h4>
            <li>
              <span>会议简介：</span>
              <span>{{this.servicelList.会议简介及申请理由}}</span>
            </li>
            <li></li>
            <h4>参会相关文件</h4>
            <li>参会相关文件：{{this.servicelList.参会相关文件路径}}</li>
          </ul>
        </van-tab>
        <van-tab title="申请记录">
          <ul v-for="(item,key) in auditList" :key="key" class="audit">
            <li>
              <span>步骤名称：</span>
              <span>{{item.名称}}</span>
            </li>
            <li>
              <span>处理人：</span>
              <span>{{item.姓名}}</span>
            </li>
            <li>
              <span>状态：</span>
              <span :style="{'color':(item.状态说明 == flag ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
            </li>
            <li>
              <span>执行时间：</span>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{conversionTime(item.执行时间)}}
              </span>
            </li>
            <li>
              <span>备注：</span>
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
    document.title = "参会信息";
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
      var para = {
        参加会议编号: item
      };
      // 获取参会详情
      this.$http.getMeetingDetails(para).then(res => {
        // console.log(res, "222");
        this.servicelList = res.data.参加会议详情;
        this.auditList = res.data.申请情况;
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

