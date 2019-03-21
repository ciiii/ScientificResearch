<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-fankui"></i>讲座反馈
    </div>
    <div class="backContentBox" v-for="(item, key) in FeedbackList" :key="key">
      <ul class="backContentTop" @click="goFeedbackDetails(item.编号)">
        <li>【{{item.会议类型}}】{{item.活动名称}}</li>
        <li>
          <i class="icon iconfont icon-you"></i>
        </li>
      </ul>
      <ul>
        <li>
          <span>所属部门：{{item.所属部门名称}}</span>
          <span>主办人：{{item.主办人姓名}}</span>
        </li>
        <li>
          <span>{{item.专家姓名}}</span>
        </li>
        <li>
          <span>经费：￥{{item.活动经费}}</span>
          <span>{{item.结算方式}}</span>
        </li>
        <li>
          <span class="contentLi">{{item.步骤名称}} - {{item.步骤状态说明}}</span>
          <span class="contentSpan">{{item.审核进度}}</span>
        </li>
        <li>
          <span>参会人数：{{item.参会人数}} 人</span>
          <span>
            <i class="icon iconfont icon-shijian1"></i>
            {{startTime(item.开始时间)}}
          </span>
        </li>
      </ul>
    </div>

    <van-popup v-model="show" class="popup">
      <van-tabs v-model="active" swipeable>
        <van-tab title="讲座反馈详情">
          <ul class="servicel">
            <h4>讲座反馈基本信息</h4>
            <li>
              <span>时长：{{this.FeedbackDetails.活动持续分钟}} 分钟</span>
              <span>人数：{{this.FeedbackDetails.参会人数}} 人</span>
            </li>

            <h4>讲座基本信息</h4>
            <li>【{{this.FeedbackDetails.会议类型}}】{{this.FeedbackDetails.活动名称}}</li>
            <li>
              <span>经费：￥{{this.FeedbackDetails.活动经费}}</span>
              <span>活动对象：{{this.FeedbackDetails.活动对象}}</span>
            </li>
            <li>
              <span>主办人部门：{{this.FeedbackDetails.主办人部门名称}}</span>
              <span>主办人：{{this.FeedbackDetails.主办人姓名}}</span>
            </li>
            <li>内容概述：{{this.FeedbackDetails.内容概述}}</li>
            <li>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{startTime(this.FeedbackDetails.开始时间)}}
              </span>
            </li>
            <li>讲座地点：{{this.FeedbackDetails.讲座地点}}</li>

            <h4>主讲人信息</h4>
            <li>
              <span>姓名：{{this.FeedbackDetails.主讲人姓名}}</span>
              <span>国别：{{this.FeedbackDetails.主讲人国别}}</span>
            </li>
            <li>
              <span>单位：{{this.FeedbackDetails.主讲人单位}}</span>
              <span>学位：{{this.FeedbackDetails.主讲人学位}}</span>
            </li>
            <li>职称:{{this.FeedbackDetails.主讲人职称}}</li>
            <h4>经费信息</h4>
            <li>
              <span>专家：{{this.FeedbackDetails.专家姓名}}</span>
              <span>身份证：{{this.FeedbackDetails.专家身份证号码}}</span>
            </li>
            <li>
              <span>护照：{{this.FeedbackDetails.专家护照号}}</span>
              <span>联系方式：{{this.FeedbackDetails.专家联系方式}}</span>
            </li>
            <li>
              <span>费用：￥ {{this.FeedbackDetails.专家讲课费金额}}</span>
              <span>{{this.FeedbackDetails.结算方式}}</span>
            </li>
          </ul>
        </van-tab>
        <van-tab title="审核情况">
          <ul v-for="(item,key) in auditList" :key="key" class="audit">
            <li>步骤名称：{{item.名称}}</li>
            <li>处理人：{{item.姓名}}</li>
            <li class="state">
              <span :style="{'color':(item.状态说明 == flag ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{startTimeB(item.执行时间)}}
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
    document.title = "讲座反馈列表";
  },
  mounted() {
    this.getFeedback();
  },
  methods: {
    getFeedback() {
      this.$http.getFeedbackList(this.index, this.size).then(res => {
        console.log(res, "333444");
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
    startTimeB(item) {
      if (item === null) {
        return "待定";
      } else {
        return item;
      }
    },
    //反馈详情
    goFeedbackDetails(item) {
      var para = {
        讲座反馈编号: item
      };
      this.$http.getFeedbackDetails(para).then(res => {
        console.log(res, "ffff");
        this.FeedbackDetails = res.data.讲座反馈详情;
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
        span:nth-child(2) {
          text-align: right;
          i {
            color: rgb(6, 167, 6);
          }
        }
        span:nth-child(1) {
          flex-grow: 1;
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
