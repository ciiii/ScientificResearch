<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-fankui"></i>参会反馈
    </div>
    <div class="backContentBox" v-for="(item, key) in FeedbackList" :key="key">
      <ul class="backContentTop" @click="goFeedbackDetails(item.编号)">
        <li>{{item.会议名称}}</li>
        <li>
          <i class="icon iconfont icon-you"></i>
        </li>
      </ul>
      <ul>
        <li>主办单位：{{item.会议主办单位}}</li>
        <li>会议地址：{{item.会议地址}}</li>
        <li>
          <span>申请人：{{item.申请人姓名}}</span>
          <span>申请人部门：{{item.申请人部门名称}}</span>
        </li>
        <li>学科类型：{{item.学科类型}}</li>
        <li>参会人数：{{item.参会人数}} 人</li>
        <li>
          <span class="contentLi">{{item.步骤名称}} - {{item.步骤状态说明}}</span>
          <span class="contentSpan">{{item.审核进度}}</span>
        </li>
        <li>
          <span>
            <i class="icon iconfont icon-shijian1"></i>
            {{startTime(item.开始时间)}}
          </span>
        </li>
      </ul>
    </div>
    <van-popup v-model="show" class="popup">
      <van-tabs v-model="active" swipeable>
        <van-tab title="会议反馈详情">
          <ul class="servicel">
            <h4>会议反馈基本信息</h4>
            <li>
              <span>时长：{{this.FeedbackDetails.活动持续分钟}} 分钟</span>
              <span>人数：{{this.FeedbackDetails.参会人数}} 人</span>
            </li>
            <h4>参会总结</h4>
            <li>参会总结：{{this.FeedbackDetails.参会总结}}</li>
            <h4>会议反馈文件</h4>
            <li>会议反馈文件：{{this.FeedbackDetails.会议反馈文件路径}}</li>

            <h4>会议基本信息</h4>
            <li>{{this.FeedbackDetails.会议名称}}</li>
            <li>主办单位：{{this.FeedbackDetails.会议主办单位}}</li>
            <li>承办单位：{{this.FeedbackDetails.会议承办单位}}</li>
            <li>
              <span>申请人：{{this.FeedbackDetails.申请人姓名}}</span>
              <span>申请人部门：{{this.FeedbackDetails.申请人部门名称}}</span>
            </li>
            <li>
              <span>研讨领域：{{this.FeedbackDetails.研讨领域}}</span>
              <span>学科类型：{{this.FeedbackDetails.学科类型}}</span>
            </li>
            <li>往返时间：{{this.FeedbackDetails.往返时间}} 天</li>
            <li>
              开始时间：
              {{startTime(this.FeedbackDetails.会议开始时间)}}
            </li>
            <li>
              结束时间：
              {{startTime(this.FeedbackDetails.会议结束时间)}}
            </li>
            <li>
              会议网址：
              <a :href="this.FeedbackDetails.会议网址">{{this.FeedbackDetails.会议网址}}</a>
            </li>
            <li>会议地址：{{this.FeedbackDetails.会议地址}}</li>

            <h4>参会相关文件</h4>
            <li>参会相关文件：{{this.FeedbackDetails.参会相关文件路径}}</li>
          </ul>
        </van-tab>
        <van-tab title="反馈申请记录">
          <ul v-for="(item,key) in auditList" :key="key" class="audit">
            <li>步骤名称：{{item.名称}}</li>
            <li>处理人：{{item.姓名}}</li>
            <li class="state">
              <span :style="{'color':(item.状态说明 == flag ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{conversionTime(item.执行时间)}}
              </span>
            </li>
            <li>备注：{{item.备注}}</li>
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
      index: 1,
      size: 5,
      loading: false,
      finished: false,
      FeedbackList: [],
      FeedbackDetails: [],
      auditList: [],
      show: false,
      active: 0,
      flag: "审核通过"
    };
  },
  created() {
    document.title = "参会反馈列表";
  },
  mounted() {
    this.getFeedback();
  },
  methods: {
    getFeedback() {
      this.$http.getMeetingFeedbackList(this.index, this.size).then(res => {
        // console.log(res, "333444");
        this.FeedbackList = res.data.list;
      });
    },
    onLoad() {
      // 异步更新数据
      setTimeout(() => {
        for (let i = 0; i < 0; i++) {
          this.FeedbackList.push(this.FeedbackList.length + 1);
        }
        // 加载状态结束
        this.loading = false;
        // 数据全部加载完成
        if (this.FeedbackList.length >= 0) {
          this.finished = true;
        }
      }, 500);
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
        return "暂无";
      }
    },
    conversionTime(item) {
      if (item === null) {
        return "暂无";
      } else {
        return item;
      }
    },
    //反馈详情
    goFeedbackDetails(item) {
      var para = {
        参加会议反馈编号: item
      };
      this.$http.getMeetingFeedbackDetails(para).then(res => {
        // console.log(res, "ffff");
        this.FeedbackDetails = res.data.参加会议反馈详情;
        this.auditList = res.data.审核情况;
      });
      this.show = true;
    },
    // 关闭弹窗
    backtrack() {
      this.show = false;
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
        flex-grow: 1;
      }
    }
    ul {
      font-size: 14px;
      li {
        display: flex;
        padding: 5px 0;
        .contentLi {
          color: #07c160;
        }
        .contentSpan {
          color: #ff976a;
        }
        span {
          width: 50%;
          justify-content: space-between;
          i {
            color: rgb(6, 167, 6);
          }
        }
        span:nth-child(2) {
          margin-left: 10px;
          text-align: center;
        }
      }
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
        padding: 5px 0;
        display: flex;
        span {
          width: 50%;
          justify-content: space-between;
        }
        i {
          color: rgb(6, 167, 6);
        }
      }
    }
    .backtrack {
      font-size: 14px;
      color: #fff;
      width: 60px;
      height: 20px;
      padding: 5px;
      text-align: center;
      position: fixed;
      bottom: 20px;
      right: 20px;
      border-radius: 20px;
      background-color: rgba(28, 134, 238, 0.5);
    }
  }
}
</style>
