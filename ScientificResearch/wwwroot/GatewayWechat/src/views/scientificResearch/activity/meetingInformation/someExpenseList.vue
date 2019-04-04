<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-huiyi"></i>经费报销列表
    </div>
    <div class="backContentBox" v-for="(item, key) in someExpenseList" :key="key">
      <ul class="backContentTop" @click="detailsPopup(item.报销编号)">
        <li>{{item.项目名称}}</li>
        <li>
          <span>报销编号：</span>
          <span>{{item.报销编号}}</span>
        </li>
        <li>
          <span>报销方式：</span>
          <span>{{item.报销方式}}</span>
        </li>
        <li>
          <span>报销人：</span>
          <span>{{item.报销人姓名}}</span>
        </li>
        <li>
          <span>报销人部门：</span>
          <span>{{item.报销人部门名称}}</span>
        </li>
        <li>
          <span>报销金额：</span>
          <span>{{NumFormat(item.报销金额)}}</span>
        </li>
        <li>
          <span>审核进度：</span>
          <span :style="{'color':(item.审核进度 == flag ? '#31BD5D' : '#FF976A')}">{{item.审核进度}}</span>
        </li>
        <li>
          <span>报销时间：</span>
          <span>
            <i class="icon iconfont icon-shijian1"></i>
            {{startTime(item.报销时间)}}
          </span>
        </li>
        <li>
          <span>当前状态：</span>
          <span id="state">{{item.步骤名称}}-{{item.步骤状态说明}}</span>
        </li>
      </ul>
      <ReturnBtn/>
    </div>
  </van-list>
</template>
<script>
import { NumFormat } from "@/assets/js/common/filter.js";
export default {
  data() {
    return {
      someExpenseList: [],
      loading: false,
      finished: false,
      flag: "已完成-审核通过",
      meetingCode: this.$route.params.item
    };
  },
  created() {},
  mounted() {
    this.getParams();
  },
  methods: {
    getParams() {
      // this.meetingCode = this.$route.params.item;
      var para = {
        参加会议编号: this.meetingCode
      };
      this.$http.getSomeExpenseList(para).then(res => {
        console.log(res, "www");
        this.someExpenseList = res.data;
      });
    },
    detailsPopup(item) {
      console.log(item, "22");
      this.$router.push({
        path: "/reimbursementDetails",
        name: "reimbursementDetails",
        params: {
          item: item,
          code: this.meetingCode
        }
      });
    },
    onLoad() {
      // 异步更新数据
      setTimeout(() => {
        for (let i = 0; i < 0; i++) {
          this.someExpenseList.push(this.someExpenseList.length + 1);
        }
        // 加载状态结束
        this.loading = false;
        // 数据全部加载完成
        if (this.someExpenseList.length >= 0) {
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
        #state {
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
  }
}
</style>
