<template>
  <van-tabs v-model="active" swipeable class="popup">
    <van-tab title="参加会议详情">
      <ul class="servicel">
        <h4>基本信息</h4>
        <li class="title">
          <span>会议名称</span>
          <span>{{this.servicelList.会议名称}}</span>
        </li>
        <li>
          <span>主办单位</span>
          <span>{{this.servicelList.会议主办单位}}</span>
        </li>
        <li>
          <span>承办单位</span>
          <span>{{this.servicelList.会议承办单位}}</span>
        </li>
        <li>
          <span>申请人</span>
          <span>{{this.servicelList.申请人姓名}}</span>
        </li>
        <li>
          <span>申请人部门</span>
          <span>{{this.servicelList.申请人部门名称}}</span>
        </li>
        <li>
          <span>研讨领域</span>
          <span>{{this.servicelList.研讨领域}}</span>
        </li>
        <li>
          <span>学科类型</span>
          <span>{{this.servicelList.学科类型}}</span>
        </li>
        <li>
          <span>开始时间</span>
          <span>{{startTime(this.servicelList.会议开始时间)}}</span>
        </li>
        <li>
          <span>结束时间</span>
          <span>{{startTime(this.servicelList.会议结束时间)}}</span>
        </li>
        <li>
          <span>会议网址</span>
          <a :href="this.servicelList.会议网址">{{this.servicelList.会议网址}}</a>
        </li>
        <li>
          <span>会议地址</span>
          <span>{{this.servicelList.会议地址}}</span>
        </li>
        <li>
          <span>往返时间</span>
          <span>{{this.servicelList.往返时间}} 天</span>
        </li>
        <h4>会议简介及申请理由</h4>
        <li class="title">
          <span>会议简介：</span>
          <span>{{this.servicelList.会议简介及申请理由}}</span>
        </li>
        <h4>参会相关文件</h4>
        <li>参会相关文件：</li>
        <li>
          <a
            :href="this.servicelList.参会相关文件路径"
            download
          >{{Interception(this.servicelList.参会相关文件路径)}}</a>
        </li>
      </ul>
    </van-tab>
    <van-tab title="申请记录">
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
            {{conversionTime(item.执行时间)}}
          </span>
        </li>
        <li>
          <span>备注</span>
          <span>{{item.备注}}</span>
        </li>
      </ul>
    </van-tab>
    <ReturnTop/>
    <ReturnBtn/>
  </van-tabs>
</template>
<script>
import { Interception } from "@/assets/js/common/filter.js";
export default {
  data() {
    return {
      servicelList: [],
      auditList: [],
      active: 0,
      flag: "审核通过"
    };
  },
  created() {},
  mounted() {
    this.getDetails();
  },
  methods: {
    getDetails() {
      var para = {
        参加会议编号: this.$route.params.item
      };
      // 获取参会详情
      this.$http.getMeetingDetails(para).then(res => {
        // console.log(res, "222");
        this.servicelList = res.data.参加会议详情;
        this.auditList = res.data.申请情况;
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
    conversionTime(item) {
      if (item != null) {
        return item;
      } else {
        return "待定";
      }
    },
    Interception(item) {
      return Interception(item);
    }
  }
};
</script>
<style lang="less" scoped>
.popup {
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
