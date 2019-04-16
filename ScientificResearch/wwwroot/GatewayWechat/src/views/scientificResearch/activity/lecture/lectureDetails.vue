<template>
  <van-tabs v-model="active" swipeable class="popup">
    <van-tab title="学术任职详情">
      <ul class="servicel">
        <h4>基本信息</h4>
        <li class="title">
          <span>活动名称</span>
          <span>{{this.servicelList.活动名称}}</span>
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
    <ReturnBtn/>
  </van-tabs>
</template>
<script>
export default {
  data() {
    return {
      servicelList: [],
      auditList: [],
      active: 0,
      flag: "审核通过"
    };
  },
  created() {
    this.goDetails();
  },
  mounted() {},
  methods: {
    // 查看详情
    goDetails() {
      var para = {
        主办讲座编号: this.$route.params.item
      };
      // 获取讲座详情
      this.$http.getLectureDetails(para).then(res => {
        this.servicelList = res.data.学术任职详情;
        this.auditList = res.data.审核情况;
      });
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
    }
  }
};
</script>
<style lang="less" scoped>
.popup {
  text-align: left;
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
    .title {
      display: flex;
      align-items: center;
      span:nth-child(1) {
        width: 30%;
      }
      span:nth-child(2) {
        padding-left: 10px;
      }
    }
  }
}
</style>
