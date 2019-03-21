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
          <span>{{item.报销金额}}</span>
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
    </div>
    <van-popup v-model="show" class="popup">
      <van-tabs v-model="active" swipeable>
        <van-tab title="报销信息">
          <ul class="servicel">
            <h4>基本信息</h4>
            <li class="title">
              <span>项目名称</span>
              <p>{{this.someExpenseDetails.项目名称}}</p>
            </li>
            <li>
              <span>项目类型</span>
              <span>{{this.someExpenseDetails.项目类型}}</span>
            </li>
            <li>
              <span>报销编号</span>
              <span>{{this.someExpenseDetails.报销编号}}</span>
            </li>
            <li>
              <span>报销金额</span>
              <span>{{this.someExpenseDetails.报销金额}}</span>
            </li>
            <li>
              <span>报销经费用途</span>
              <span>{{this.someExpenseDetails.报销经费用途}}</span>
            </li>
            <li>
              <span>报销方式</span>
              <span>{{this.someExpenseDetails.报销方式}}</span>
            </li>
            <li>
              <span>公务卡号</span>
              <span>{{this.someExpenseDetails.公务卡号}}</span>
            </li>
            <li>
              <span>公务卡所属人</span>
              <span>{{this.someExpenseDetails.公务卡所属人姓名}}</span>
            </li>
            <li>
              <span>报销时间</span>
              <span>{{startTime(this.someExpenseDetails.报销时间)}}</span>
            </li>
            <li>
              <span>报销人</span>
              <span>{{this.someExpenseDetails.报销人姓名}}</span>
            </li>
            <li>
              <span>报销人部门</span>
              <span>{{this.someExpenseDetails.报销人部门名称}}</span>
            </li>
            <h4>参会相关文件</h4>
            <li>参会相关文件：{{this.someExpenseDetails.参会相关文件路径}}</li>
          </ul>
        </van-tab>
        <van-tab title="审核记录">
          <ul v-for="(item,key) in expenseAudit" :key="key" class="audit">
            <li>
              <span>步骤名称</span>
              <span>{{item.名称}}</span>
            </li>
            <li>
              <span>处理人</span>
              <span>{{item.姓名}}</span>
            </li>
            <li>
              <span>部门</span>
              <span>{{item.部门名称}}</span>
            </li>
            <li>
              <span>当前状态</span>
              <span :style="{'color':(item.状态说明 == state ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
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
        <van-tab title="报销详情">
          <ul v-for="(item,key) in expenseList" :key="key" class="audit">
            <li>
              <span>报销科目</span>
              <span>{{item.财务科目}}</span>
            </li>
            <li>
              <span>支出类型</span>
              <span>{{item.项目支出类型}}</span>
            </li>
            <li>
              <span>支出内容</span>
              <span>{{item.项目支出内容}}</span>
            </li>
            <li>
              <span>批准经费</span>
              <span>{{NumFormat(item.批准经费)}}</span>
            </li>
            <li>
              <span>配套经费</span>
              <span>{{NumFormat(item.配套经费)}}</span>
            </li>
            <li>
              <span>已报销</span>
              <span>{{NumFormat(item.已报销金额)}}</span>
            </li>
            <li>
              <span>报销金额</span>
              <span>{{NumFormat(item.报销金额)}}</span>
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
  </van-list>
</template>
<script>
import { NumFormat } from "@/assets/js/common/filter.js";
export default {
  data() {
    return {
      someExpenseList: [],
      someExpenseDetails: [],
      expenseAudit: [],
      expenseList: [],
      active: 0,
      show: false,
      loading: false,
      finished: false,
      flag: "已完成-审核通过",
      state: "审核通过"
    };
  },
  created() {
    document.title = "参会经费报销列表";
    this.getParams();
  },
  mounted() {},
  methods: {
    getParams() {
      var para = {
        参加会议编号: this.$route.params.item
      };
      this.$http.getSomeExpenseList(para).then(res => {
        console.log(res, "www");
        this.someExpenseList = res.data;
      });
    },
    detailsPopup(item) {
      var para = {
        报销编号: item
      };
      this.$http.getSomeExpenseDetails(para).then(res => {
        console.log(res, "2132132");
        this.someExpenseDetails = res.data.报销基本信息;
        this.expenseAudit = res.data.报销审核记录;
        this.expenseList = res.data.本次报销项目列表;
      });
      this.show = true;
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
