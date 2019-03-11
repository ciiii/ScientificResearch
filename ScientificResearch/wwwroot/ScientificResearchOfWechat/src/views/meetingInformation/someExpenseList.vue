<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-huiyi"></i>经费报销列表
    </div>
    <div class="backContentBox" v-for="(item, key) in someExpenseList" :key="key">
      <ul class="backContentTop" @click="detailsPopup(item.报销编号)">
        <li>{{item.项目名称}}</li>
        <li>
          <i class="icon iconfont icon-you"></i>
        </li>
      </ul>
      <ul>
        <li>
          <span>报销编号：{{item.报销编号}}</span>
          <span>报销方式：{{item.报销方式}}</span>
        </li>
        <li>
          <span>报销人：{{item.报销人姓名}}</span>
          <span>报销人部门：{{item.报销人部门名称}}</span>
        </li>
        <li>报销金额：￥{{item.报销金额}}</li>
        <li :style="{'color':(item.审核进度 == flag ? '#31BD5D' : '#FF976A')}">{{item.审核进度}}</li>
        <li>
          <span>
            报销时间：
            <i class="icon iconfont icon-shijian1"></i>
            {{startTime(item.报销时间)}}
          </span>
        </li>
      </ul>
    </div>
    <van-popup v-model="show" class="popup">
      <van-tabs v-model="active" swipeable>
        <van-tab title="报销信息">
          <ul class="servicel">
            <h4>基本信息</h4>
            <li>{{this.someExpenseDetails.项目名称}}</li>
            <li>
              <span>项目类型：{{this.someExpenseDetails.项目类型}}</span>
              <span>报销编号：{{this.someExpenseDetails.报销编号}}</span>
            </li>
            <li>
              <span>报销金额：{{this.someExpenseDetails.报销金额}}</span>
              <span>报销经费用途：{{this.someExpenseDetails.报销经费用途}}</span>
            </li>
            <li>
              <span>报销方式：{{this.someExpenseDetails.报销方式}}</span>
              <span>公务卡号：{{this.someExpenseDetails.公务卡号}}</span>
            </li>
            <li>
              <span>公务卡所属人：{{this.someExpenseDetails.公务卡所属人姓名}}</span>
              <span>报销时间：{{startTime(this.someExpenseDetails.报销时间)}}</span>
            </li>
            <li>
              <span>报销人：{{this.someExpenseDetails.报销人姓名}}</span>
              <span>报销人部门：{{this.someExpenseDetails.报销人部门名称}}</span>
            </li>
            <h4>参会相关文件</h4>
            <li>参会相关文件：{{this.someExpenseDetails.参会相关文件路径}}</li>
          </ul>
        </van-tab>
        <van-tab title="审核记录">
          <ul v-for="(item,key) in expenseAudit" :key="key" class="audit">
            <li>步骤名称：{{item.名称}}</li>
            <li>
              <span>处理人：{{item.姓名}}</span>
              <span>部门：{{item.部门名称}}</span>
            </li>
            <li class="state">
              <span :style="{'color':(item.状态说明 == state ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
              <span>
                <i class="icon iconfont icon-shijian1"></i>
                {{conversionTime(item.执行时间)}}
              </span>
            </li>
            <li>备注：{{item.备注}}</li>
          </ul>
        </van-tab>
        <van-tab title="报销详情">
          <ul v-for="(item,key) in expenseList" :key="key" class="audit">
            <li>报销科目：{{item.财务科目}}</li>
            <li>支出类型：{{item.项目支出类型}}</li>
            <li class="state">
              <span>支出内容：{{item.项目支出内容}}</span>
              <span>批准经费：￥{{NumFormat(item.批准经费)}}</span>
            </li>
            <li>
              <span>配套经费：￥{{NumFormat(item.配套经费)}}</span>
            </li>
            <li>
              <span>已报销：￥{{NumFormat(item.已报销金额)}}</span>
              <span>报销金额：￥{{NumFormat(item.报销金额)}}</span>
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
    conversionTime(item) {
      if (item != null) {
        return item;
      } else {
        return "待定";
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
