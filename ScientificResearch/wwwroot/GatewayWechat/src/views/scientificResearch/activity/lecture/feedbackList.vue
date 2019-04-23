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
          <i class="icon iconfont icon-fankui"></i>讲座反馈
        </div>
        <div class="backContentBox" v-for="(item, key) in FeedbackList" :key="key">
          <ul class="backContentTop" @click="goFeedbackDetails(item.编号)">
            <li>{{item.活动名称}}</li>
            <li>
              <span>会议类型：</span>
              <span>{{item.会议类型}}</span>
            </li>
            <li>
              <span>所属部门：</span>
              <span>{{item.所属部门名称}}</span>
            </li>
            <li>
              <span>主办人：</span>
              <span>{{item.主办人姓名}}</span>
            </li>
            <li>
              <span>专家：</span>
              <span>{{item.专家姓名}}</span>
            </li>
            <li>
              <span>经费：</span>
              <span>{{NumFormat(item.活动经费)}}</span>
            </li>
            <li>
              <span>结算方式：</span>
              <span>{{item.结算方式}}</span>
            </li>
            <li>
              <span>当前步骤：</span>
              <span id="contentSpan">{{item.步骤名称}} - {{item.步骤状态说明}}</span>
            </li>
            <li>
              <span>审核进度：</span>
              <span :style="{'color':(item.审核进度 == flag1 ? '#31BD5D' : '#ff976a')}">{{item.审核进度}}</span>
            </li>
            <li>
              <span>参会人数：</span>
              <span>{{item.参会人数}} 人</span>
            </li>
            <li>
              <span>开始时间：</span>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{startTime(item.开始时间)}}
              </span>
            </li>
          </ul>
        </div>
      </van-list>
    </van-pull-refresh>
    <van-popup v-model="show" class="popup">
      <van-tabs v-model="active" swipeable>
        <van-tab title="讲座反馈详情">
          <ul class="servicel">
            <h4>讲座反馈基本信息</h4>
            <li>
              <span>时长</span>
              <span>{{this.FeedbackDetails.活动持续分钟}} 分钟</span>
            </li>
            <li>
              <span>人数</span>
              <span>{{this.FeedbackDetails.参会人数}} 人</span>
            </li>
            <h4>讲座基本信息</h4>
            <li>
              <span>活动名称</span>
              <span>{{this.FeedbackDetails.活动名称}}</span>
            </li>
            <li>
              <span>会议类型</span>
              <span>{{this.FeedbackDetails.会议类型}}</span>
            </li>
            <li>
              <span>经费</span>
              <span>{{NumFormat(this.FeedbackDetails.活动经费)}}</span>
            </li>
            <li>
              <span>活动对象</span>
              <span>{{this.FeedbackDetails.活动对象}}</span>
            </li>
            <li>
              <span>主办人部门</span>
              <span>{{this.FeedbackDetails.主办人部门名称}}</span>
            </li>
            <li>
              <span>主办人</span>
              <span>{{this.FeedbackDetails.主办人姓名}}</span>
            </li>
            <li>
              <span>内容概述</span>
              <span>{{this.FeedbackDetails.内容概述}}</span>
            </li>
            <li>
              <span>执行时间</span>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{startTime(this.FeedbackDetails.开始时间)}}
              </span>
            </li>
            <li>
              <span>讲座地点</span>
              <span>{{this.FeedbackDetails.讲座地点}}</span>
            </li>
            <h4>主讲人信息</h4>
            <li>
              <span>姓名</span>
              <span>{{this.FeedbackDetails.主讲人姓名}}</span>
            </li>
            <li>
              <span>国别</span>
              <span>{{this.FeedbackDetails.主讲人国别}}</span>
            </li>
            <li>
              <span>单位</span>
              <span>{{this.FeedbackDetails.主讲人单位}}</span>
            </li>
            <li>
              <span>学位</span>
              <span>{{this.FeedbackDetails.主讲人学位}}</span>
            </li>
            <li>
              <span>职称</span>
              <span>{{this.FeedbackDetails.主讲人职称}}</span>
            </li>
            <h4>经费信息</h4>
            <li>
              <span>专家</span>
              <span>{{this.FeedbackDetails.专家姓名}}</span>
            </li>
            <li>
              <span>身份证</span>
              <span>{{this.FeedbackDetails.专家身份证号码}}</span>
            </li>
            <li>
              <span>护照</span>
              <span>{{this.FeedbackDetails.专家护照号}}</span>
            </li>
            <li>
              <span>联系方式</span>
              <span>{{this.FeedbackDetails.专家联系方式}}</span>
            </li>
            <li>
              <span>费用</span>
              <span>{{NumFormat(this.FeedbackDetails.专家讲课费金额)}}</span>
            </li>
            <li>
              <span>结算方式</span>
              <span>{{this.FeedbackDetails.结算方式}}</span>
            </li>
          </ul>
        </van-tab>
        <van-tab title="审核情况">
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
    <ReturnTop/>
  </div>
</template>
<script>
import { NumFormat } from "@/assets/js/common/filter.js";
export default {
  inject: ["reload"],
  data() {
    return {
      index: 1,
      size: 15,
      total: 0,
      isDownLoading: false,
      loading: false,
      finished: false,
      FeedbackList: [],
      FeedbackDetails: [],
      auditList: [],
      show: false,
      active: 0,
      flag: "审核通过",
      flag1: "已完成-审核通过"
    };
  },
  methods: {
    onLoad() {
      this.$http.getFeedbackList(this.index, this.size).then(res => {
        this.total = res.data.total;
        const data = this.FeedbackList;
        this.FeedbackList = data.concat(res.data.list);
        this.loading = false;
        this.index++;
        if (this.FeedbackList.length >= this.total) {
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
    //转换金额格式
    NumFormat(item) {
      return NumFormat(item);
    },
    //反馈详情
    goFeedbackDetails(item) {
      var para = {
        讲座反馈编号: item
      };
      this.$http.getFeedbackDetails(para).then(res => {
        // console.log(res, "ffff");
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
    font-size: 14px;
    padding: 8px 15px;
    border: 1px dashed #ccc;
    background-color: #fff;
    box-shadow: 6px 6px 6px #888888;
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
        color: #1296db;
        margin: 10px 0;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
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
  text-align: left;
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
</style>
