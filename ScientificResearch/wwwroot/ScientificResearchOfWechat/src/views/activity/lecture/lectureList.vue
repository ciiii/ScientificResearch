<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-jiangzuo"></i>主办讲座
    </div>
    <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
      <ul class="backContentTop" @click="goLectureDetails(item.编号)">
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
          <span>{{item.活动对象}}</span>
        </li>
        <li>经费：￥{{item.活动经费}}</li>
        <li class="contentLi">
          <span>{{item.步骤名称}} - {{item.步骤状态说明}}</span>
          <span>{{formatState(item.是否可以反馈)}}</span>
        </li>
        <li>{{item.审核进度}}</li>
        <li>
          <span>
            <i class="icon iconfont icon-shijian1"></i>
            {{startTime(item.开始时间)}}
          </span>
          <span class="auditBtn" @click="goFeedbackList">反馈列表</span>
        </li>
      </ul>
    </div>
    <van-popup v-model="show" class="popup">
      <van-tabs v-model="active" swipeable>
        <van-tab title="学术任职详情">
          <ul class="servicel">
            <h4>基本信息</h4>
            <li>【{{this.servicelList.会议类型}}】{{this.servicelList.活动名称}}</li>
            <li>经费：￥{{this.servicelList.活动经费}}</li>
            <li>
              <span>主办人部门：{{this.servicelList.主办人部门名称}}</span>
              <span>主办人：{{this.servicelList.主办人姓名}}</span>
            </li>
            <li>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{startTime(this.servicelList.开始时间)}}
              </span>
            </li>
            <li>讲座地点：{{this.servicelList.讲座地点}}</li>
            <h4>主讲人信息</h4>
            <li>姓名：{{this.servicelList.主讲人姓名}}</li>
            <li>国别：{{this.servicelList.主讲人国别}}</li>
            <li>单位：{{this.servicelList.主讲人单位}}</li>
            <li>学位：{{this.servicelList.主讲人学位}}</li>
            <li>职称：{{this.servicelList.主讲人职称}}</li>
            <h4>主讲的学术或技术内容概述</h4>
            <li>内容概述：{{this.servicelList.内容概述}}</li>
          </ul>
        </van-tab>
        <van-tab title="审核记录">
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
      lectureList: [],
      index: 1,
      size: 5,
      loading: false,
      finished: false,
      show: false,
      servicelList: [],
      auditList: [],
      active: 0,
      flag: "审核通过"
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
      .contentLi {
        color: #07c160;
      }
      li {
        display: flex;
        padding: 5px 0;
        span:nth-child(2) {
          text-align: right;
        }
        .auditBtn {
          font-size: 12px;
          text-align: right;
          padding: 5px 12px;
          background-color: #07c160;
          border-radius: 5px;
          color: #fff;
        }
        span:nth-child(1) {
          flex-grow: 1;
          i {
            color: rgb(6, 167, 6);
          }
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
