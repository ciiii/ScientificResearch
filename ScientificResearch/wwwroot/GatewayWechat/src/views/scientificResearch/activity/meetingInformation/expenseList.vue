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
          <i class="icon iconfont icon-gonghuijingfeibaoxiao"></i>参会经费报销管理
        </div>
        <div class="backContentBox" v-for="(item, key) in expenseList" :key="key">
          <ul class="backContentTop" @click="goExpenseDetails(item.编号)">
            <li>{{item.会议名称}}</li>
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
              <span>研讨领域：</span>
              <span>{{item.研讨领域}}</span>
            </li>
            <li>
              <span>学科类型：</span>
              <span>{{item.学科类型}}</span>
            </li>
            <li>
              <span>已审核：</span>
              <span :style="{'color':'#31BD5D',fontWeight: 'bold' }">{{NumFormat(item.已审核报销)}}</span>
            </li>
            <li>
              <span>待审核：</span>
              <span :style="{'color':'#FF976A',fontWeight: 'bold'}">{{NumFormat(item.待审核报销)}}</span>
            </li>
            <li>
              <span>开始时间：</span>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{startTime(item.会议开始时间)}}
              </span>
            </li>
          </ul>
          <span class="audit" @click="goMeetingsList(item.编号)">参会详情</span>
        </div>
      </van-list>
    </van-pull-refresh>
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
      expenseList: [],
      loading: false,
      finished: false
    };
  },
  methods: {
    onLoad() {
      this.$http.getExpenseList(this.index, this.size).then(res => {
        this.total = res.data.total;
        const data = this.expenseList;
        this.expenseList = data.concat(res.data.list);
        this.loading = false;
        this.index++;
        if (this.expenseList.length >= this.total) {
          this.finished = true;
          // 删除本地 参见会议编号
          localStorage.removeItem("meetingID");
        }
      });
    },
    onDownRefresh() {
      setTimeout(() => {
        this.reload();
        this.isDownLoading = false;
      }, 1000);
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
    // 跳转参会详情
    goMeetingsList(item) {
      this.$router.push({
        path: "/meetingDetails",
        name: "meetingDetails",
        params: {
          item: item
        }
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
    margin-top: 10px;
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
}
</style>
