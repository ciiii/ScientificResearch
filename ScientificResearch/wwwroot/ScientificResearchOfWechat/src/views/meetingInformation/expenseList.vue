<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-gonghuijingfeibaoxiao"></i>参会经费报销信息
    </div>
    <div class="backContentBox" v-for="(item, key) in expenseList" :key="key">
      <ul class="backContentTop" @click="goExpenseDetails(item.编号)">
        <li>{{item.会议名称}}</li>
        <li>
          <i class="icon iconfont icon-you"></i>
        </li>
      </ul>
      <ul>
        <li>
          <span>主办单位：{{item.会议主办单位}}</span>
        </li>
        <li>
          <span>申请人：{{item.申请人姓名}}</span>
          <span>申请人部门：{{item.申请人部门名称}}</span>
        </li>
        <li>会议地址：{{item.会议地址}}</li>
        <li>
          <span>研讨领域：{{item.研讨领域}}</span>
          <span>学科类型：{{item.学科类型}}</span>
        </li>
        <li>
          <span :style="{'color':'#31BD5D',fontWeight: 'bold' }">已审核：￥{{NumFormat(item.已审核报销)}}</span>
          <span :style="{'color':'#FF976A',fontWeight: 'bold'}">待审核：￥{{NumFormat(item.待审核报销)}}</span>
        </li>
        <li>
          <span>
            <i class="icon iconfont icon-shijian1"></i>
            {{startTime(item.会议开始时间)}}
          </span>
          <span class="auditBtn" @click="goMeetingsList(item.编号)">参会信息</span>
        </li>
      </ul>
    </div>
    <van-popup v-model="show" class="popup">
      <van-tabs v-model="active" swipeable>
        <van-tab title="参加会议详情">
          <ul class="servicel">
            <h4>基本信息</h4>
            <li>{{this.servicelList.会议名称}}</li>
            <li>
              <span>主办单位：{{this.servicelList.会议主办单位}}</span>
              <span>承办单位：{{this.servicelList.会议承办单位}}</span>
            </li>
            <li>
              <span>申请人：{{this.servicelList.申请人姓名}}</span>
              <span>申请人部门：{{this.servicelList.申请人部门名称}}</span>
            </li>
            <li>
              <span>研讨领域：{{this.servicelList.研讨领域}}</span>
              <span>学科类型：{{this.servicelList.学科类型}}</span>
            </li>
            <li>
              <span>开始：{{startTime(this.servicelList.会议开始时间)}}</span>
              <span>结束：{{startTime(this.servicelList.会议结束时间)}}</span>
            </li>
            <li>
              会议网址：
              <a :href="this.servicelList.会议网址">{{this.servicelList.会议网址}}</a>
            </li>
            <li>
              <span>会议地址：{{this.servicelList.会议地址}}</span>
              <span>往返时间：{{this.servicelList.往返时间}} 天</span>
            </li>
            <h4>会议简介及申请理由</h4>
            <li>会议简介：{{this.servicelList.会议简介及申请理由}}</li>
            <h4>参会相关文件</h4>
            <li>参会相关文件：{{this.servicelList.参会相关文件路径}}</li>
          </ul>
        </van-tab>
        <van-tab title="申请记录">
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
        <i class="icon iconfont icon-fanhui"></i> 返回
      </div>
    </van-popup>
  </van-list>
</template>
<script>
import { NumFormat } from "@/assets/js/common/filter.js";
export default {
  data() {
    return {
      index: 1,
      size: 5,
      active: 0,
      show: false,
      flag: "审核通过",
      expenseList: [],
      SomeExpenseList: [],
      servicelList: [],
      auditList: [],
      loading: false,
      finished: false
    };
  },
  created() {
    document.title = "参会经费报销管理";
  },
  mounted() {
    this.getExpense();
  },
  methods: {
    onLoad() {
      // 异步更新数据
      setTimeout(() => {
        for (let i = 0; i < 0; i++) {
          this.expenseList.push(this.expenseList.length + 1);
        }
        // 加载状态结束
        this.loading = false;
        // 数据全部加载完成
        if (this.expenseList.length >= 0) {
          this.finished = true;
        }
      }, 500);
    },
    getExpense() {
      this.$http.getExpenseList(this.index, this.size).then(res => {
        // console.log(res, "eeeeeee");
        this.expenseList = res.data.list;
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
    //获取某参加会议报销列表
    goExpenseDetails(item) {
      this.$router.push({
        path: "/someExpenseList",
        name: "someExpenseList",
        params: {
          item: item
        }
      });
    },
    // 跳转参会反馈列表
    goMeetingsList(item) {
      var para = {
        参加会议编号: item
      };
      this.$http.getMeetingDetails(para).then(res => {
        console.log(res, "222");
        this.servicelList = res.data.参加会议详情;
        this.auditList = res.data.申请情况;
      });
      this.show = true;
    },
    // 关闭弹窗
    backtrack() {
      this.show = false;
    },
    //转换金额格式
    NumFormat(item) {
      return NumFormat(item);
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
    padding: 10px 0;
    background-color: #fff;
    i {
      font-weight: 800;
      color: #d4237a;
      margin-right: 5px;
    }
  }
  .backContentBox {
    padding: 8px 15px;
    margin-top: 10px;
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
